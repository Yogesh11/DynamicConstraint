//
//  Row.m
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import "Row.h"
#import "Constant.h"

@implementation Row
@synthesize title;
@synthesize subtitle;
@synthesize imageHref;

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)prepareModel :(NSDictionary *)json {
   title        = [json valueForKey: kTitle]       ;
   subtitle     = [json valueForKey: kdescription] ;
   imageHref    = [json valueForKey: kimageHref]   ;
}
@end
