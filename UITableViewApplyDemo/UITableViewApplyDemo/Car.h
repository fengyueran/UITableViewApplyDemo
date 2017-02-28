//
//  Car.h
//  UITableViewApplyDemo
//
//  Created by snow on 17/2/26.
//  Copyright © 2017年 snow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
/** 名字**/
@property (strong, nonatomic) NSString *name;
/** 图标**/
@property (strong, nonatomic) NSString *icon;

+ (instancetype)carWithName:(NSString *)name icon:(NSString *)icon;
@end
