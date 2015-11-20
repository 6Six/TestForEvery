//
//  ViewController.m
//  NSSortDescriptorDemo
//
//  Created by Garry on 15/7/4.
//  Copyright (c) 2015年 richInfo. All rights reserved.
//

#import "ViewController.h"
#import "People.h"
#import "Book.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *firstNames = @[@"Olice", @"Jack", @"Lucy", @"David", @"Alice"];
    NSArray *lastNames = @[@"Smith", @"Jones", @"Alberts", @"Beckham", @"Elizbeth"];
    NSArray *ages = @[@24, @12, @34, @34, @53];

    
    NSMutableArray *peopleArray = [NSMutableArray array];
    [firstNames enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        People *people = [[People alloc] init];
        people.firstName = firstNames[idx];
        people.lastName = lastNames[idx];
        people.age = ages[idx];
        [peopleArray addObject:people];
    }];
    
    NSSortDescriptor *firstNameSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"firstName"
                                                                              ascending:YES
                                                                               selector:@selector(localizedStandardCompare:)];
    NSSortDescriptor *lastNameSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"lastName"
                                                                             ascending:YES
                                                                              selector:@selector(localizedStandardCompare:)];
    NSSortDescriptor *ageSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"age"
                                                                        ascending:NO];
    
    NSLog(@"Sort by firstName:%@", [peopleArray sortedArrayUsingDescriptors:@[firstNameSortDescriptor]]);
    NSLog(@"Sort by lastName:%@", [peopleArray sortedArrayUsingDescriptors:@[lastNameSortDescriptor]]);
    NSLog(@"Sort by age:%@", [peopleArray sortedArrayUsingDescriptors:@[ageSortDescriptor]]);
    
    // Encoding & UnEncoding
    Book *book = [[Book alloc] init];
    book.title = @"Tiger";
    book.author = @"Garry";
    book.pageCount = 100;
    book.categories = [NSSet setWithArray:@[@"123"]];
    NSData *bookEncodeData = [NSKeyedArchiver archivedDataWithRootObject:book];
    [[NSUserDefaults standardUserDefaults] setObject:bookEncodeData forKey:@"book"];
    
    NSData *myBookData = [[NSUserDefaults standardUserDefaults] objectForKey:@"book"];
    Book *myBook = [NSKeyedUnarchiver unarchiveObjectWithData:myBookData];
    NSLog(@"book:%@", myBook);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
