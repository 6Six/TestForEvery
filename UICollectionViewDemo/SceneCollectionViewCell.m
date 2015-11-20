//
//  SceneCollectionViewCell.m
//  AnjiProject
//
//  Created by Garry on 15/8/20.
//  Copyright (c) 2015年 Mobkid Company. All rights reserved.
//

#import "SceneCollectionViewCell.h"

@interface SceneCollectionViewCell ()

@property (nonatomic, strong) UIImageView *sceneImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation SceneCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.sceneImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        [self.sceneImageView setFrame:CGRectMake(0, 20, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        [self.sceneImageView setBackgroundColor:[UIColor orangeColor]];
        [self.contentView addSubview:_sceneImageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_sceneImageView.frame) + 10, 30, 20)];
        [self.titleLabel setCenter:CGPointMake(_sceneImageView.center.x, _titleLabel.center.y)];
        [self.titleLabel setBackgroundColor:[UIColor redColor]];
        [self.titleLabel setTextColor:[UIColor blackColor]];
        [self.titleLabel setFont:[UIFont systemFontOfSize:12.0]];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:_titleLabel];
    }
    
    return self;
}

- (void)setSceneImage:(NSString *)imageName
{
    [_sceneImageView setImage:[UIImage imageNamed:imageName]];
}

- (void)setTitle:(NSString *)title
{
    [_titleLabel setText:title];
}

@end
