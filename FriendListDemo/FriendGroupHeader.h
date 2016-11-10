//
//  FriendGroupHeader.h
//  FriendListDemo
//
//  Created by WangLong on 16/11/9.
//  Copyright © 2016年 WangLong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FriendGroup,FriendGroupHeader;

@protocol FriendGroupHeaderDeleagte <NSObject>

@optional
-(void)headerViewDidClickNameBtn:(FriendGroupHeader *)headerView;

@end

@interface FriendGroupHeader : UITableViewHeaderFooterView
@property (nonatomic,strong) FriendGroup *friendGroup;
//定义代理属性
@property (nonatomic,weak) id <FriendGroupHeaderDeleagte> delegate;

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;
@end
