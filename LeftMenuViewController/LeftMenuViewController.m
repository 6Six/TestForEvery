//
//  LeftMenuViewController.m
//  TestForEvery
//
//  Created by Garry on 15/7/9.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "ConnectDeviceViewController.h"
#import "StoreDataViewController.h"
#import "DeviceInfoViewController.h"

static NSInteger const kSlideMenuMargin = 150;

@interface LeftMenuViewController ()
<UITableViewDataSource,
UITableViewDelegate,
UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIViewController *currentController;


@property (nonatomic, copy) NSArray *contentControllers;

@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self loadTableView];
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Load tableView
- (void)loadTableView
{
    if (!_tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 150) style:UITableViewStylePlain];
        self.tableView.center = CGPointMake(_tableView.center.x, CGRectGetHeight(self.view.frame) / 2);
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    
    if (!_tableView.superview)
    {
        [self.view addSubview:_tableView];
    }
}

#pragma mark - Load data
- (void)loadData
{
    if (!_dataArray)
    {
        self.dataArray = [@[@"1", @"2", @"3"] mutableCopy];
    }
    
    if (!_contentControllers)
    {
        UINavigationController *connectDeviceNavi = [[UINavigationController alloc] initWithRootViewController:
                                                     [[ConnectDeviceViewController alloc] init]];
        UINavigationController *storeDataNavi = [[UINavigationController alloc] initWithRootViewController:
                                                 [[StoreDataViewController alloc] init]];
        UINavigationController *deviceInfoNavi = [[UINavigationController alloc] initWithRootViewController:
                                                  [[DeviceInfoViewController alloc] init]];
        
        _contentControllers = @[connectDeviceNavi, storeDataNavi, deviceInfoNavi];
    }
    
    if (_contentControllers.count > 0)
    {
        _currentController = _contentControllers[0];
        [self addChildViewController:_currentController];
        [self.view addSubview:_currentController.view];
    }
    
    self.view.multipleTouchEnabled = NO;
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)];
    panGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:panGestureRecognizer];
}


#pragma mark - UITableView datasource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *menuCellIden = @"menuCellIden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:menuCellIden];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuCellIden];
    }
    
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableView delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row < _contentControllers.count)
    {
        UINavigationController *newNavi = _contentControllers[indexPath.row];
        
        if (newNavi == _currentController)
        {
            [UIView animateWithDuration:0.3 animations:^{
                [_currentController.view setFrame:self.view.frame];
            }];
            
            return;
        }
        
        [newNavi.view setFrame:_currentController.view.frame];
        
        [self addChildViewController:newNavi];
        [self.view addSubview:newNavi.view];

        
        [UIView animateWithDuration:0.3
                              delay:0.3
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             [newNavi.view setFrame:self.view.frame];
                             [newNavi didMoveToParentViewController:self];
                         } completion:^(BOOL finished) {
                             [_currentController.view setFrame:self.view.frame];
                             
                             [_currentController.view removeFromSuperview];
                             [_currentController removeFromParentViewController];
                             _currentController = nil;
                             
                             _currentController = newNavi;
                         }];
    }
}

#pragma mark Private panGesture method
- (void)panGestureRecognized:(UIPanGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer translationInView:self.view];
    CGRect frame = _currentController.view.frame;
    
    CGFloat beginX = 0;

    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            NSLog(@"began point:%f", point.x);
            beginX = point.x;
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            NSLog(@"change point:%f", point.x);
            
            CGFloat endX = point.x;
            CGFloat valueChanged = endX - beginX;
            
            if (valueChanged < 0)
            {
                valueChanged = 0;
            }
            
            frame.origin.x = valueChanged;

            
            [UIView animateWithDuration:0.3
                             animations:^{
                                 _currentController.view.frame = frame;
                             }];
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            NSLog(@"end point:%f", point.x);
            
            CGFloat endX = point.x;
            CGFloat valueChanged = endX - beginX;
            
            if (valueChanged > kSlideMenuMargin / 2)
            {
                valueChanged = kSlideMenuMargin;
            }
            else if (valueChanged < kSlideMenuMargin / 2)
            {
                valueChanged = 0;
            }
            
            frame.origin.x = valueChanged;
            
            [UIView animateWithDuration:0.3
                             animations:^{
                                 _currentController.view.frame = frame;
                             }];
        }
            break;
        default:
            break;
    }
} 

@end
