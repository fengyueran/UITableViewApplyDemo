//
//  ViewController.m
//  UITableViewApplyDemo
//
//  Created by snow on 17/2/26.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "ViewController.h"
#import "DataSource.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) DataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[DataSource alloc]init];
    self.tableView.dataSource = self.dataSource;
}


@end
