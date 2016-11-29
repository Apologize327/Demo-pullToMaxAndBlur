//
//  ItemCell.m
//  Demo-列表头部拉伸
//
//  Created by Suning on 16/5/3.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "ItemCell.h"

#define mScreenWidth    [UIScreen mainScreen].bounds.size.width
#define mScreenHeight   [UIScreen mainScreen].bounds.size.height

@interface ItemCell()

@property(nonatomic,strong) UILabel *textLabel;

@end

@implementation ItemCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.textLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        self.textLabel.font = [UIFont systemFontOfSize:14.0];
        self.textLabel.backgroundColor = [UIColor brownColor];
        [self.contentView addSubview:self.textLabel];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.frame = CGRectMake(mScreenWidth/2-100, 0, 150, 40);
}

-(void)setTextname:(NSString *)textname{
    self.textLabel.text = textname;
}

@end
