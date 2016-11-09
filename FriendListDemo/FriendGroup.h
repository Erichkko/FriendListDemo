//
//  FriendGroup.h
//  FriendListDemo
//
//  Created by WangLong on 16/11/9.
//  Copyright © 2016年 WangLong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendGroup : NSObject

/**
 * 分组名称
 */
@property (nonatomic,copy) NSString *name;

/**
 * 是否在线
 */
@property (nonatomic,assign) int online;

/**
 * 是否展开
 */
@property (nonatomic,assign,getter=isExpend) BOOL expend;

/**
 * 分组成员列表
 */
@property (nonatomic,strong) NSArray *friends;

//方法
+ (instancetype) friendGroupDic:(NSDictionary *)dic;
- (instancetype) initWithFriendGroup:(NSDictionary *)dic;
+ (NSArray *)friendgroupList;
@end
