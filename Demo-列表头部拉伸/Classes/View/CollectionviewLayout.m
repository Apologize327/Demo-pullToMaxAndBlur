//
//  CollectionviewLayout.m
//  Demo-列表头部拉伸
//
//  Created by Suning on 16/5/3.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "CollectionviewLayout.h"

@implementation CollectionviewLayout

//当collectionview的bounds发生改变时，是否需要刷新布局
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

-(UICollectionViewScrollDirection)scrollDirection{
    return UICollectionViewScrollDirectionVertical;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    UICollectionView *collectionView = [self collectionView];
    CGPoint offset = [collectionView contentOffset];
    
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    if (offset.y < 0) {
        // fabs 取绝对值
        CGFloat deltaY = fabs(offset.y);
        for (UICollectionViewLayoutAttributes *attr in attributes) {
            NSString *kind = [attr representedElementKind];
            if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
                CGSize headerSize = [self headerReferenceSize];
                CGRect headRect = attr.frame;
                headRect.size.height = headerSize.height + deltaY;
                headRect.size.width = headerSize.width + deltaY;
                headRect.origin.y = headRect.origin.y - deltaY;
                headRect.origin.x = headRect.origin.x - deltaY/2;
                [attr setFrame:headRect];
                break;
            }
        }
    }
    return attributes;
}

@end
