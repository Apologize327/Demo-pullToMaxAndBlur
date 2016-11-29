//
//  UIImage+BlurImage.h
//  Demo-列表头部拉伸
//
//  Created by Suning on 16/11/28.
//  Copyright © 2016年 jf. All rights reserved.
//
// 图片模糊

#import <UIKit/UIKit.h>

@interface UIImage (BlurImage)

+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

@end
