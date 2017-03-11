//
//  XHStatusCell.h
//  UITableViewApplyDemo
//
//  Created by snow on 17/3/9.
//  Copyright © 2017年 snow. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XHStatus;
@interface XHStatusCell : UITableViewCell
//** 微博数据模型 */
@property (strong,nonatomic) XHStatus *status;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
