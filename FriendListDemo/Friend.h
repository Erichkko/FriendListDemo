//
//  Friend.h
//  FriendListDemo
//
//  Created by WangLong on 16/11/9.
//  Copyright © 2016年 WangLong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject


/**
 * icon
 */
@property(nonatomic,copy) NSString *icon;

@property(nonatomic,copy) NSString *intro;

@property(nonatomic,copy) NSString *name;

@property(nonatomic,assign,getter=isVip) BOOL vip;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)friendWithDic:(NSDictionary *)dic;

@end
