//
//  DSSettingCellProtocol.h
//  DSSettingDataSource
//
//  Created by HelloAda on 2018/5/30.
//  Copyright © 2018年 HelloAda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DSSettingItem;
@protocol DSSettingCellProtocol <NSObject>

//初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@optional
//传数据用这个
- (void)refreshData:(DSSettingItem *)item tableView:(UITableView *)tableView;

@end
