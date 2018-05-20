//
//  DataManger.m
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
@synthesize currentFeed;
+(id)sharedInstance{
    static DataManager *dataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataManager  = [[DataManager alloc] init];
    });
    return dataManager;
}

-(void)prepareFeedModel:(NSDictionary *)dict{
    currentFeed = [[Feed alloc] init];
    [currentFeed prepareModel:dict];
}



@end
