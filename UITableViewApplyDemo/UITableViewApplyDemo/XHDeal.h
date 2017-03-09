//
//  XHGroupBuy.h
//  UITableViewApplyDemo
//
//  Created by snow on 17/3/2.
//  Copyright © 2017年 snow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHDeal : NSObject
//** <#注释#> */
@property (nonatomic, strong) NSString *buyCount;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *icon;

+ (instancetype)dealWithDic:(NSDictionary *)dict;
@end
