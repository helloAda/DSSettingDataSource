//
//  DSSettingItem.m
//  DSSettingDataSource
//
//  Created by HelloAda on 2018/4/24.
//  Copyright © 2018年 HelloAda. All rights reserved.
//

#import "DSSettingItem.h"

@implementation DSSettingItem

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon type:(DSSettingItemType)type {
    return [self itemWithTitle:title icon:icon detial:@"" type:type];
}

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon detial:(NSString *)detial type:(DSSettingItemType)type {
    DSSettingItem *item = [[DSSettingItem alloc] init];
    item.title = title;
    item.icon = icon;
    item.type = type;
    item.details = detial;
    return item;
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
