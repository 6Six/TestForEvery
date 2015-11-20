//
//  LeftView.h
//  SlideMenu
//
//

#import <UIKit/UIKit.h>

@protocol LeftViewDelegate <NSObject>

- (void)leftViewDidSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface LeftView : UIView

@property (nonatomic, weak) id<LeftViewDelegate> delegate;

@end

