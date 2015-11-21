//
//  ViewController.m
//  OpenFileUsingOtherAppDemo
//
//  Created by Garry on 15/11/21.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *imageView;
}
//@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *cachePath = [[path objectAtIndex:0]stringByAppendingPathComponent:@"123.mp3"];
//    
//    UIDocumentInteractionController *documentController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:cachePath]];
//    documentController.delegate = self;
//    [documentController presentOpenInMenuFromRect:CGRectZero
//                                           inView:self.view
//                                         animated:YES];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openPng:(NSString *)str
{
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:str];

    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    
    if (width > 320) {
        height = (height/width) * 300;
        width = 300;
    }
    
    if (image)
    {
        if (!imageView)
        {
            imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, width, height)];
            [self.view addSubview:imageView];
        }

        [imageView setImage:image];
    }
}













@end
