//
//  DSSettingDataSource.h
//  DSSettingDataSource
//
//  Created by HelloAda on 2018/4/24.
//  Copyright © 2018年 HelloAda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DSSettingCell.h"

@interface DSSettingDataSource : NSObject<UITableViewDelegate, UITableViewDataSource>

//初始化
- (instancetype)initWithItems:(NSArray *)items;

@end
