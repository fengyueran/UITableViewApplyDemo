//
//  XHGroupBuy.m
//  UITableViewApplyDemo
//
//  Created by snow on 17/3/2.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "XHDeal.h"

@implementation XHDeal
+ (instancetype)dealWithDic:(NSDictionary *)dict {
    XHDeal *deal = [[XHDeal alloc]init];
    [deal setValuesForKeysWithDictionary:dict];
    return deal;
}
@end
