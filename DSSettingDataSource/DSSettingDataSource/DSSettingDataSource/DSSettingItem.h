//
//  DSSettingItem.h
//  DSSettingDataSource
//
//  Created by HelloAda on 2018/4/24.
//  Copyright © 2018年 HelloAda. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DSSettingItemType) {
    DSSettingItemTypeDetial,  // 显示详情在右边
    DSSettingItemTypeArrow,   // 显示箭头
    DSSettingItemTypeSwitch   // 显示Switch
};

//Switch回调
typedef void(^SwitchClickBlock)(BOOL on);

//Cell回调
typedef void(^DidSelectBlock)(void);


//每个Cell的数据模型
@interface DSSettingItem : NSObject

//图标 只支持本地的。
@property (nonatomic, copy) NSString *icon;

//标题
@property (nonatomic, copy) NSString *title;

//详情 只有在Detial类型才有效
@property (nonatomic, copy) NSString *details;

//Cell类型
@property (nonatomic, assign) DSSettingItemType type;

// 点击Switch事件
@property (nonatomic, copy) SwitchClickBlock switchClick;

// 点击Cell事件
@property (nonatomic, copy) DidSelectBlock didSelectBlock;

//Switch状态 默认NO
@property (nonatomic, assign) BOOL isSwitchOn;

/**
 初始化方法
 
 @param title 标题
 @param icon 图片名称
 @param detial 详情(只在Detial类型下才有用)
 @param type 类型
 @return 实例
 */
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon detial:(NSString *)detial type:(DSSettingItemType)type;

//初始化方法
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon type:(DSSettingItemType)type;

@end




//一组Cell的数据模型
@interface DSSettingItems : NSObject

//Cell模型集合
@property (nonatomic, strong) NSMutableArray <DSSettingItem *> *items;

//组头标题 TableView为Group才有效
@property (nonatomic, copy) NSString *headTitle;
//组尾标题 TableView为Group才有效
@property (nonatomic, copy) NSString *footTitle;

@end
