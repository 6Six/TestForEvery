//
//  ViewController.m
//  MJRefreshDemo
//
//  Created by Garry on 15/10/28.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"
#import "UIView+MJExtension.h"
#import "MJRefresh.h"

@interface ViewController ()
<UITableViewDataSource,
UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadTableView];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadTableView
{
    if (!_tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        [self.tableView setDataSource:self];
        [self.tableView setDelegate:self];
        [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    }
    
    if (!_tableView.superview)
    {
        [self.view addSubview:_tableView];
    }
    
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.dataArray addObjectsFromArray:@[@"", @"", @"", @"", @""]];
            
            [_tableView.header endRefreshing];
            [_tableView reloadData];
        });
    }];
    
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.dataArray addObjectsFromArray:@[@"", @"", @"", @"", @""]];
            
            [_tableView.footer endRefreshing];
            [_tableView reloadData];
        });
    }];
    
}

#pragma mark - 加载数据
- (void)loadData
{
    if (!_dataArray)
    {
        self.dataArray = [@[@"1", @"2", @"3", @"4", @"5"] mutableCopy];
    }
    
    
}


#pragma mark - UITableView datasource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIden = @"cellIden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIden];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIden];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"text:%@", @(indexPath.row)];
    
    return cell;
}


#pragma mark - UITableView delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
