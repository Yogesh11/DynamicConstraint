//
//  DataManger.h
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Feed.h"
@interface DataManager : NSObject
@property(nonatomic, strong) Feed *currentFeed;
+(id)sharedInstance;
-(void)prepareFeedModel:(NSDictionary *)dict;
@end
