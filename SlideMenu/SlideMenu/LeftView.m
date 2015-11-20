//
//  LeftView.m
//  SlideMenu
//
//

#import "LeftView.h"
@interface LeftView ()
<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation LeftView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        float viewWidth=frame.size.width;
        float viewHeight=frame.size.height;
        
        self.backgroundColor=[UIColor whiteColor];
        
        if (!_tableView)
        {
            self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, viewWidth, viewHeight - 20) style:UITableViewStylePlain];
            self.tableView.dataSource = self;
            self.tableView.delegate = self;
            self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
            
            if (iOS7)
            {
                [self.tableView setSeparatorInset:UIEdgeInsetsZero];
            }
            
            self.tableView.showsVerticalScrollIndicator = NO;
        }
        
        if (!_tableView.superview)
        {
            [self addSubview:_tableView];
        }
        
        self.dataArray = @[@"主界面", @"分组", @"开关", @"传感", @"摄像头"];
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *menuCellId = @"menuCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:menuCellId];

    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:menuCellId];
    }
    
    if (indexPath.row < _dataArray.count)
    {
        cell.textLabel.text = _dataArray[indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([_delegate respondsToSelector:@selector(leftViewDidSelectRowAtIndexPath:)])
    {
        [_delegate leftViewDidSelectRowAtIndexPath:indexPath];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
