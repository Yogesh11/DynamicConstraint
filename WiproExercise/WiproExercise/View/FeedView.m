//
//  FeedView.m
//  WiproExercise
//
//  Created by test on 5/20/18.
//  Copyright © 2018 test. All rights reserved.
//

#import "FeedView.h"
#import "Row.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface FeedView ()
@property (nonatomic, strong) UILabel      *titleLabel      ;
@property (nonatomic, strong) UILabel      *subTitleLabel   ;
@property (nonatomic, strong) UIImageView  *imageView       ;
@property (nonatomic, strong) UIActivityIndicatorView  *indicatorView       ;
@property (nonatomic, strong) NSLayoutConstraint *titleTop ;
@property (nonatomic, strong) NSLayoutConstraint *imageHeight;
@property (nonatomic, strong) NSLayoutConstraint *imageWidth;
@property(nonatomic, strong)  NSLayoutConstraint *imageTop;
@end

@implementation FeedView
@synthesize titleLabel   ;
@synthesize subTitleLabel;
@synthesize imageView    ;
@synthesize indicatorView;
@synthesize titleTop;
@synthesize imageHeight;
@synthesize imageWidth;
@synthesize imageTop;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)prepareUI{
 [self prepareTitleView];
 [self prepareImageView];
 [self prepareSubtitleView];
 [self updateLayer];
 [self prepareIndicatorView];
 [self setupConstraints];
}

-(void)prepareTitleView{
    titleLabel  = [[UILabel alloc] init];
    titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    titleLabel.numberOfLines = 0;
    titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:titleLabel];
    //[self titleLabelConstraint];

}

-(void)prepareSubtitleView{
    subTitleLabel  = [[UILabel alloc] init];
    subTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    subTitleLabel.numberOfLines = 0;
    subTitleLabel.translatesAutoresizingMaskIntoConstraints = false;
    subTitleLabel.textAlignment = NSTextAlignmentCenter;
    subTitleLabel.textColor = [UIColor colorWithRed:114.0/255.0 green:114.0/255.0 blue:114.0/255.0 alpha:1.0];
    subTitleLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:subTitleLabel];
}

-(void)prepareImageView{
    imageView  = [[UIImageView alloc] init];
    imageView.translatesAutoresizingMaskIntoConstraints = false;
    imageView.backgroundColor = [UIColor clearColor];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = true;
    [self addSubview:imageView];
}

-(void)prepareIndicatorView{
    indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicatorView.hidesWhenStopped = true ;
    indicatorView.translatesAutoresizingMaskIntoConstraints = false;
    indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray ;
    [self addSubview:indicatorView];
    indicatorView.backgroundColor = [UIColor clearColor];

}


-(void)drawUI : (Row *) row {
    if(row.imageHref == nil) {
          imageHeight.constant = 0.0f;
         [indicatorView stopAnimating];
    } else{
        imageHeight.constant = 200;
        imageView.backgroundColor = UIColor.clearColor;
        [indicatorView startAnimating];
        [imageView sd_setImageWithURL:[NSURL URLWithString:row.imageHref] placeholderImage: nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if ((error == nil) || (image != nil)) {
                [self.indicatorView stopAnimating];
            }

        }];
    }
    titleLabel.text     = row.title;
    subTitleLabel.text  = row.subtitle;


}

-(void)setupConstraints{
    NSLayoutConstraint *titleLeading  = [NSLayoutConstraint constraintWithItem   :titleLabel
                                                                 attribute       :NSLayoutAttributeLeading
                                                                 relatedBy       :NSLayoutRelationEqual
                                                                     toItem      :self
                                                                    attribute    :NSLayoutAttributeLeading
                                                                   multiplier    :1.0
                                                                     constant    :4];


    NSLayoutConstraint *subTitleLeading  = [NSLayoutConstraint constraintWithItem   :subTitleLabel
                                                                        attribute   :NSLayoutAttributeLeading
                                                                        relatedBy   :NSLayoutRelationEqual
                                                                            toItem  :titleLabel
                                                                           attribute:NSLayoutAttributeLeading
                                                                          multiplier:1.0
                                                                            constant:0];

    NSLayoutConstraint *subTitleTrailing = [NSLayoutConstraint constraintWithItem   :subTitleLabel
                                                                       attribute   :NSLayoutAttributeTrailing
                                                                       relatedBy   :NSLayoutRelationEqual
                                                                           toItem  :titleLabel
                                                                          attribute:NSLayoutAttributeTrailing
                                                                         multiplier:1.0
                                                                           constant:0];


    titleTop  = [NSLayoutConstraint constraintWithItem   :titleLabel
                                                             attribute       :NSLayoutAttributeTop
                                                             relatedBy       :NSLayoutRelationEqual
                                                                 toItem      :self
                                                                attribute    :NSLayoutAttributeTop
                                                               multiplier    :1.0
                                                                 constant    :4];


    NSLayoutConstraint *titleTrailing  = [NSLayoutConstraint constraintWithItem   :titleLabel
                                                                  attribute       :NSLayoutAttributeTrailing
                                                                  relatedBy       :NSLayoutRelationEqual
                                                                      toItem      :self
                                                                     attribute    :NSLayoutAttributeTrailing
                                                                    multiplier    :1.0
                                                                      constant    :-4];




    imageTop  = [NSLayoutConstraint constraintWithItem   :imageView
                                                             attribute       :NSLayoutAttributeTop
                                                             relatedBy       :NSLayoutRelationEqual
                                                                 toItem      :titleLabel
                                                                attribute    :NSLayoutAttributeBottom
                                                               multiplier    :1.0
                                                                 constant    :4];






    NSLayoutConstraint *imageCenterX = [NSLayoutConstraint constraintWithItem:imageView
                                                                            attribute:NSLayoutAttributeCenterX
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self
                                                                            attribute:NSLayoutAttributeCenterX
                                                                           multiplier:1.0f
                                                                             constant:0.0f];

    NSLayoutConstraint *indicatorCenterX = [NSLayoutConstraint constraintWithItem:indicatorView
                                                                    attribute:NSLayoutAttributeCenterX
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:imageView
                                                                    attribute:NSLayoutAttributeCenterX
                                                                   multiplier:1.0f
                                                                     constant:0.0f];

    NSLayoutConstraint *indicatorCenterY = [NSLayoutConstraint constraintWithItem:indicatorView
                                                                        attribute:NSLayoutAttributeCenterY
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:imageView
                                                                        attribute:NSLayoutAttributeCenterY
                                                                       multiplier:1.0f
                                                                         constant:0.0f];

    imageHeight = [NSLayoutConstraint constraintWithItem:imageView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1.0
                                  constant:200];
    [imageView addConstraint:imageHeight];


    imageWidth  =  [NSLayoutConstraint constraintWithItem:imageView
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:imageView
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0];

    [imageView addConstraint:imageWidth];





    NSLayoutConstraint *subTitleTop      = [NSLayoutConstraint constraintWithItem   :subTitleLabel
                                                                        attribute   :NSLayoutAttributeTop
                                                                        relatedBy   :NSLayoutRelationEqual
                                                                            toItem  :imageView
                                                                           attribute:NSLayoutAttributeBottom
                                                                          multiplier:1.0
                                                                            constant:4];




   NSLayoutConstraint *subTitleBottom  = [NSLayoutConstraint constraintWithItem     :subTitleLabel
                                                                 attribute          :NSLayoutAttributeBottom
                                                                 relatedBy          :NSLayoutRelationEqual
                                                                     toItem         :self
                                                                    attribute       :NSLayoutAttributeBottom
                                                                   multiplier       :1.0
                                                                      constant      : -4];

    [self addConstraint:titleLeading ];
    [self addConstraint:titleTrailing];
    [self addConstraint:titleTop];

    [self addConstraint:imageTop];
    [self addConstraint:imageCenterX];
    
    [self addConstraint:indicatorCenterX];
    [self addConstraint:indicatorCenterY];

    [self addConstraint:subTitleTop];
    [self addConstraint:subTitleLeading];
    [self addConstraint:subTitleTrailing];
    [self addConstraint:subTitleBottom];
}

-(void)updateLayer{
    self.layer.cornerRadius     = 4 ;
    self.layer.shadowOffset     = CGSizeMake(0, 2);
    self.layer.shadowColor      =  [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1].CGColor;
    self.layer.shadowOpacity    = 4;
    self.layer.shadowRadius     = 6 ;
    self.layer.borderWidth      = 1 ;
    self.layer.borderColor      = [UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0].CGColor;
    self.backgroundColor        = [UIColor whiteColor];
}
@end
