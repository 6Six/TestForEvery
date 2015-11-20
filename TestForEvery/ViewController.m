//
//  ViewController.m
//  TestForEvery
//
//  Created by richinfo on 15/5/30.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Parser.h"
#import "TestInfo.h"
#import "TestModel.h"
//#import <SystemConfiguration/CaptiveNetwork.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSNumber *intNumber = [NSNumber numberWithInteger:1];
//    NSNumber *boolNumber = [NSNumber numberWithBool:YES];
//    NSNumber *longNumber = [NSNumber numberWithLong:10];
//    NSNumber *floatNumber = [NSNumber numberWithFloat:1.0];
//    
//    NSLog(@"%@", intNumber);
//    NSLog(@"%@", boolNumber);
//    NSLog(@"%@", longNumber);
//    NSLog(@"%@", floatNumber);
//    
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:@"1234"];
//    NSLog(@"data:%@", data);
    
    NSArray *array = @[@"123", @"sd"];
    
//    UIProgressView *proView = [[UIProgressView alloc] initWithFrame:CGRectMake(10, 100, 100, 10)];
////    [proView setBackgroundColor:[UIColor redColor]];
//    proView.transform = CGAffineTransformMakeScale(1.0, 3.0);
//    [proView setProgressTintColor:[UIColor redColor]];
//    [proView setTrackTintColor:[UIColor blueColor]];
//    [self.view addSubview:proView];
//    
//    [proView setProgress:0.5];
    
//    TestModel *model1 = [[TestModel alloc] init];
//    TestModel *model2 = [[TestModel alloc] init];
//    TestModel *model3 = [[TestModel alloc] init];
//    
//    model1.name = @"ASDFLK";
//    model2.name = @"EIWOskd";
//    model3.name = @"sklckv";
//    
//    NSArray *array = @[model1, model2, model3];
//    
////    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"(name contains[cd] %@)", @"s"]];
//    
//    NSComparisonPredicate *predicate = [NSComparisonPredicate predicateWithLeftExpression:[NSExpression expressionWithFormat:@"name"]
//                                                                          rightExpression:[NSExpression expressionForConstantValue:@"s"]
//                                                                                 modifier:NSDirectPredicateModifier
//                                                                                     type:NSContainsPredicateOperatorType
//                                                                                  options:NSCaseInsensitivePredicateOption];
//    
//    
//    NSArray *tempArray = [array filteredArrayUsingPredicate:predicate];
//    NSLog(@"tempArray:%@", tempArray);
    
//    NSString *imageUrlStr = @"http://img2.imgtn.bdimg.com/it/u=3042410010,1849246464&fm=21&gp=0.jpg";
////    NSStringEncoding utf8 = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF8);
////    imageUrlStr = [imageUrlStr stringByAddingPercentEscapesUsingEncoding:utf8];
////    imageUrlStr = [self encodeToPercentEscapeString:imageUrlStr];
//    NSURL *url = [NSURL URLWithString:imageUrlStr];
//
//    
//    
//    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
//    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] init];
//    NSData *imageData = [NSURLConnection sendSynchronousRequest:theRequest
//                                            returningResponse:&response
//                                                        error:nil];
//    
////    NSData *imageData = [NSData dataWithContentsOfURL:url];
//    UIImage *image = [UIImage imageWithData:imageData];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
//    [imageView setImage:image];
//    [self.view addSubview:imageView];
//    
//    
//    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
//    NSLog(@"Supported interfaces: %@", ifs);
//    id info = nil;
//    for (NSString *ifnam in ifs) {
//        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
//        NSLog(@"%@ => %@", ifnam, info);
//        if (info && [info count]) { break; }
//    }
    
//    NSString *testStr = @"abc123";
//    NSData *data = [NSString dataFromString:testStr];
//    NSLog(@"data:%@", data);
    
//    NSString *num = @"0";
//    NSInteger flag = [num intValue] | 0x0c;
//    NSLog(@"%ld", (long)flag);
    
//    NSArray *array = @[@"1",
//                       @"2",
//                       @"3"];
//    NSLog(@"array:%@", array);
//    
//    // 1, delete an object
//    NSMutableArray *tempArray = [array mutableCopy];
//    [tempArray removeLastObject];
//    NSLog(@"tempArray:%@", tempArray);
//    NSLog(@"array:%@", array);
//    NSLog(@"\n---------------------\n");
//    
//    // replace an object
//    tempArray = [array mutableCopy];
////    [tempArray replaceObjectAtIndex:2 withObject:@"4"];
//    tempArray[2] = @"5";
//    NSLog(@"tempArray:%@", tempArray);
//    NSLog(@"array:%@", array);
    
//    TestInfo *info1 = [[TestInfo alloc] initWithName:@"1" selected:NO];
//    TestInfo *info2 = [[TestInfo alloc] initWithName:@"2" selected:NO];
//    TestInfo *info3 = [[TestInfo alloc] initWithName:@"3" selected:NO];
//    NSArray *array = @[info1, info2, info3];
//    NSArray *tempArray = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:array]];
//    
//    TestInfo *info = tempArray[2];
//    info.isSelect = YES;
//    NSLog(@"array:%@", array);
//    NSLog(@"tempArray:%@", tempArray);
    
    
//    NSDictionary *dic1 = @{@"jow" : @"12",
//                           @"baak" : @"123",
//                           @"ack" : @"1234"};
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
    [dic1 setObject:@"1asdf232" forKey:@"jowasdfase"];
    [dic1 setObject:@"234ds" forKey:@"dksk"];
    [dic1 setObject:@"sadfsadf" forKey:@"skljfcxmv"];

//    NSDictionary *dic2 = @{@"jowe" : @"12",
//                           @"dksk" : @"123",
//                           @"skljfcxmv" : @"1234"};
    
    NSArray *key1 = [dic1 allKeys];
    NSArray *key11 = [dic1 allKeys];
    
//    NSArray *key2 = [dic2 allKeys];
    
    NSLog(@"key1:%@", key1);
    NSLog(@"key11:%@", key11);
//    NSLog(@"key2:%@", key2);
}

- (NSString *)encodeToPercentEscapeString:(NSString *)input
{
    // Encode all the reserved characters, per RFC 3986
    // (<http://www.ietf.org/rfc/rfc3986.txt>)
    NSString *outputStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                                (CFStringRef)input,
                                                                                                NULL,
                                                                                                (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                                kCFStringEncodingUTF8));
    return outputStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
