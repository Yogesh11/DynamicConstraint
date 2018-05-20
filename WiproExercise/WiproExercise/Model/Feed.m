//
//  TableData.m
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import "Feed.h"
#import "Constant.h"
#import "Row.h"

@implementation Feed
@synthesize title;
@synthesize rows ;

-(void)prepareModel : (NSDictionary *)json{
    rows                 = [[NSMutableArray alloc] init];
    title                = [json valueForKey:kTitle];
    NSArray *rowsStorage = [json valueForKey: kRows];
    for(NSDictionary *dict in rowsStorage) {
        Row *row =  [[Row alloc] init];
        [row prepareModel:dict];
        [rows addObject  : row];
    }
}

@end
