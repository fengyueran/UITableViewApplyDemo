//
//  DataSource.h
//  UITableViewApplyDemo
//
//  Created by snow on 17/2/26.
//  Copyright © 2017年 snow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DataSource : NSObject<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) NSArray *data;
@end
