//
//  FriendGroupHeader.m
//  FriendListDemo
//
//  Created by WangLong on 16/11/9.
//  Copyright © 2016年 WangLong. All rights reserved.
//

#import "FriendGroupHeader.h"
#import "FriendGroup.h"
@interface FriendGroupHeader()
@property (nonatomic,weak) UIButton *nameView;
@property (nonatomic,weak) UILabel *countLabel;

@end

@implementation FriendGroupHeader

//1 创建自定义可重用的headerView
+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"group";
    FriendGroupHeader *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseId];
    if (headerView == nil) {
        headerView = [[self alloc] initWithReuseIdentifie:reuseId];
    }
    return headerView;
}

//创建子控件 初始化Frame
 - (instancetype)initWithReuseIdentifie:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //按钮的名称
        UIButton *nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:nameBtn];
        self.nameView = nameBtn;
        
        //按钮的属性
        [self.nameView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.nameView setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        //设置水平方向对其方式
        self.nameView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.nameView.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        self.nameView.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
        
        //设置按钮的背景图片
        [self.nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [self.nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        //图片不缩放
        self.nameView.imageView.contentMode = UIViewContentModeCenter;
        //超出部分不剪裁
        self.nameView.imageView.clipsToBounds = NO;
        
        
        //Label的个数设置
        UILabel *countLabel = [[UILabel alloc] init];
        [self.contentView addSubview:countLabel];
        self.countLabel = countLabel;
        //设置label的属性
        countLabel.textAlignment = NSTextAlignmentRight;
        countLabel.font = [UIFont systemFontOfSize:14];
        countLabel.textColor = [UIColor grayColor];
        
    }
    return self;
}


//往headerView中添加子控件的时候会调用
//当改变了headerView的frame会调用
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.nameView.frame = self.bounds;
    
    CGFloat countX = self.bounds.size.width - 10  - 150;
    self.countLabel.frame = CGRectMake(countX, 0, 150, 44);
}

//3 给子控件赋值
- (void)setFriendGroup:(FriendGroup *)friendGroup
{
    _friendGroup = friendGroup;
    [self.nameView setTitle:friendGroup.name forState:UIControlStateNormal];
    self.countLabel.text = [NSString stringWithFormat:@"%d/%lu",friendGroup.online,(unsigned long)friendGroup.friends.count];
    
    //解决重用带来的问题
    if (self.friendGroup.isExpend) {//展开
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{//合并
        self.nameView.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}
@end
