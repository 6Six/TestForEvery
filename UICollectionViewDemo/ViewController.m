//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by Garry on 15/8/19.
//  Copyright (c) 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"
#import "SceneCollectionViewCell.h"

static NSString *const kCollectionViewCellIden = @"kCollectionViewCellIden";

@interface ViewController ()
<UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource,
UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadSubView];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark loadSubView
- (void)loadSubView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setItemSize:CGSizeMake(320 / 3, 80)];           //设置cell的尺寸
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];    //设置其布局方向
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);                     //设置其边界
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        self.collectionView.backgroundColor = [UIColor clearColor];
        [self.collectionView registerClass:[SceneCollectionViewCell class] forCellWithReuseIdentifier:kCollectionViewCellIden];
    }
    
    if (!_collectionView.superview)
    {
        [self.view addSubview:_collectionView];
    }
}

#pragma mark loadData
- (void)loadData
{
    self.dataArray = @[@"1",
                       @"2",
                       @"3",
                       @"4"];
}

#pragma mark - UICollectionView Datasource methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SceneCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionViewCellIden forIndexPath:indexPath];
    
    [cell setTitle:[NSString stringWithFormat:@"%ld", (long)indexPath.row]];
    cell.backgroundColor = [UIColor blueColor];
    
    return cell;
}

#pragma mark - UICollectionView delegate methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

@end
