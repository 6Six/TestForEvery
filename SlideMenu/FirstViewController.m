//
//  FirstViewController.m
//  TestForEvery
//
//  Created by Garry on 15/6/7.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstSubViewController.h"

@interface FirstViewController ()
<UITableViewDataSource,
UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    if (!_tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 380) style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    
    if (!_tableView.superview)
    {
        [self.view addSubview:_tableView];
    }
    
    if (!_dataArray)
    {
        self.dataArray = @[@"1",
                           @"2",
                           @"3",
                           @"4",
                           @"5"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView datasource methods
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
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FirstSubViewController *sub = [[FirstSubViewController alloc] init];
    sub.text = _dataArray[indexPath.row];
    [self.navigationController pushViewController:sub animated:YES];
}


@end
