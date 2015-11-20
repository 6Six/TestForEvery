//
//  ViewController.m
//  QRCodeReaderDemo
//
//  Created by Garry on 15/10/28.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"
#import "QRCodeReaderViewController.h"
#import "QRCodeReader.h"


@interface ViewController ()
<QRCodeReaderDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scan:(id)sender
{
    if ([QRCodeReader supportsMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]])
    {
        static QRCodeReaderViewController *reader = nil;
        static dispatch_once_t onceToken;
        
        dispatch_once(&onceToken, ^{
            reader = [QRCodeReaderViewController new];
            reader.modalPresentationStyle = UIModalPresentationFormSheet;
        });
        
//        reader.delegate = self;
        
        [reader setCompletionWithBlock:^(NSString * _Nullable resultAsString) {
            NSLog(@"Completion with result:%@", resultAsString);
            
            [self dismissViewControllerAnimated:YES completion:^{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                               message:resultAsString
                                                                        preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定"
                                                                   style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                                                 }];
                [alert addAction:okAction];
                [self presentViewController:alert animated:YES completion:nil];
            }];
        }];
        
        [self presentViewController:reader animated:YES completion:nil];
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"Reader not supported by the current device"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
    }
}


#pragma mark - QRCodeReaderDelegate methods
- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                       message:result
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [alert dismissViewControllerAnimated:YES completion:nil];
                                                         }];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }];
    
    
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
