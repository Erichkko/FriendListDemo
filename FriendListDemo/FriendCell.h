//
//  FriendCell.h
//  FriendListDemo
//
//  Created by WangLong on 16/11/9.
//  Copyright © 2016年 WangLong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Friend;
@interface FriendCell : UITableViewCell

/**
 * 好友列表信息
 */
@property (nonatomic,strong) Friend *friend;

+ (instancetype)friendCellWithTableView:(UITableView *)tableView;
@end
