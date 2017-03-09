//
//  XHTableViewController.m
//  UITableViewApplyDemo
//
//  Created by snow on 17/3/2.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "XHTableViewController.h"
#import "XHDeal.h"
#import "XHDealCell.h"

@interface XHTableViewController ()
//** 所有团购数 */
@property (nonatomic, strong) NSArray *deals;

@end

@implementation XHTableViewController

- (NSArray *)deals {
    if (!_deals) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"tgs" ofType:@"plist"];
        _deals = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *mutableArr = [NSMutableArray array];
        for (NSDictionary *dict in _deals) {
            XHDeal *deal = [XHDeal dealWithDic:dict];
            [mutableArr addObject:deal];
        }
        
        _deals = mutableArr;
    }
    return _deals;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    UINib *nib = [UINib nibWithNibName:NSStringFromClass([XHDealCell class]) bundle:nil];
//    [self.tableView registerNib:nib forCellReuseIdentifier:@"GroupBuy"];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.deals.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XHDealCell *cell = [XHDealCell cellWithTableView:tableView];
    cell.deal = self.deals[indexPath.row];
    
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
