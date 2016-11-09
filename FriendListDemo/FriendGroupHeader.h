//
//  FriendGroupHeader.h
//  FriendListDemo
//
//  Created by WangLong on 16/11/9.
//  Copyright © 2016年 WangLong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendGroup;
@interface FriendGroupHeader : UITableViewHeaderFooterView
@property (nonatomic,strong) FriendGroup *friendGroup;
+ (instancetype)headerViewWithTableView:(UITableView *)tableView;
@end
