//
//  DSSettingItem.m
//  DSSettingDataSource
//
//  Created by HelloAda on 2018/4/24.
//  Copyright © 2018年 HelloAda. All rights reserved.
//

#import "DSSettingItem.h"

@implementation DSSettingItem

+ (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon type:(DSSettingItemType)type {
    return [self initWithTitle:title icon:icon detial:@"" type:type];
}

+ (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon detial:(NSString *)detial type:(DSSettingItemType)type {
    DSSettingItem *item = [[DSSettingItem alloc] init];
    item.title = title;
    item.icon = icon;
    item.type = type;
    item.details = detial;
    return item;
}
@end

@implementation DSSettingItems

@end
