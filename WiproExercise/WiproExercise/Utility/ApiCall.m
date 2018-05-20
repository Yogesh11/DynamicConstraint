//
//  ApiCall.m
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import "ApiCall.h"
#import "Constant.h"

@interface ApiCall ()<NSURLConnectionDelegate>{
    Completion runningBlock         ;
    NSMutableData *responseData    ;
}
@end

@implementation ApiCall

-(void)fetchFeed:(Completion) completion {
    runningBlock   = completion;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:kJsonUrl]];
    request.timeoutInterval = 60.0;
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    NSLog(@"Connection = %@", conn);
}

-(BOOL)validResponseData{
    if (responseData && responseData.length > 0) {
        return  true ;
    }
    return  false ;
}

-(void)failure:(NSError *) error{
    if (runningBlock) {
        runningBlock(nil , [self prepareCustomErrorFromNSError : error]);
    }
}

-(void)success:(NSDictionary *)json{
    if (runningBlock) {
        runningBlock(json , nil);
    }
}

-(Error *) prepareCustomErrorFromNSError:(NSError *)error {
    Error *customError =  [[Error alloc] init];
    [customError prepareModel:nil
                      message:error.localizedDescription
                    errorCode:error.code];
    return customError;
}


#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    if ([self validResponseData] == true){
        NSError *error  = nil;
        NSString *iso = [[NSString alloc] initWithData:responseData encoding:NSISOLatin1StringEncoding];
        NSData *dutf8 = [iso dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:dutf8 options:NSJSONReadingMutableContainers error:&error];
        if(error) {
            [self failure:error];
        } else{
            [self success:jsonDict];
        }
    }
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    [self failure:error];
}


@end
