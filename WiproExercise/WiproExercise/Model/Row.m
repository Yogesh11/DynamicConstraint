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

-(void)prepareModel :(NSDictionary *)json {
   title        = [Constant validString:[json valueForKey: kTitle]]       ;
   subtitle     = [Constant validString:[json valueForKey: kdescription]] ;
   imageHref    = [Constant validString:[json valueForKey: kimageHref]]   ;
}

-(BOOL)isAValidObject {
    if (title == nil && subtitle == nil && imageHref == nil) {
        return false ;
    }
    return  true ;
}
@end
