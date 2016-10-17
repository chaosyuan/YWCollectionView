//
//  CircleLayoutViewController.m
//  YWCollectionView
//
//  Created by yuanwei on 15/12/26.
//  Copyright © 2015年 YuanWei. All rights reserved.
//

#import "CircleLayoutViewController.h"
#import "YwImageCell.h"
#import "CircleLayout.h"


static NSString *const cellId = @"identifier";


@interface CircleLayoutViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray *imagesList;

@end

@implementation CircleLayoutViewController

- (NSMutableArray *)imagesList{
    if (!_imagesList) {
        _imagesList = [[NSMutableArray alloc] init];
        for (int i = 0; i < 2; i++) {
            for (int j = 1; j <= 7; j++) {
                [_imagesList addObject:[NSString stringWithFormat:@"%d",j]];
            }
        }
    }
    return _imagesList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    
    CircleLayout *layout = [[CircleLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400) collectionViewLayout:layout];
    collectionView.delegate   = self;
    collectionView.dataSource = self;
    collectionView.center = self.view.center;
    [collectionView registerNib:[UINib nibWithNibName:@"YwImageCell" bundle:nil] forCellWithReuseIdentifier:cellId];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}
#pragma mark --UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.imagesList count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YwImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.imagestr = self.imagesList[indexPath.item];
    return cell;
}


#pragma mark --UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.imagesList removeObjectAtIndex:indexPath.item];
    
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
