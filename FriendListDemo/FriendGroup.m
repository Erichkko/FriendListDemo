//
//  FriendGroup.m
//  FriendListDemo
//
//  Created by WangLong on 16/11/9.
//  Copyright © 2016年 WangLong. All rights reserved.
//

#import "FriendGroup.h"
#import "Friend.h"
@implementation FriendGroup

+ (instancetype)friendGroupDic:(NSDictionary *)dic
{
    return [[self alloc] initWithFriendGroup:dic];
}

- (instancetype)initWithFriendGroup:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (NSArray *)friendgroupList
{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tmpArray = [NSMutableArray array];
    
    //字典转模型
    for (NSDictionary *dic in dicArray) {
        FriendGroup *friendGroup = [FriendGroup friendGroupDic:dic];
        
        //内部字典转模型
        NSMutableArray *tmpFriendsArray = [NSMutableArray array];
        for (NSDictionary *friendDic in friendGroup.friends) {
            Friend *friend = [Friend friendWithDic:friendDic];
            [tmpFriendsArray addObject:friend];
        }
        
        friendGroup.friends = tmpFriendsArray;
        [tmpArray addObject:friendGroup];
    }
    return tmpArray;
}

@end
