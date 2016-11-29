//
//  ViewController.m
//  Demo-CAShapeLayer
//
//  Created by Suning on 16/4/28.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Frame.h"
#import "ItemCell.h"
#import "CollectionviewLayout.h"
#import "HeaderView.h"

#define mScreenWidth    [UIScreen mainScreen].bounds.size.width
#define mScreenHeight   [UIScreen mainScreen].bounds.size.height
#define collectionViewHeaderHeight  240

NSString *const mCellId = @"cell";
NSString *const mHeadId = @"head";

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    UICollectionView *_collectionView;
}

@property(nonatomic,strong) UIVisualEffectView *effectView;
@property(nonatomic,strong) CollectionviewLayout *layout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpBackGround];
}

-(void)setUpBackGround{
    CollectionviewLayout *layout = [[CollectionviewLayout alloc]init];
    layout.itemSize = CGSizeMake(mScreenWidth, 40);
    layout.headerReferenceSize = CGSizeMake(mScreenWidth, collectionViewHeaderHeight);
    self.layout = layout;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, mScreenWidth, mScreenHeight) collectionViewLayout:layout];
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor orangeColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[ItemCell class] forCellWithReuseIdentifier:mCellId];
    [_collectionView registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:mHeadId];
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:(UIBlurEffectStyleLight)];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectView.alpha = 0;
    self.effectView = effectView;
    [_collectionView addSubview:_effectView];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 15;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:mCellId forIndexPath:indexPath];
    cell.textname = [NSString stringWithFormat:@"例子%ld",indexPath.row];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:mHeadId forIndexPath:indexPath];
        headView.iconName = @"a.jpg";
        
        return headView;
    }
    return nil;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offSetY = scrollView.contentOffset.y;
    CGFloat deltaY = fabs(offSetY);
    if (offSetY < 0) {
        CGSize headerSize = [self.layout headerReferenceSize];
        CGRect headRect = CGRectZero;
        headRect.size.height = headerSize.height + deltaY;
        headRect.size.width = headerSize.width + deltaY;
        headRect.origin.y = headRect.origin.y - deltaY;
        headRect.origin.x = headRect.origin.x - deltaY/2;
        self.effectView.frame = headRect;
        self.effectView.alpha = deltaY/collectionViewHeaderHeight*1.5 ;
    }
}

@end
