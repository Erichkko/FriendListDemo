//
//  Friend.m
//  FriendListDemo
//
//  Created by WangLong on 16/11/9.
//  Copyright © 2016年 WangLong. All rights reserved.
//

#import "Friend.h"

@implementation Friend
/**
 *  name    类方法
 *  return  self
 *  @param  dic param2, ...#>
 *
 **/


+ (instancetype)friendWithDic:(NSDictionary *)dic
{
    Friend * friend = [[self alloc] initWithDic:dic];
    return friend;
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
@end
