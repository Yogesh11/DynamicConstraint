//
//  ApiManager.m
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import "ApiManager.h"
#import "ApiCall.h"
#import "DataManager.h"

@implementation ApiManager

+(id)sharedInstance{
    static ApiManager *apiManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        apiManager  = [[ApiManager alloc] init];
    });
    return apiManager;
}

-(void)jsonFeed:(Completion)completion {
    ApiCall *apiCall = [[ApiCall alloc] init];
    [apiCall fetchFeed:^(NSDictionary *response, Error *error) {
        if (response != nil) {
            [[DataManager sharedInstance] prepareFeedModel:response];
        }
        completion(response , error);
    }];
}

@end
