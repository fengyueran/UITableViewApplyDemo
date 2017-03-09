//
//  XHStatus.h
//  UITableViewApplyDemo
//
//  Created by snow on 17/3/9.
//  Copyright © 2017年 snow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHStatus : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSString *picture;
@property (assign, nonatomic, getter=isVip) BOOL vip;

+ (instancetype)statusWithDic:(NSDictionary *)dic;
@end
