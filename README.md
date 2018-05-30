# DSSettingDataSource

### 方便构建一个设置界面，只需要设置一下数据源，不需要继承。

![效果图](https://github.com/helloAda/DSSettingDataSource/blob/master/DSSettingDataSource/Image/demo.png)


### 使用如下:

######  `#import "DSSettingDataSource.h"`

```
//如果 tableView.style 为group 

    {
        DSSettingGroup *group = [[DSSettingGroup alloc] init];
        
        {
            DSSettingItem *item = [DSSettingItem itemWithtype:DSSettingItemTypeSwitch title:@"打卡补签" icon:@"打卡补签"];
            item.didSelectBlock = ^{
                //todo
            };
            item.isSwitchOn = YES;
            item.switchClick = ^(BOOL on) {
                //todo
            };
            [group.items addObject:item];
            
        }
        {
            DSSettingItem *item = [DSSettingItem itemWithtype:DSSettingItemTypeDetial title:@"休假申请" icon:@"休假申请"];
            item.details = @"请假、调休";
            item.didSelectBlock = ^{
                //todo
            };
            [group.items addObject:item];
            
        }
        {
            DSSettingItem *item = [DSSettingItem itemWithtype:DSSettingItemTypeNone title:@"人事申请" icon:@"人事申请"];
            item.didSelectBlock = ^{
                //todo
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
            DSSettingItem *item = [DSSettingItem itemWithtype:DSSettingItemTypeNone title:@"电脑故障" icon:@"电脑故障"];
            item.cellActionName = @"computerFailure";
            item.rowHeight = 60;
            [group.items addObject:item];
        }
        
        group.headTitle = @"技术支持";
        [_array addObject:group];
    }

_dataSource = [[DSSettingDataSource alloc] initWithItems:_array];

self.tableView.dataSource = _dataSource;
self.tableView.delegate = _dataSource;

```

```
/*
如果 tableView.style 为Plain 则不需要使用DSSettingGroup 
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
_dataSource = [[DSSettingDataSource alloc] initWithItems:_array];

self.tableView.dataSource = _dataSource;
self.tableView.delegate = _dataSource;
```

```
自定义Cell的时候，Cell遵循DSSettingCellProtocol协议
实现协议方法即可
```

#### 目前支持
- 2018.05.30 
- 支持自定义Cell，点击事件可选择Block或任意自定义方法
- 增加禁止Cell点击，分割线距左边距离，自定义行高
- 2018.04.24 
- 提供一个 默认Cell支持右边带有Switch按钮

#### 有使用问题可以 [issues](https://github.com/helloAda/DSSettingDataSource/issues)
