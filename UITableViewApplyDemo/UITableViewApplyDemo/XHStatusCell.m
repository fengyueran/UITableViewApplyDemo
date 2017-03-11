//
//  XHStatusCell.m
//  UITableViewApplyDemo
//
//  Created by snow on 17/3/9.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "XHStatusCell.h"
#import "XHStatus.h"
@interface XHStatusCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;
@end
@implementation XHStatusCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"status";
    XHStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]firstObject];
    }
    return cell;
}

- (void)setStatus:(XHStatus *)status {
    _status = status;
    if (status.isVip) {
        self.nameLabel.textColor = [UIColor orangeColor];
    } else {
        self.nameLabel.textColor = [UIColor blackColor];
    }
    
    self.vipView.hidden = !status.isVip;
    self.nameLabel.text = status.name;
    self.iconView.image = [UIImage imageNamed:status.icon];
    self.pictureView.image = [UIImage imageNamed:status.picture];
    self.pictureView.hidden = !status.picture;
    self.contentLabel.text = status.text;
    
    //cell强制布局
    [self layoutIfNeeded];
    if (self.pictureView.hidden) {
        status.cellHeight = CGRectGetMaxY(self.contentLabel.frame) + 10;
    } else {
        status.cellHeight = CGRectGetMaxY(self.pictureView.frame) + 10;
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
