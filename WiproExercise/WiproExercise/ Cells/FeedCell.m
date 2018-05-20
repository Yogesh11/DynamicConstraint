//
//  FeedCell.m
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import "FeedCell.h"
#import "Row.h"
#import "FeedView.h"

@interface FeedCell ()

@property (nonatomic, strong) FeedView  *parentView   ;
@end

@implementation FeedCell
@synthesize parentView;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        parentView = [[FeedView alloc]init];
        parentView.translatesAutoresizingMaskIntoConstraints = NO;
        [[self contentView ] addSubview:parentView];
        [parentView prepareUI];
        [self updateConstraintsIfNeeded];
        return  self;
    }
    return self;
}


-(void)updateConstraint1{
    NSLayoutConstraint *leading  = [NSLayoutConstraint constraintWithItem   :parentView
                                                                attribute   :NSLayoutAttributeLeading
                                                                relatedBy   :NSLayoutRelationEqual
                                                                    toItem  :self.contentView
                                                                   attribute:NSLayoutAttributeLeading
                                                                  multiplier:1.0
                                                                    constant:10];


    NSLayoutConstraint *top  = [NSLayoutConstraint constraintWithItem   :parentView
                                                            attribute   :NSLayoutAttributeTop
                                                            relatedBy   :NSLayoutRelationEqual
                                                                toItem  :self.contentView
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0
                                                                constant:10];


    NSLayoutConstraint *trailing  = [NSLayoutConstraint constraintWithItem   :parentView
                                                                 attribute   :NSLayoutAttributeTrailing
                                                                 relatedBy   :NSLayoutRelationEqual
                                                                     toItem  :self.contentView
                                                                    attribute:NSLayoutAttributeTrailing
                                                                   multiplier:1.0
                                                                     constant:-10];

    NSLayoutConstraint *bottom  = [NSLayoutConstraint constraintWithItem     :parentView
                                                                 attribute   :NSLayoutAttributeBottom
                                                                 relatedBy   :NSLayoutRelationEqual
                                                                     toItem  :self.contentView
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:-10];


     [self.contentView addConstraint:leading ];
     [self.contentView addConstraint:trailing];
     [self.contentView addConstraint:top];
     [self.contentView addConstraint:bottom];
}



-(void)updateConstraints{
    [super updateConstraints];
    [self updateConstraint1];
}


-(void)updateFeed:(Row *) row{
    if ([row isAValidObject] == true) {
        parentView.alpha = 1.0;
        [parentView drawUI:row];
    } else{
        parentView.alpha = 0.0;
    }

}

@end
