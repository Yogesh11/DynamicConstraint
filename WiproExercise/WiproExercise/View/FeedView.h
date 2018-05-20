//
//  FeedView.h
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Row;
@interface FeedView : UIView
-(void)drawUI : (Row *) row;
-(void)prepareUI;
@end
