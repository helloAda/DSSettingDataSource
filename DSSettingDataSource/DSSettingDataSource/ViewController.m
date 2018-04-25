//
//  ViewController.m
//  DSSettingDataSource
//
//  Created by HelloAda on 2018/4/24.
//  Copyright © 2018年 HelloAda. All rights reserved.
//

#import "ViewController.h"
#import "DSSettingDataSource.h"


@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) DSSettingDataSource *dataSource;

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _array = [[NSMutableArray alloc] init];
    [self setData];
    [self setupUI];
}

- (void)setData {
    
    DSSettingItems *items = [[DSSettingItems alloc] init];
    
    {
        DSSettingItem *item = [DSSettingItem itemWithTitle:@"打卡补签" icon:@"打卡补签" type:DSSettingItemTypeSwitch];
        item.isSwitchOn = YES;
        item.didSelectBlock = ^{
            NSLog(@"点击打卡补签");
        };
        item.switchClick = ^(BOOL on) {
            NSLog(@"switch %d",on);
        };
        [items.items addObject:item];
        
    }
    {
        DSSettingItem *item = [DSSettingItem itemWithTitle:@"休假申请" icon:@"休假申请" detial:@"请假、调休" type:DSSettingItemTypeDetial];
        item.didSelectBlock = ^{
            NSLog(@"点击休假申请");
        };
        [items.items addObject:item];

    }
    {
        DSSettingItem *item = [DSSettingItem itemWithTitle:@"人事申请" icon:@"人事申请" type:DSSettingItemTypeArrow];
        item.didSelectBlock = ^{
            NSLog(@"人事申请");
        };
        [items.items addObject:item];

    }
    items.headTitle = @"人力资源部";
    items.footTitle = @"为您提供便利服务";
    [_array addObject:items];
    
    
    
    DSSettingItems *items1 = [[DSSettingItems alloc] init];

    {
        DSSettingItem *item = [DSSettingItem itemWithTitle:@"付款申请" icon:@"付款申请" type:DSSettingItemTypeArrow];
        item.didSelectBlock = ^{
            NSLog(@"点击付款申请");
        };
        [items1.items addObject:item];
        
    }
    {
        DSSettingItem *item = [DSSettingItem itemWithTitle:@"交通报销" icon:@"交通报销" type:DSSettingItemTypeArrow];
        item.didSelectBlock = ^{
            NSLog(@"点击交通报销");
        };
        [items1.items addObject:item];
        
    }
    {
        DSSettingItem *item = [DSSettingItem itemWithTitle:@"借款申请" icon:@"借款申请" detial:@"额度50000元" type:DSSettingItemTypeDetial];
        item.didSelectBlock = ^{
            NSLog(@"点击借款申请");
        };
        [items1.items addObject:item];
        
    }
    items1.headTitle = @"财务部";
    items1.footTitle = @"为您提供便利服务";
    [_array addObject:items1];
    
    

    DSSettingItems *items2 = [[DSSettingItems alloc] init];
    {
        DSSettingItem *item = [DSSettingItem itemWithTitle:@"电脑故障" icon:@"电脑故障" type:DSSettingItemTypeArrow];
        item.didSelectBlock = ^{
            NSLog(@"点击电脑故障");
        };
        [items2.items addObject:item];
    }

    items2.headTitle = @"技术支持";
    [_array addObject:items2];
    
    self.dataSource = [[DSSettingDataSource alloc] initWithItems:_array];
    //

}

- (void)setupUI {
    

    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    [self.view addSubview:self.tableView];
    
    UILabel *headView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    headView.backgroundColor = [UIColor whiteColor];
    headView.text = @"HeadView";
    headView.font = [UIFont boldSystemFontOfSize:30.0f];
    headView.textAlignment = NSTextAlignmentCenter;
    self.tableView.tableHeaderView = headView;
}

@end

