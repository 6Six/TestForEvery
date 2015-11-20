//
//  ViewController.m
//  VCTransitionDemo
//
//  Created by Garry on 15/9/11.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"

#import "ModalAnimation.h"
#import "SlideAnimation.h"
#import "ShuffleAnimation.h"
#import "ScaleAnimation.h"

@interface ViewController ()
<UIViewControllerAnimatedTransitioning,
UINavigationControllerDelegate,
UITabBarControllerDelegate,
UITableViewDataSource,
UITableViewDelegate>
{
    NSArray *_cellTitles;
    NSArray *_cellActions;
    
    ModalAnimation *_modalAnimation;
    SlideAnimation *_slideAnimation;
    ShuffleAnimation *_shuffleAnimation;
    ScaleAnimation *_scaleAnimation;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Setup our talbe view info
    _cellTitles = @[@"Image View", @"Collection View"];
    _cellActions = @[@"presentImageController", @"presentCollectionController"];
    
    // Load our animation controllers
    _modalAnimation = [[ModalAnimation alloc] init];
    _slideAnimation = [[SlideAnimation alloc] init];
    _shuffleAnimation = [[ShuffleAnimation alloc] init];
    _scaleAnimation = [[ScaleAnimation alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _scaleAnimation.viewForInteraction = nil;
}

#pragma mark - UITableView datasource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.textLabel.text = _cellTitles[indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (0 == section)
    {
        return @"Tap Options for different animations and other settings";
    }
    
    return nil;
}

#pragma mark - UITableView delegate methods
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SEL selector = NSSelectorFromString(_cellActions[indexPath.row]);
    
    if ([self respondsToSelector:selector])
    {
        [self performSelector:selector];
    }
}

#pragma mark - Transitioning delegate (Modal)
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
//    if (![NSUserDefaults standardUserDefaults] boolForKey:user) {
//        <#statements#>
//    }
    
//    if ([fromVC isKindOfClass:CollectionViewController.class])
//    {
//        
//    }
    
    BasicAnimation *animationController;
    
    switch (operation)
    {
        case UINavigationControllerOperationPush:
            animationController.animationType = AnimationTypePresent;
            return animationController;
        case UINavigationControllerOperationPop:
            animationController.animationType = AnimationTypeDismiss;
            return animationController;
        default:
            break;
    }
    
    return nil;
}


- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    if ([animationController isKindOfClass:[ScaleAnimation class]])
    {
        ScaleAnimation *controller = (ScaleAnimation *)animationController;
        if (controller.isInteractive)
        {
            return controller;
        }
        else
        {
            return nil;
        }
    }
    else
    {
        return nil;
    }
}
























@end
