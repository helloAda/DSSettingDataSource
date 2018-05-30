//
//  DSSettingItem.h
//  DSSettingDataSource
//
//  Created by HelloAda on 2018/4/24.
//  Copyright © 2018年 HelloAda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//Switch回调
typedef void(^SwitchClickBlock)(BOOL on);
//点击cell回调
typedef void(^DidSelectBlock)(void);

typedef NS_ENUM(NSInteger, DSSettingItemType) {
    DSSettingItemTypeNone,    // 不显示任何在右边
    DSSettingItemTypeCustom,  // 自定义Cell
    DSSettingItemTypeDetial,  // 显示详情在右边
    DSSettingItemTypeSwitch   // 显示Switch在右边
};

//每个Cell的数据模型
@interface DSSettingItem : NSObject

//////////// 通用的属性 ////////

//Cell类型
@property (nonatomic, assign) DSSettingItemType type;

//Cell点击事件名
@property (nonatomic, copy) NSString *cellActionName;

/*
 点击Cell回调
 可以采用传入cellActionName的方式实现，也可以直接使用block;
 如果有block，则优先Block，不去执行cellActionName
*/
@property (nonatomic, copy) DidSelectBlock didSelectBlock;

//显示箭头 '>' 默认YES
@property (nonatomic, assign) BOOL isShowAccessory;

//cell禁止点击 默认为NO 即可以点
@property (nonatomic, assign) BOOL isForbidSelect;

//分割线距离左边的距离 默认15 需要将separatorStyle设置为UITableViewCellSeparatorStyleNone
@property (nonatomic, assign) CGFloat sepLeftEdge;

//行高 默认44
@property (nonatomic, assign) CGFloat rowHeight;

//////////// 已提供的几种Cell的配置 ////////////////

//图标
@property (nonatomic, copy) NSString *icon;

//标题
@property (nonatomic, copy) NSString *title;

//详情 只有在DSSettingItemTypeDetial类型才有效
@property (nonatomic, copy) NSString *details;

//点击Switch事件
@property (nonatomic, copy) SwitchClickBlock switchClick;

//Switch状态 默认NO
@property (nonatomic, assign) BOOL isSwitchOn;


/////////////////// 自定义cell //////////////////

//自定义Cell名称
@property (nonatomic, copy) NSString *cellClassName;

//自定义Cell数据
@property (nonatomic, strong) id data;

/**
 初始化方法
 
 @param type 类型
 @param title 标题
 @param icon 图片名称
 @return 实例
 */
//初始化方法
+ (instancetype)itemWithtype:(DSSettingItemType)type title:(NSString *)title icon:(NSString *)icon;


/**
 初始化方法

 @param type 类型
 @param cellClassName 自定义cell类名
 @return 实例
 */
+ (instancetype)itemWithtype:(DSSettingItemType)type cellClassName:(NSString *)cellClassName;

@end




//只有TableView.style为Group在使用

//一组Cell的数据模型
@interface DSSettingGroup : NSObject

//Cell模型集合
@property (nonatomic, strong) NSMutableArray <DSSettingItem *> *items;
//头部标题
@property (nonatomic, copy) NSString *headTitle;
//尾部标题
@property (nonatomic, copy) NSString *footTitle;
//以后有需求在写
////头部高度
//@property (nonatomic, assign) CGFloat headHeight;
////尾部高度
//@property (nonatomic, assign) CGFloat footHeight;

@end
