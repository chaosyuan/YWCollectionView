//
//  LineLayout.m
//  YWCollectionView
//
//  Created by yuanwei on 15/12/26.
//  Copyright © 2015年 YuanWei. All rights reserved.
//

#import "LineLayout.h"

@implementation LineLayout



// 提前初始化一些参数
- (void)prepareLayout{
    [super prepareLayout];
    
    // 只有线性布局才会有这个属性
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 设置cell的大小
    CGFloat itemW = self.collectionView.frame.size.height * 0.8;
    self.itemSize = CGSizeMake(itemW, itemW);
}

// 获取collectionView的所有item项，进行相应的处理
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    // 调用父类方法取到默认的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    // 获得collectionView最中间的x值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    
    for (UICollectionViewLayoutAttributes *attrs in array) {
        CGFloat delta = ABS(centerX - attrs.center.x);
        CGFloat scale = 1 - delta /(self.collectionView.frame.size.width + self.itemSize.width);
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return array;
}


//  当collectionView的bounds发生改变时，是否要刷新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}


// targetContentOffset ：通过修改后，collectionView最终的contentOffset(取于决定情况)
// proposedContentOffset默认的ContentOffset

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    // 计算最终的可见范围
    CGRect rect;
    rect.origin = proposedContentOffset;
    rect.size = self.collectionView.frame.size;
    
    // 取得cell的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    // 计算collectionView最终中间的x
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    // 计算最小的间距值
    CGFloat minDetal = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (ABS(minDetal) > ABS(attrs.center.x - centerX)) {
            minDetal = attrs.center.x - centerX;
        }
    }
    
    // 在原有offset的基础上进行调整
    return CGPointMake(proposedContentOffset.x + minDetal, proposedContentOffset.y);
}

@end
