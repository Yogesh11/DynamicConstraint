//
//  Row.h
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Row : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *imageHref;
-(void)prepareModel :(NSDictionary *)json;
@end
