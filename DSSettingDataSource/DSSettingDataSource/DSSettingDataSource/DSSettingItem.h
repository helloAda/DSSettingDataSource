//
//  DSSettingItem.h
//  DSSettingDataSource
//
//  Created by HelloAda on 2018/4/24.
//  Copyright © 2018年 HelloAda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DSSettingItemType) {
    DSSettingItemTypeDetial,  // 显示详情在右边
    DSSettingItemTypeSwitch   // 显示Switch
};

//Switch回调
typedef void(^SwitchClickBlock)(BOOL on);

//Cell回调
typedef void(^DidSelectBlock)(void);


//每个Cell的数据模型
@interface DSSettingItem : NSObject

//图标
@property (nonatomic, copy) NSString *icon;

//标题
@property (nonatomic, copy) NSString *title;

//详情 只有在DSSettingItemTypeDetial类型才有效
@property (nonatomic, copy) NSString *details;

//显示箭头 '>' 默认YES
@property (nonatomic, assign) BOOL isShowAccessory;

//cell禁止点击 默认为NO 即可以点
@property (nonatomic, assign) BOOL isForbidSelect;

//cell不可见 默认为NO 即显示
@property (nonatomic, assign) BOOL isDisable;

//分割线距离左边的距离 默认15
@property (nonatomic, assign) CGFloat sepLeftEdge;

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
@interface DSSettingGroup : NSObject

//Cell模型集合
@property (nonatomic, strong) NSMutableArray <DSSettingItem *> *items;

//以下只有TableView为Group才有效

//组头标题
@property (nonatomic, copy) NSString *headTitle;
//组尾标题
@property (nonatomic, copy) NSString *footTitle;
//头部高度
@property (nonatomic, assign) CGFloat headHeight;
//尾部高度
@property (nonatomic, assign) CGFloat footHeight;

@end
