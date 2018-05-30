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
    {
        DSSettingGroup *group = [[DSSettingGroup alloc] init];
        
        {
            DSSettingItem *item = [DSSettingItem itemWithtype:DSSettingItemTypeSwitch title:@"打卡补签" icon:@"打卡补签"];
            item.didSelectBlock = ^{
                NSLog(@"打卡补签");
            };
            item.isSwitchOn = YES;
            item.switchClick = ^(BOOL on) {
                NSLog(@"switch %d",on);
            };
            [group.items addObject:item];
            
        }
        {
            DSSettingItem *item = [DSSettingItem itemWithtype:DSSettingItemTypeDetial title:@"休假申请" icon:@"休假申请"];
            item.details = @"请假、调休";
            item.didSelectBlock = ^{
                NSLog(@"休假申请");
            };
            [group.items addObject:item];
            
        }
        {
            DSSettingItem *item = [DSSettingItem itemWithtype:DSSettingItemTypeNone title:@"人事申请" icon:@"人事申请"];
            item.didSelectBlock = ^{
                NSLog(@"人事申请");
            };
            [group.items addObject:item];
            
        }
        group.headTitle = @"人力资源部";
        group.footTitle = @"为您提供便利服务";
        [_array addObject:group];
    }
    
    {
        DSSettingGroup *group = [[DSSettingGroup alloc] init];
        
        {
            DSSettingItem *item = [DSSettingItem itemWithtype:DSSettingItemTypeNone title:@"付款申请" icon:@"付款申请"];
            item.didSelectBlock = ^{
                NSLog(@"付款申请");
            };
            [group.items addObject:item];
            
        }
        {
            DSSettingItem *item = [DSSettingItem itemWithtype:DSSettingItemTypeNone title:@"交通报销" icon:@"交通报销"];
            
            item.didSelectBlock = ^{
                NSLog(@"交通报销");
            };
            [group.items addObject:item];
            
        }
        {
            DSSettingItem *item = [DSSettingItem itemWithtype:DSSettingItemTypeDetial title:@"借款申请" icon:@"借款申请"];
            item.details = @"额度50000元";
            item.isForbidSelect = YES; //禁止点击
            item.didSelectBlock = ^{
                NSLog(@"借款申请");
            };
            [group.items addObject:item];
            
        }
        group.headTitle = @"财务部";
        group.footTitle = @"为您提供便利服务";
        [_array addObject:group];
    }
    
    {
        DSSettingGroup *group = [[DSSettingGroup alloc] init];
        {
            DSSettingItem *item = [DSSettingItem itemWithtype:DSSettingItemTypeNone title:@"电脑故障" icon:@"电脑故障"];
            item.cellActionName = @"computerFailure";
            item.rowHeight = 60;
            [group.items addObject:item];
        }
        
        group.headTitle = @"技术支持";
        [_array addObject:group];
    }
    self.dataSource = [[DSSettingDataSource alloc] initWithItems:_array];
    
    
}

- (void)setupUI {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    UILabel *headView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    headView.backgroundColor = [UIColor whiteColor];
    headView.text = @"HeadView";
    headView.font = [UIFont boldSystemFontOfSize:30.0f];
    headView.textAlignment = NSTextAlignmentCenter;
    self.tableView.tableHeaderView = headView;
    
}

#pragma mark -- Cell Action --

//电脑故障点击
- (void)computerFailure {
    NSLog(@"电脑故障");
}

@end

