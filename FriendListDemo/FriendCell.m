//
//  FriendCell.m
//  FriendListDemo
//
//  Created by WangLong on 16/11/9.
//  Copyright © 2016年 WangLong. All rights reserved.
//

#import "FriendCell.h"
#import "Friend.h"
@implementation FriendCell

+ (instancetype)friendCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"friend";
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
   
    return cell;
}


- (void)setFriend:(Friend *)friend
{
    _friend = friend;
    self.textLabel.text = friend.name;
    self.detailTextLabel.text = friend.intro;
    self.imageView.image = [UIImage imageNamed:friend.icon];
    //会员
    self.textLabel.textColor = friend.isVip ? [UIColor redColor] : [UIColor blackColor];}
@end
