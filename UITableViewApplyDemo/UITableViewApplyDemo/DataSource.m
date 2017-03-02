//
//  DataSource.m
//  UITableViewApplyDemo
//
//  Created by snow on 17/2/26.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "DataSource.h"
#import "CarGroup.h"
#import "Car.h"
#import "Hero.h"
@interface DataSource ()

@end

@implementation DataSource



#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"hero";
    //离开tableview可视范围的cell被丢入缓存池，当需要创建cell的时候根据Cell标识从缓存池中取cell,从而避免了不停创建新的cell消耗内存。
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        //设置cell选中背景
        UIView *selectedBackgroundView = [[UIView alloc]init];
        selectedBackgroundView.backgroundColor = [UIColor redColor];
        cell.selectedBackgroundView = selectedBackgroundView;
        //设置cell指示器
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.accessoryView = [[UISwitch alloc]init];
    }

    Hero *hero = self.data[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    cell.detailTextLabel.text = hero.intro;
    return cell;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    CarGroup *carGroup = self.groups[section];
//    return carGroup.header;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    CarGroup *carGroup = self.groups[section];
//    return carGroup.footer;
//}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell is selected");
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
     NSLog(@"cell is deselected");
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 0) {
//        return 50;
//    }
//    return 60;
//}

@end
