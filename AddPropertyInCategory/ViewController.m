//
//  ViewController.m
//  AddPropertyInCategory
//
//  Created by Garry on 15/11/23.
//  Copyright © 2015年 richinfo. All rights reserved.
//
/**
 *  Add Property in Category
 *
 *  @param void <#void description#>
 *
 *  @return <#return value description#>
 */

#import "ViewController.h"

#import "Model.h"

//#import "SonModel.h"
//#import "SonModel+Test.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    SonModel *son = [[SonModel alloc] init];

//    
//    [son sayHello];
//    [son invokeAllClassMethodWithSelector:@selector(sayHello)];
    
//    FatherModel *father = [[FatherModel alloc] init];
//    [father sayHello];
//    [FatherModel invokeAllClassMethodWithSelector:@selector(sayHello)];
    
    Model *model = [[Model alloc] init];
    NSLog(@"%@", model.description);
    [model performSelector:@selector(setName:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
