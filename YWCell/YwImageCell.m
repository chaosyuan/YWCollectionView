//
//  YwImageCell.m
//  YWCollectionView
//
//  Created by yuanwei on 15/12/26.
//  Copyright © 2015年 YuanWei. All rights reserved.
//

#import "YwImageCell.h"


@interface YwImageCell()

@property (nonatomic,weak) IBOutlet UIImageView *imageView;

@end

@implementation YwImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imageView.layer.borderWidth = 5;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.cornerRadius = 5;
    self.imageView.clipsToBounds = YES;
}
- (void)setImagestr:(NSString *)imagestr{
    
    _imagestr = [imagestr copy];
    
    self.imageView.image = [UIImage imageNamed:imagestr];
}


@end
