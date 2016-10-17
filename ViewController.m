//
//  ViewController.m
//  YWCollectionView
//
//  Created by yuanwei on 15/12/26.
//  Copyright © 2015年 YuanWei. All rights reserved.
//

#import "ViewController.h"
#import "LineLayoutViewController.h"
#import "CircleLayoutViewController.h"
#import "StackViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *dataList;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [self.dataList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _dataList[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    UIViewController *Vc = nil;
    
    switch (indexPath.row) {
        case 0:
            Vc  = [[LineLayoutViewController alloc] init];
            break;
        case 1:
            Vc  = [[CircleLayoutViewController alloc] init];
            break;
        case 2:
            Vc  = [[StackViewController alloc] init];
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:Vc animated:YES];
}

- (NSArray *)dataList{
    if (!_dataList) {
        _dataList = @[@"线性布局",@"环形布局",@"垛形布局"];
    }
    return _dataList;
}


@end
