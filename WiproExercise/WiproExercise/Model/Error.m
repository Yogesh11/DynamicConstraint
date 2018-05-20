
//
//  Error.m
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import "Error.h"
#import "Constant.h"


@implementation Error
@synthesize title       ;
@synthesize message     ;
@synthesize errorCode   ;

-(void)prepareModel:(NSString *)  errorTitle
           message :(NSString *)  errorMessage
         errorCode :(NSInteger)   errorCode {

    title            = [self checkForValidString:errorTitle]   ? errorTitle   : kErrorTitle      ;
    message          = [self checkForValidString:errorMessage] ? errorMessage : kErrorMessage    ;
    self.errorCode   = (errorCode == 0)                        ?  kErrorCode  : errorCode        ;
}


-(BOOL)checkForValidString:(NSString *)str{
    if(str  && str.length > 0 ) {
        return  true ;
    }
    return  false ;
}

@end
