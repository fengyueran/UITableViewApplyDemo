//
//  XHStatus.m
//  UITableViewApplyDemo
//
//  Created by snow on 17/3/9.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "XHStatus.h"

@implementation XHStatus
+ (instancetype)statusWithDic:(NSDictionary *)dic {
    XHStatus *status = [[XHStatus alloc]init];
    [status setValuesForKeysWithDictionary:dic];
    return status;
}
@end
