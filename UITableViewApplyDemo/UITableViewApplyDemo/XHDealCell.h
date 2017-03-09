//
//  XHDealCell.h
//  UITableViewApplyDemo
//
//  Created by snow on 17/3/6.
//  Copyright © 2017年 snow. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XHDeal;
@interface XHDealCell : UITableViewCell
//** 团购模型数据 */
@property (nonatomic, strong) XHDeal *deal;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
