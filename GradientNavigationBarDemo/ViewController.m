//
//  ViewController.m
//  GradientNavigationBarDemo
//
//  Created by Garry on 2016/10/12.
//  Copyright © 2016年 richinfo. All rights reserved.
//

#import "ViewController.h"

#import "SearchBarView.h"

#import "UIViewController+Extension.h"
#import "UIColor+Extension.h"
#import "UIImage+Extension.h"
#import "UIView+Extension.h"

#define kScaleLength(length) (length) * [UIScreen mainScreen].bounds.size.width / 320.0f

@interface ViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SearchBarView *titleView;
@property (nonatomic, strong) SearchBarView *searchBarView;

@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    
    [self.navigationItem setTitleView:self.titleView];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self scrollViewDidScroll:self.tableView];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.navigationController.view addSubview:self.searchBarView];
    
    [self.searchBarView loomingAnimationWithDuration:0.25];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat searchBarViewX = 8;
    CGFloat searchBarViewW = self.titleView.width;
    CGFloat searchBarViewH = self.titleView.height;
    
    CGFloat searchBarViewY = kScaleLength(210) + searchBarViewH - self.tableView.contentOffset.y - searchBarViewH;
    self.searchBarView.frame = CGRectMake(searchBarViewX, searchBarViewY, searchBarViewW, searchBarViewH);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [self navigationBarGradualChangeWithScrollView:scrollView titleView:self.titleView movableView:self.searchBarView offset:kScaleLength(190.5) color:[UIColor colorWithHexString:@"#57c2de"]];

}

#pragma mark - UITabeView datasource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.section)
    {
        return 210.0;
    }
    
    return 50.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (0 == section)
    {
        return 1;
    }
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIden = @"cellIden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIden];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIden];
    }
    
    if (0 == indexPath.section)
    {
        UITableViewCell *imageCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banner.png"]];
        imageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 210);
        [imageCell.contentView addSubview:imageView];
        
        return imageCell;
    }

    if (indexPath.row < self.dataArray.count)
    {
        cell.textLabel.text = [NSString stringWithFormat:@"index %@", self.dataArray[indexPath.row]];
    }
    
    return cell;
}

#pragma mark - UITableView delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - Getter methods
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);

    }
    
    return _tableView;
}

- (SearchBarView *)titleView
{
    if (!_titleView)
    {
        _titleView = [[SearchBarView alloc] initWithFrame:self.navigationController.navigationBar.frame];
    }
    
    return _titleView;
}

- (SearchBarView *)searchBarView
{
    if (!_searchBarView)
    {
        _searchBarView = [SearchBarView new];
    }
    
    return _searchBarView;
}

- (NSArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = @[@"1",
                       @"2",
                       @"3",
                       @"4",
                       @"5",
                       @"6",
                       @"7",
                       @"8",
                       @"9",
                       @"10",
                       @"11",
                       @"12",
                       @"13",
                       @"14",
                       @"15",
                       @"16",
                       @"17",
                       @"18",
                       @"19",
                       @"20"];
    }
    
    return _dataArray;
}

@end
