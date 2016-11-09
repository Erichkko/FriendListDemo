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
#import "FriendGroupHeader.h"


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
    //3 设置组头的高度
    self.tableView.sectionHeaderHeight = 44;}
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

#pragma mark - headerView的代理方法
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    FriendGroupHeader *headerView = [FriendGroupHeader headerViewWithTableView:tableView];
    FriendGroup *friendGroup = self.friendGroups[section];
    headerView.friendGroup = friendGroup;
    return headerView;
}

//隐藏状态栏
- (BOOL) prefersStatusBarHidden
{
    return true;
}
@end
