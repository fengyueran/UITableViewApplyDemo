//
//  XHWBTableViewController.m
//  UITableViewApplyDemo
//
//  Created by snow on 17/3/9.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "XHWBTableViewController.h"
#import "XHStatusCell.h"
#import "XHStatus.h"


@interface XHWBTableViewController ()
//** 每行的高度 */
@property (strong,nonatomic) NSMutableDictionary *height;
//** 数据模型数组 */
@property (nonatomic, strong) NSMutableArray *statusArr;
//** <#注释#> */
@property (strong, nonatomic) UIBarButtonItem *addItem;
@property (strong, nonatomic) UIBarButtonItem *removeItem;
@property (strong, nonatomic) UIBarButtonItem *updateItem;
@property (strong, nonatomic) UIBarButtonItem *editItem;

@end

@implementation XHWBTableViewController

- (UIBarButtonItem *)addItem {
    if (!_addItem) {
        _addItem = [[UIBarButtonItem alloc]initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(add)];
    }
    return _addItem;
}

- (UIBarButtonItem *)removeItem {
    if (!_removeItem) {
        _removeItem = [[UIBarButtonItem alloc]initWithTitle:@"remove" style:UIBarButtonItemStylePlain target:self action:@selector(remove)];
    }
    return _removeItem;
}

- (UIBarButtonItem *)updateItem {
    if (!_updateItem) {
        _updateItem = [[UIBarButtonItem alloc]initWithTitle:@"update" style:UIBarButtonItemStylePlain target:self action:@selector(update)];
    }
    return _updateItem;
}

- (UIBarButtonItem *)editItem {
    if (!_editItem) {
        _editItem = [[UIBarButtonItem alloc]initWithTitle:@"edit" style:UIBarButtonItemStylePlain target:self action:@selector(edit)];
    }
    return _editItem;
}
- (NSMutableDictionary *)height {
    if (!_height) {
        _height = [NSMutableDictionary dictionary];
    }
    return _height;
}
- (NSMutableArray *)statusArr {
    if (!_statusArr) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"status" ofType:@"plist"];
        _statusArr = [NSMutableArray arrayWithContentsOfFile:path];
        NSMutableArray *mutableArr = [NSMutableArray array];
        for (NSDictionary *dict in _statusArr) {
            XHStatus *status = [XHStatus statusWithDic:dict];
            [mutableArr addObject:status];
        }
        _statusArr = mutableArr;
    }
    return _statusArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setRightBarButtonItems:@[self.removeItem,self.addItem,self.updateItem,self.editItem]];
    self.tableView.editing = YES;

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"==========%zd",self.statusArr.count);
    return self.statusArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"000000000000");
    XHStatusCell *cell = [XHStatusCell cellWithTableView:tableView];
    cell.status = self.statusArr[indexPath.row];
    //此时cell还未显示，如果要布局则需要强制布局
//    [cell layoutIfNeeded];
//    self.height[@(indexPath.row)] = @(cell.height);
//    NSLog(@"===============%f",cell.height);
    return cell;
}


/*
只要返回了估计高度，就会先调用cellForRowAtIndexPath方法
创建cell，再调用heightForRowAtIndexPath获取cell的真实高
度，没有返回估计高度则先调用heightForRowAtIndexPath方法
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 0) {
//        return 50;
//    }
//    return 60;
    //1.以下方法在创建cell时会先调用heightForRowAtIndexPath方法，在heightForRowAtIndexPath方法内部又通过[tableView cellForRowAtIndexPath:indexPath]方法创建cell则会调用heightForRowAtIndexPath方法造成死循环
    /*
     XHStatusCell * cell = (XHStatusCell *)[tableView cellForRowAtIndexPath:indexPath];
     */
    //2.cell并未显示则cell内部的布局还未完成
    /*
     XHStatusCell * cell = [XHStatusCell cellWithTableView:tableView];
     cell.status = self.statusArr[indexPath.row];
     */
    //3.强制布局，每次获取高度都创建cell耗性能
    /*
     XHStatusCell * cell = [XHStatusCell cellWithTableView:tableView];
     cell.status = self.statusArr[indexPath.row];
     //强制布局
     [cell layoutIfNeeded];
     return cell.height;
     */
    
    //4.返回估计高度后在调用heightForRowAtIndexPath前cell已经在cellForRowAtIndexPath方法中创建了cell，因此可以在cellForRowAtIndexPath方法中获取cell高度并存在字典self.height中
    /*
    return [self.height[@(indexPath.row)] doubleValue];
     */
    XHStatus *status = self.statusArr[indexPath.row];
    return status.cellHeight;
}

#pragma mark - UITableView delegate method
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

//左滑删除，添加该方法后cell左滑就会出现删除按钮(如果editingStyleForRowAtIndexPath方法返回的不是UITableViewCellEditingStyleDelete删除模式则不出现删除按钮)，用户点击了删除(或添加)就调用该方法
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleInsert) {//点击加号，插入行
        NSLog(@"insert");
    } else if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除模型
        [self.statusArr removeObjectAtIndex:indexPath.row];
        //刷新表格
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

//设置cell编辑模式为什么模式(删除或添加)
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
    进入编辑模式时出现什么按钮
    1.UITableViewCellEditingStyleInsert：+号按钮
    2.UITableViewCellEditingStyleDelete：-号按钮
    3.UITableViewCellEditingStyleInsert|UITableViewCellEditingStyleDelete:空心圆选择按钮
     */
    if (indexPath.row == 0) {
        return UITableViewCellEditingStyleDelete;
    } else if (indexPath.row == 1) {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleInsert|UITableViewCellEditingStyleDelete;
    
}

- (void)add {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入信息" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    //添加按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSString *name = [alert.textFields[0] text];
        NSString *content = [alert.textFields[1] text];
        //创建模型
        XHStatus *status = [[XHStatus alloc]init];
        status.name = name;
        status.text = content;
        [self.statusArr insertObject:status atIndex:0];
        
        //手动刷新tableView，刷新所有需要显示的数据，浪费性能
        //    [self.tableView reloadData];
        
        //加入动画且手动刷新,insertRowsAtIndexPaths会调用数据方法numberOfRowsInSection(返回行数需和插入后的行数一致)等，只更新插入的row，性能较高。
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
   
    }]];
    
    //添加输入框
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入名字";
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入内容";
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
     
}

- (void)remove {
    [self.statusArr removeObjectAtIndex:0];
    //手动刷新tableView
//    [self.tableView reloadData];
    
    //加入删除动画且手动刷新,deleteRowsAtIndexPaths会调用数据源方法numberOfRowsInSection(返回行数需和删除后的行数一致)，但不会调用cellForRowAtIndexPath方法，性能较高。
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
}

- (void)update {
    XHStatus *status = self.statusArr[0];
    status.name = @"update";
    //[self.tableView reloadData];
    //加入动画且手动刷新,reloadRowsAtIndexPaths会调用数据源方法numberOfRowsInSection(返回行数需和删除后的行数一致)，只更新更改的row，不用全部刷新，性能较高。
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationLeft];
}

- (void)edit {
    self.tableView.editing = !self.tableView.editing;
}

@end
