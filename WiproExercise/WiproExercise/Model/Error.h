//
//  Error.h
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Error : NSObject
@property (nonatomic, strong) NSString       *title     ;
@property (nonatomic, strong) NSString       *message   ;
@property (nonatomic, assign) NSInteger       errorCode ;

-(void)prepareModel:(NSString *)  errorTitle
           message :(NSString *)  errorMessage
         errorCode :(NSInteger)   errorCode ;
@end
