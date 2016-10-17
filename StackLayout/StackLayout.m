//
//  StackLayout.m
//  YWCollectionView
//
//  Created by yuanwei on 15/12/26.
//  Copyright © 2015年 YuanWei. All rights reserved.
//

#import "StackLayout.h"

@implementation StackLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSMutableArray *list = [NSMutableArray array];
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *atrs = [self layoutAttributesForItemAtIndexPath:indexpath];
        [list addObject:atrs];
    }
    return list;
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.center = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    attrs.size = CGSizeMake(120, 120);
    
     // 设置层叠顺序
    attrs.zIndex = - indexPath.item;
    // 第0个
    if (indexPath.item == 0) return attrs;
    
    // 第[5, N]个
    if (indexPath.item > 4) {
        attrs.hidden = YES;
        return attrs;
    }
    
    // indexPath.item == [1, 2, 3, 4]
    NSArray *angles = @[@0, @(-0.2), @(0.2), @(-0.5), @(0.5)];
    CGFloat angle = [angles[indexPath.item] doubleValue];
    attrs.transform = CGAffineTransformMakeRotation(angle);
    
    return attrs;
}
@end
