//
//  DSSettingDataSource.m
//  DSSettingDataSource
//
//  Created by HelloAda on 2018/4/24.
//  Copyright © 2018年 HelloAda. All rights reserved.
//

#import "DSSettingDataSource.h"
@interface DSSettingDataSource ()

@property (nonatomic, strong) NSArray *items;

@end

static NSString *identifier = @"settingCellID";

@implementation DSSettingDataSource


- (instancetype)initWithItems:(NSArray *)items{
    self = [super init];
    if (self) {
        self.items = items;
    }
    return self;
}

#pragma mark --- 私有方法 ---

- (id)itemAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    if (tableView.style == UITableViewStyleGrouped) {
        DSSettingItems *items = self.items[indexPath.section];
        return items.items[indexPath.row];
    } else {
        return self.items[indexPath.row];
    }
}


#pragma mark --- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.style == UITableViewStyleGrouped) {
        DSSettingItems *items = self.items[section];
        return items.items.count;
    } else {
        return self.items.count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView.style == UITableViewStyleGrouped) {
        return self.items.count;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self itemAtIndexPath:indexPath tableView:tableView];
    DSSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[DSSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    [cell setItem:item];
    return cell;
}

#pragma mark --- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DSSettingItem *item = [self itemAtIndexPath:indexPath tableView:tableView];
    if (item.didSelectBlock) {
        item.didSelectBlock();
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView.style == UITableViewStyleGrouped) {
        DSSettingItems *items = self.items[section];
        return items.headTitle;
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (tableView.style == UITableViewStyleGrouped) {
        DSSettingItems *items = self.items[section];
        return items.footTitle;
    }
    return nil;
}
@end
