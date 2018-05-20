
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

    title            = [Constant validString:errorTitle]   ? errorTitle   : kErrorTitle      ;
    message          = [Constant validString:errorMessage] ? errorMessage : kErrorMessage    ;
    self.errorCode   = (errorCode == 0)                    ?  kErrorCode  : errorCode        ;
}




@end
