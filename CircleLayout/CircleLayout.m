//
//  CircleLayout.m
//  YWCollectionView
//
//  Created by yuanwei on 15/12/26.
//  Copyright © 2015年 YuanWei. All rights reserved.
//

#import "CircleLayout.h"

@implementation CircleLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    NSMutableArray *list = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        
        // 创建i位置上  item对应的indexpath
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:i inSection:0];

        // 创建i位置上 item对应的
        UICollectionViewLayoutAttributes *atrs = [self layoutAttributesForItemAtIndexPath:indexpath];
        // 添加布局属性
        [list addObject:atrs];
    }
    return list;
}

// 返回indexpath上cell的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // 半径
    CGFloat radius = 100;
    // 圆心
    CGFloat centerX = self.collectionView.frame.size.width * 0.5f;
     // 创建i位置cell对应的布局属性
    CGFloat centerY = self.collectionView.frame.size.height * 0.5f;
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.size = CGSizeMake(80, 80);
    
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    
    if (count == 1) {
        attrs.center = CGPointMake(centerX, centerY);
    }else{
        CGFloat angle = 2 * M_PI / count * indexPath.item;
        CGFloat attrsCenterX = centerX - radius * cos(angle);
        CGFloat attrsCenterY = centerY - radius * sin(angle);
        attrs.center = CGPointMake(attrsCenterX, attrsCenterY);
    }
    return attrs;
}

@end
