//
//  Car.m
//  UITableViewApplyDemo
//
//  Created by snow on 17/2/26.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "Car.h"

@implementation Car
+ (instancetype)carWithName:(NSString *)name icon:(NSString *)icon {
    Car *aCar = [[Car alloc]init];
    aCar.name = name;
    aCar.icon = icon;
    return aCar;
}
@end
