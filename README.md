# DSSettingDataSource

### 方便构建一个设置界面，只需要设置一下数据源，不需要继承。

![效果图](https://github.com/helloAda/DSSettingDataSource/blob/master/DSSettingDataSource/Image/demo.png)


### 使用如下:

######  `#import "DSSettingDataSource.h"`

```
//如果 tableView.style 为group 

DSSettingItems *items = [[DSSettingItems alloc] init];

{
    DSSettingItem *item = [DSSettingItem itemWithTitle:@"打卡补签" icon:@"打卡补签"     type:DSSettingItemTypeSwitch];
    item.isSwitchOn = YES;
    item.didSelectBlock = ^{
        // todo
    };
    item.switchClick = ^(BOOL on) {
        // todo
    };
    [items.items addObject:item];

}
{
    DSSettingItem *item = [DSSettingItem itemWithTitle:@"休假申请" icon:@"休假申请" detial:@"请假、调休" type:DSSettingItemTypeDetial];
    item.didSelectBlock = ^{
        // todo
    };

}
[items.items addObject:item];
items.headTitle = @"人力资源部";
items.footTitle = @"为您提供便利服务";
[_array addObject:items];

_dataSource = [[DSSettingDataSource alloc] initWithItems:_array];

self.tableView.dataSource = _dataSource;
self.tableView.delegate = _dataSource;

```

```
/*
如果 tableView.style 为Plain 则不需要使用DSSettingItems 
直接将DSSettingItem 添加到数据源
*/

{
    DSSettingItem *item = [DSSettingItem itemWithTitle:@"付款申请" icon:@"付款申请" type:DSSettingItemTypeArrow];
    item.didSelectBlock = ^{
        //todo
    };
    [_array addObject:item];
}
{
    DSSettingItem *item = [DSSettingItem itemWithTitle:@"交通报销" icon:@"交通报销" type:DSSettingItemTypeArrow];
    item.didSelectBlock = ^{
        //todo
    };
    [_array addObject:item];

}
_dataSourcedataSource = [[DSSettingDataSource alloc] initWithItems:_array];

self.tableView.dataSource = _dataSource;
self.tableView.delegate = _dataSource;
```

#### 有使用问题可以 [issues](https://github.com/helloAda/DSSettingDataSource/issues)
