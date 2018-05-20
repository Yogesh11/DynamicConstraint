//
//  Constant.h
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Error.h"
/** This class will use to define constant varibales **/
static NSString * kJsonUrl      = @"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json";
static NSString * kTitle        = @"title";
static NSString * kRows         = @"rows";
static NSString * kdescription  = @"description";
static NSString * kimageHref    = @"imageHref";
static NSString * kErrorTitle   = @"Error" ;
static NSString * kErrorMessage = @"Oops!Something went wrong.";
static NSInteger  kErrorCode    = -1;
typedef void(^Completion)(NSDictionary *response , Error *error);


