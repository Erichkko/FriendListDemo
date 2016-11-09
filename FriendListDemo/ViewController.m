//
//  ViewController.m
//  SegmentDemo
//
//  Created by WangLong on 16/11/8.
//  Copyright © 2016年 WangLong. All rights reserved.
//

#import "ViewController.h"
#import "Friend.h"
#import "FriendGroup.h"
#import "FriendCell.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *friendGroups;
@end

@implementation ViewController

//懒加载Plist文件数据
- (NSArray *)friendGroups
{
    if (_friendGroups == nil) {
        _friendGroups = [FriendGroup friendgroupList];
    }
    return _friendGroups;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma - 数据源方法

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.friendGroups.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    FriendGroup *friendGroup = self.friendGroups[section];
//    return friendGroup.isExpend?friendGroup.friends.count:0;
    return friendGroup.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendCell *cell = [FriendCell friendCellWithTableView:tableView];
    FriendGroup *friendGroup = self.friendGroups[indexPath.section];
    Friend *friend = friendGroup.friends[indexPath.row];
    [cell setFriend:friend];
    return cell;
}



//隐藏状态栏
- (BOOL) prefersStatusBarHidden
{
    return true;
}
@end
