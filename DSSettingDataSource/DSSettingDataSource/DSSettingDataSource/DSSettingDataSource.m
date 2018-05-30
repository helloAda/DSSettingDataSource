//
//  DSSettingDataSource.m
//  DSSettingDataSource
//
//  Created by HelloAda on 2018/4/24.
//  Copyright © 2018年 HelloAda. All rights reserved.
//

#import "DSSettingDataSource.h"

#define D_SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@interface DSSettingDataSource ()
//数据源
@property (nonatomic, strong) NSArray *items;

@end
//默认的Cell类名
static NSString *DefaultTableCell = @"DSSettingCell";

@implementation DSSettingDataSource

- (instancetype)initWithItems:(NSArray *)items{
    self = [super init];
    if (self) {
        self.items = items;
    }
    return self;
}

#pragma mark --- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self itemCountAtIndexPath:section tableView:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView.style == UITableViewStyleGrouped) {
        return self.items.count;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSSettingItem *item = [self itemAtIndexPath:indexPath tableView:tableView];
    UITableViewCell *cell = [self configCellWithItem:item cellForRowAtIndexPath:indexPath tableView:tableView];
    return cell;
}

#pragma mark --- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DSSettingItem *item = [self itemAtIndexPath:indexPath tableView:tableView];
    //允许点击
    if (!item.isForbidSelect) {
        //优先执行block
        if (item.didSelectBlock) {
            item.didSelectBlock();
        } else {
            UIViewController *vc = [self findViewControllerWithTableView:tableView];
            NSString *actionName = item.cellActionName;
            if (actionName.length) {
                SEL sel = NSSelectorFromString(actionName);
                UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                D_SuppressPerformSelectorLeakWarning([vc performSelector:sel withObject:cell]);
            }
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DSSettingItem *item = [self itemAtIndexPath:indexPath tableView:tableView];
    return item.rowHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView.style == UITableViewStyleGrouped) {
        DSSettingGroup *group = self.items[section];
        return group.headTitle;
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (tableView.style == UITableViewStyleGrouped) {
        DSSettingGroup *group = self.items[section];
        return group.footTitle;
    }
    return nil;
}


#pragma mark --- 私有方法 ---

//获取数据源
- (id)itemAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    if (tableView.style == UITableViewStyleGrouped) {
        DSSettingGroup *group = self.items[indexPath.section];
        return group.items[indexPath.row];
    } else {
        return self.items[indexPath.row];
    }
}

//每个组里cell的数量
- (NSInteger)itemCountAtIndexPath:(NSInteger)section tableView:(UITableView *)tableView {
    if (tableView.style == UITableViewStyleGrouped) {
        DSSettingGroup *group = self.items[section];
        return group.items.count;
    } else {
        return self.items.count;
    }
}

//配置cell
- (UITableViewCell *)configCellWithItem:(DSSettingItem *)item cellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView{
    //唯一标识用类名表示
    NSString *identifier = item.cellClassName.length ? item.cellClassName : DefaultTableCell;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        Class class = NSClassFromString(identifier);
        cell = [[class alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        
        //自己实现下划线，要把系统的隐藏了
        //第一行要有顶部的分割线
        if (indexPath.row == 0) {
            UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, 0.5)];
            sep.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
            sep.backgroundColor = [UIColor lightGrayColor];
            [cell addSubview:sep];
        }
        CGFloat sepWidth;
        if (indexPath.row == ([self itemCountAtIndexPath:indexPath.section tableView:tableView] - 1)) {
            //最后一行全部显示
            sepWidth = cell.frame.size.width;
        } else {
            //分割线宽度
            sepWidth = cell.frame.size.width - item.sepLeftEdge;
        }
        UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(cell.frame.size.width - sepWidth, cell.frame.size.height, sepWidth, 0.5)];
        sep.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        sep.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:sep];
    }
    //设置数据
    if ([cell respondsToSelector:@selector(refreshData:tableView:)]) {
        [(id<DSSettingCellProtocol>)cell refreshData:item tableView:tableView];
    }
    cell.accessoryType = item.isShowAccessory ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    return cell;
}

//找到tableView的VC
- (UIViewController *)findViewControllerWithTableView:(UITableView *)tableView{
    for (UIView *next = tableView; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
@end
