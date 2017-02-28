//
//  ViewController.m
//  UITableViewApplyDemo
//
//  Created by snow on 17/2/26.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "ViewController.h"
#import "DataSource.h"
#import "CarGroup.h"
#import "Car.h"
#import "Hero.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) DataSource *dataSource;
//** 英雄信息 */
@property (nonatomic, strong) NSArray *heroArr;

@end

@implementation ViewController

- (NSArray *)heroArr {
    if (!_heroArr) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"heroes" ofType:@"plist"];
        _heroArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *mutableArr = [NSMutableArray array];
        for (NSDictionary *dic in _heroArr) {
            Hero *hero = [Hero heroWithDic:dic];
            [mutableArr addObject:hero];
        }
        _heroArr = mutableArr;
    }
    return _heroArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[DataSource alloc]init];
    self.tableView.dataSource = self.dataSource;
    self.dataSource.data = self.heroArr;
    //注册某个标识对应的cell类型，当在缓存池找不到相应标识的cell就创建对应的默认类型的cell。
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"hero"];
}


@end
