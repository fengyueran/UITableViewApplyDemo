//
//  CarGroup.h
//  UITableViewApplyDemo
//
//  Created by snow on 17/2/26.
//  Copyright © 2017年 snow. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface CarGroup : NSObject
/** 头部标题**/
@property (strong, nonatomic) NSString *header;
/** 尾部标题**/
@property (strong, nonatomic) NSString *footer;
/** 这组所有的车模型(存放Car模型)**/
@property (strong, nonatomic) NSArray *cars;
@end
