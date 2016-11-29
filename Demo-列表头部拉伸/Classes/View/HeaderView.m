//
//  HeaderView.m
//  Demo-列表头部拉伸
//
//  Created by Suning on 16/5/4.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "HeaderView.h"
#import "UIImage+BlurImage.h"

@interface HeaderView()

@end

@implementation HeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.iconView = [[UIImageView alloc]init];
        self.iconView.frame = CGRectZero;
        [self addSubview:self.iconView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.iconView.frame = self.bounds;
}

-(void)setIconName:(NSString *)iconName{
    self.iconView.image = [UIImage imageNamed:iconName];
}

@end
