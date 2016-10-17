//
//  LineLayoutViewController.m
//  YWCollectionView
//
//  Created by yuanwei on 15/12/26.
//  Copyright © 2015年 YuanWei. All rights reserved.
//

#import "LineLayoutViewController.h"
#import "YwImageCell.h"
#import "LineLayout.h"


static NSString *const cellId = @"identifier";

@interface LineLayoutViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray *imagesList;

@end

@implementation LineLayoutViewController

- (NSMutableArray *)imagesList{
    if (!_imagesList) {
        _imagesList = [[NSMutableArray alloc] init];
        for (int i = 0; i < 4; i++) {
            for (int j = 1; j <= 7; j++) {
                [_imagesList addObject:[NSString stringWithFormat:@"%d",j]];
            }
        }
    }
    return _imagesList;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    LineLayout *layout = [[LineLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 235) collectionViewLayout:layout];
    collectionView.delegate   = self;
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = NO;
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
