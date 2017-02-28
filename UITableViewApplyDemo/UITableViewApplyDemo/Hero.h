//
//  Hero.h
//  UITableViewApplyDemo
//
//  Created by snow on 17/2/27.
//  Copyright © 2017年 snow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject
//** 姓名 */
@property (nonatomic, strong) NSString *name;
//** 图标 */
@property (nonatomic, strong) NSString *icon;
//** 简介 */
@property (nonatomic, strong) NSString *intro;

+(instancetype)heroWithDic:(NSDictionary *)dic;
@end
