//
//  SearchBarView.m
//  TestForEvery
//
//  Created by Garry on 2016/10/12.
//  Copyright © 2016年 richinfo. All rights reserved.
//

#import "SearchBarView.h"

#import "UIColor+Extension.h"
#import "UIView+Extension.h"

@interface SearchBarView ()

@property (nonatomic, strong) UITextField *searchBarTextField;
@property (nonatomic, strong) UIImageView *magnifierImageView;

@end

@implementation SearchBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubViews];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setupSubViews];
    }
    
    return self;
}

- (void)setupSubViews
{
    [self addSubview:self.searchBarTextField];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat searchBarTextFieldX = 0;
    CGFloat searchBarTextFieldY = 5;
    CGFloat searchBarTextFieldW = self.width;
    CGFloat searchBarTextFieldH = 34;
    self.searchBarTextField.frame = CGRectMake(searchBarTextFieldX, searchBarTextFieldY, searchBarTextFieldW, searchBarTextFieldH);

}

#pragma mark - Getter methods
- (UITextField *)searchBarTextField
{
    if (!_searchBarTextField)
    {
        _searchBarTextField = [UITextField new];
        _searchBarTextField.backgroundColor = [UIColor whiteColor];
        _searchBarTextField.layer.borderColor = [UIColor colorWithHexString:@"#dddddd"].CGColor;
        _searchBarTextField.layer.borderWidth = 0.5f;
        _searchBarTextField.layer.cornerRadius = 5;
        _searchBarTextField.layer.masksToBounds= YES;
        _searchBarTextField.placeholder = @"Searching for something new";
        _searchBarTextField.leftView = self.magnifierImageView;
        _searchBarTextField.leftViewMode = UITextFieldViewModeAlways;
        [_searchBarTextField setValue:[UIColor colorWithHexString:@"#999999"] forKeyPath:@"placeholderLabel.textColor"];
    }
    
    return _searchBarTextField;
}

- (UIImageView *)magnifierImageView
{
    if (!_magnifierImageView)
    {
        _magnifierImageView = [UIImageView new];
        _magnifierImageView.image = [UIImage imageNamed:@"fa-search.png"];
        _magnifierImageView.frame = CGRectMake(0, 0, 34, 34);
        _magnifierImageView.contentMode = UIViewContentModeCenter;
    }
    
    return _magnifierImageView;
}


@end
