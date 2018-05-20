//
//  TableData.h
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject
@property (nonatomic, strong) NSString       *title;
@property (nonatomic, strong) NSMutableArray *rows;
-(void)prepareModel : (NSDictionary *)json;
@end
