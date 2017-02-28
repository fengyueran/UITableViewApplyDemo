//
//  Hero.m
//  UITableViewApplyDemo
//
//  Created by snow on 17/2/27.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "Hero.h"

@implementation Hero
+(instancetype)heroWithDic:(NSDictionary *)dic {
    Hero *hero = [[Hero alloc]init];
    //[hero setValuesForKeysWithDictionary:dic];
    hero.name = dic[@"name"];
    hero.icon = dic[@"icon"];
    hero.intro = dic[@"intro"];
    return hero;
}

@end
