//
//  XHWBTableViewController.m
//  UITableViewApplyDemo
//
//  Created by snow on 17/3/9.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "XHWBTableViewController.h"
#import "XHStatusCell.h"
#import "XHStatus.h"


@interface XHWBTableViewController ()
//** 每行的高度 */
@property (strong,nonatomic) NSMutableDictionary *height;
//** 数据模型数组 */
@property (nonatomic, strong) NSArray *statusArr;

@end

@implementation XHWBTableViewController

- (NSMutableDictionary *)height {
    if (!_height) {
        _height = [NSMutableDictionary dictionary];
    }
    return _height;
}
- (NSArray *)statusArr {
    if (!_statusArr) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"status" ofType:@"plist"];
        _statusArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *mutableArr = [NSMutableArray array];
        for (NSDictionary *dict in _statusArr) {
            XHStatus *status = [XHStatus statusWithDic:dict];
            [mutableArr addObject:status];
        }
        _statusArr = mutableArr;
    }
    return _statusArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statusArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XHStatusCell *cell = [XHStatusCell cellWithTableView:tableView];
    cell.status = self.statusArr[indexPath.row];
    //此时cell还未显示，如果要布局则需要强制布局
//    [cell layoutIfNeeded];
//    self.height[@(indexPath.row)] = @(cell.height);
//    NSLog(@"===============%f",cell.height);
    return cell;
}


/*
只要返回了估计高度，就会先调用cellForRowAtIndexPath方法
创建cell，再调用heightForRowAtIndexPath获取cell的真实高
度，没有返回估计高度则先调用heightForRowAtIndexPath方法
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 0) {
//        return 50;
//    }
//    return 60;
    //1.以下方法在创建cell时会先调用heightForRowAtIndexPath方法，在heightForRowAtIndexPath方法内部又通过[tableView cellForRowAtIndexPath:indexPath]方法创建cell则会调用heightForRowAtIndexPath方法造成死循环
    /*
     XHStatusCell * cell = (XHStatusCell *)[tableView cellForRowAtIndexPath:indexPath];
     */
    //2.cell并未显示则cell内部的布局还未完成
    /*
     XHStatusCell * cell = [XHStatusCell cellWithTableView:tableView];
     cell.status = self.statusArr[indexPath.row];
     */
    //3.强制布局，每次获取高度都创建cell耗性能
    /*
     XHStatusCell * cell = [XHStatusCell cellWithTableView:tableView];
     cell.status = self.statusArr[indexPath.row];
     //强制布局
     [cell layoutIfNeeded];
     return cell.height;
     */
    
    //4.返回估计高度后在调用heightForRowAtIndexPath前cell已经在cellForRowAtIndexPath方法中创建了cell，因此可以在cellForRowAtIndexPath方法中获取cell高度并存在字典self.height中
    /*
    return [self.height[@(indexPath.row)] doubleValue];
     */
    XHStatus *status = self.statusArr[indexPath.row];
    NSLog(@"============%f",status.cellHeight);
    return status.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
