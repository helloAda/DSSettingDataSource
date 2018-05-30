//
//  DSSettingItem.m
//  DSSettingDataSource
//
//  Created by HelloAda on 2018/4/24.
//  Copyright © 2018年 HelloAda. All rights reserved.
//

#import "DSSettingItem.h"

@implementation DSSettingItem

+ (instancetype)itemWithtype:(DSSettingItemType)type title:(NSString *)title icon:(NSString *)icon {
    DSSettingItem *item = [[DSSettingItem alloc] init];
    item.type = type;
    item.title = title;
    item.icon = icon;

    return item;
}


+ (instancetype)itemWithtype:(DSSettingItemType)type cellClassName:(NSString *)cellClassName {
    DSSettingItem *item = [[DSSettingItem alloc] init];
    item.type = type;
    item.cellClassName = cellClassName;
    return item;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isShowAccessory = YES;
        self.sepLeftEdge = 15;
        self.rowHeight = 44;
        self.isForbidSelect = NO;
    }
    return self;
}
@end

@implementation DSSettingGroup

- (instancetype)init
{
    self = [super init];
    if (self) {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
