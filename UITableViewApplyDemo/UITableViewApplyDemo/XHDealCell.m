//
//  XHDealCell.m
//  UITableViewApplyDemo
//
//  Created by snow on 17/3/6.
//  Copyright © 2017年 snow. All rights reserved.
//

#import "XHDealCell.h"
#import "XHDeal.h"
@interface XHDealCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

@end
@implementation XHDealCell
//代码创建cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //创建子控件
    }
    return self;
}
//设置子控件frame
- (void)layoutSubviews {
    [super layoutSubviews];
}
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"GroupBuy";
    XHDealCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([XHDealCell class]) owner:nil options:nil]firstObject];
    }
    return cell;
}
- (void)setDeal:(XHDeal *)deal {
    _deal = deal;
    self.iconView.image = [UIImage imageNamed:deal.icon];
    self.titleLabel.text = deal.title;
    self.priceLabel.text = deal.price;
    self.buyCountLabel.text = deal.buyCount;
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
