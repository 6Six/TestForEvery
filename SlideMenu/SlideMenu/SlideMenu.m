//
//  SlideMenu.m
//  SlideMenu
//
//  Created by apple on 15/3/9.
//

#import "SlideMenu.h"
#import "LeftView.h"
#define LeftWidth ([[UIScreen mainScreen] bounds].size.width/2.0+50)

@interface SlideMenu ()
<UIScrollViewDelegate,
LeftViewDelegate>
{
    UIView *leftBgView;
    UIView *centerBgView;
    float viewWidth;
    float viewHeight;
}
@end

@implementation SlideMenu

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        //        添加界面元素。
        
         viewWidth=frame.size.width;
         viewHeight=frame.size.height;
       
//        self.alwaysBounceHorizontal=YES;
//        self.bounces = YES;
        self.pagingEnabled = YES;
        self.delegate=self;
        self.userInteractionEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        
        
        leftBgView=[[UIView alloc] init];
        leftBgView.frame = CGRectMake((viewWidth * 0) , 0, viewWidth, viewHeight);
        leftBgView.clipsToBounds=YES;
        [self addSubview:leftBgView];
        
        LeftView *leftView=[[LeftView alloc] initWithFrame:CGRectMake(WScreen-LeftWidth , 0, LeftWidth, viewHeight)];
        leftView.clipsToBounds=YES;
        leftView.delegate=self;
        [leftBgView addSubview:leftView];
        
        
        
        centerBgView=[[UIView alloc] init];
        centerBgView.frame = CGRectMake(viewWidth , 0, viewWidth, viewHeight);
        centerBgView.clipsToBounds=YES;
        [self addSubview:centerBgView];
        
        self.centerView=[[UIView alloc] init];
        self.centerView.frame = CGRectMake(0 , 0, viewWidth, viewHeight);
        [centerBgView addSubview:self.centerView];
        self.centerView.backgroundColor=[UIColor whiteColor];
        
        
        [self setContentSize:CGSizeMake(viewWidth * 2, 0)];
        [self scrollRectToVisible:CGRectMake(viewWidth,0,viewWidth,viewHeight) animated:NO];
        [self setContentOffset:CGPointMake(viewWidth,0)];
    }
    
    return self;
}

-(void)navLeftBtAction{

    if (self.contentOffset.x <= (viewWidth - LeftWidth))
    {
         [self setContentOffset:CGPointMake(viewWidth,0) animated:YES];
    }
    else if (self.contentOffset.x >= WScreen)
    {
    }
}

//只要滚动了就会触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    if (scrollView.contentOffset.x < (viewWidth - LeftWidth))
    {
        scrollView.contentOffset = CGPointMake(viewWidth - LeftWidth, 0);
    }
    else if (scrollView.contentOffset.x > viewWidth)
    {
        scrollView.contentOffset = CGPointMake(viewWidth, 0);
    }
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if ((scrollView.contentOffset.x > (viewWidth - LeftWidth)) && (scrollView.contentOffset.x < viewWidth) && (scrollView.contentOffset.x < targetContentOffset->x))
    {
        [UIView animateWithDuration:0.1 animations:^{
            scrollView.contentOffset = CGPointMake(viewWidth, 0);
        }];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    CGFloat pagewidth = self.frame.size.width;
    CGFloat pageWidth = self.frame.size.width;
    int currentPage= floor((self.contentOffset.x - pageWidth / 2) / pageWidth) + 1;


    if (currentPage==0)
    {
        [self scrollRectToVisible:CGRectMake(viewWidth - LeftWidth, 0, viewWidth, viewHeight - 64) animated:NO]; // 最后+1,循环第1页
    }
    else if (currentPage == 1)
    {
        [self scrollRectToVisible:CGRectMake(viewWidth, 0, viewWidth, viewHeight - 64) animated:YES];
//        scrollView.contentOffset = CGPointMake(viewWidth, 0);
    }
 
}


-(void)leftViewDidSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_slideMenuDelegate respondsToSelector:@selector(didSelectRowAtIndexPath:slide:)])
    {
        [_slideMenuDelegate didSelectRowAtIndexPath:indexPath slide:LeftDirection];
    }
}

@end
