//
//  ViewController.m
//  ForceTouchDemo
//
//  Created by Garry on 15/11/2.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"

#import "SubViewController.h"

@interface ViewController ()
<UIViewControllerPreviewingDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self check3DTouch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)check3DTouch
{
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        [self registerForPreviewingWithDelegate:self sourceView:self.button];
        
        NSLog(@"3D touch 可用");
    }
    else
    {
        NSLog(@"3D touch 不可用");
    }
}

- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext
              viewControllerForLocation:(CGPoint)location
{
    if ([self.presentedViewController isKindOfClass:[SubViewController class]])
    {
        return nil;
    }
    
    SubViewController *subController = [[SubViewController alloc] init];
    return subController;
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    
    // deep press: bring up the commit view controller (pop)
    [self showViewController:viewControllerToCommit sender:self];
}

- (IBAction)buttonPress:(id)sender
{
    
}

@end
