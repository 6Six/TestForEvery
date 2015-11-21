//
//  TableViewController.m
//  TestForEvery
//
//  Created by Garry on 15/11/20.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "TableViewController.h"
#import "FirstTableViewCell.h"

@interface TableViewController ()

@property (nonatomic, copy) NSArray *labelArray;
@property (nonatomic, strong) FirstTableViewCell *prototypeCell;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UINib *nib = [UINib nibWithNibName:@"FirstTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"FirstTableViewCell"];
    
    self.labelArray = @[@"AutoLayout AutoLayout AutoLayout AutoLayout AutoLayout",
                        @"AutoLayout AutoLayout",
                        @"AutoLayout AutoLayout AutoLayout",
                        @"AutoLayout AutoLayout AutoLayout AutoLayout AutoLayout AutoLayout",
                        @"AutoLayout",
                        @"AutoLayout AutoLayout AutoLayout AutoLayout",
                        @"AutoLayout AutoLayout",
                        @"AutoLayout AutoLayout AutoLayout"];
    
    self.prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:@"FirstTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FirstTableViewCell *cell = self.prototypeCell;
    cell.firstLabel.text = self.labelArray[indexPath.row];
    return [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 50.0;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _labelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstTableViewCell" forIndexPath:indexPath];

    cell.firstLabel.text = _labelArray[indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
