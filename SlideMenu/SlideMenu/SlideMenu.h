//
//  SlideMenu.h
//  SlideMenu
//
//  Created by apple on 15/3/9.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, SlideDirection) {
    LeftDirection,
};


@protocol SlideMenuDelegate <NSObject>

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath slide:(SlideDirection)slideDirection;

@end

@interface SlideMenu : UIScrollView

@property (nonatomic, weak) id<SlideMenuDelegate> slideMenuDelegate;
@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) UIButton *navLeftBt;
@property (nonatomic, strong) UILabel *navTitleLabel;

-(void)navLeftBtAction;
@end



