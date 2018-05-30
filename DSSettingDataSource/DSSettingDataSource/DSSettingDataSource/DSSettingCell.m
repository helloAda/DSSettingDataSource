//
//  DSSettingCell.m
//  DSSettingDataSource
//
//  Created by HelloAda on 2018/4/24.
//  Copyright © 2018年 HelloAda. All rights reserved.
//

#import "DSSettingCell.h"

@interface DSSettingCell ()
//数据
@property (nonatomic, strong) DSSettingItem *item;
//switch按钮
@property (nonatomic, strong) UISwitch *switchBtn;

@end

@implementation DSSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


- (void)refreshData:(DSSettingItem *)item tableView:(UITableView *)tableView {
    _item = item;
    self.imageView.image = [UIImage imageNamed:item.icon];
    self.textLabel.text = item.title;
    
    switch (item.type) {
        case DSSettingItemTypeNone: {
            self.detailTextLabel.text = @"";
            self.accessoryView = nil;
        }
            break;
        case DSSettingItemTypeDetial: {
            self.detailTextLabel.text = item.details;
            self.accessoryView = nil;
        }
            break;
        case DSSettingItemTypeSwitch: {
            if (!_switchBtn) {
                _switchBtn = [[UISwitch alloc] init];
                _switchBtn.on = item.isSwitchOn;
                [_switchBtn addTarget:self action:@selector(switchClickEvent:) forControlEvents:UIControlEventTouchUpInside];
                self.detailTextLabel.text = @"";
                self.accessoryView = _switchBtn;
            }
        }
            break;
        default:
            break;
    }

}

#pragma mark --- Switch 响应事件 ---

- (void)switchClickEvent:(UISwitch *)switchBtn {
    
    if (self.item.switchClick && self.item.type == DSSettingItemTypeSwitch) {
        self.item.switchClick(switchBtn.on);
    }
}

@end
