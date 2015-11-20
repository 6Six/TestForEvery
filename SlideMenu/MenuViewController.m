//
//  MenuViewController.m
//  TestForEvery
//
//  Created by Garry on 15/6/11.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "MenuViewController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"

#import "UIViewController+RESideMenu.h"
#import "RESideMenu.h"

@interface MenuViewController ()
<UITableViewDataSource,
UITableViewDelegate,
RESideMenuDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!_tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        self.tableView.opaque = NO;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.backgroundView = nil;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.bounces = NO;
        self.tableView.scrollsToTop = NO;
    }
    
    if (_tableView.superview)
    {
        [self.view addSubview:_tableView];
    }
    
    if (!_dataArray)
    {
        self.dataArray = @[@"First", @"Second"];
    }
    
    [self.tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idenCell = @"cellIden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idenCell];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.row < _dataArray.count)
    {
        cell.textLabel.text = _dataArray[indexPath.row];
    }
    
    return cell;
}

#pragma mark - UITableView delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row)
    {
        case 0:
        {
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"firstViewController"]] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        case 1:
        {
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"secondViewController"]] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
        }
            break;
        default:
            break;
    }
}
























@end
