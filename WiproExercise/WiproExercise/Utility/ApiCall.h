//
//  ApiCall.h
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"

@interface ApiCall : NSObject
-(void)fetchFeed:(Completion) completion;
@end
