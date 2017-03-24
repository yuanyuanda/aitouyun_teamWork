//
//  ViewController.m
//  按钮
//
//  Created by 宋钢强 on 2017/2/16.
//  Copyright © 2017年 宋钢强. All rights reserved.
//

#import "ViewController.h"
#import "MyFocusCell.h"
#import "ButtonModel.h"
CGFloat kNavigationBarHeight = 64;

#define Main_Height [UIScreen mainScreen].bounds.size.height
#define Main_Width  [UIScreen mainScreen].bounds.size.width
#define kWidth  Main_Width/375.0
#define kHeight Main_Height/667.0
#define Color_BasePageBackground RGB(248,248,248)//全局基页面的颜色


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,MyFocusCellButtonClickDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *models;


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createModelData];
    [self creatUI];
    
}

- (void)createModelData {
    
    self.models = [NSMutableArray array];
    for (int i = 0; i<30; i++) {
        ButtonModel *model = [[ButtonModel alloc]init];
        model.isClick = YES;
        model.color = [UIColor greenColor];
        [self.models addObject:model];
    }
    

}


- (void)creatUI {
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,kNavigationBarHeight * kHeight, Main_Width,Main_Height-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"MyFocusVC";
    MyFocusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MyFocusCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = self.models[indexPath.row];
    cell.indexpath = indexPath;
    cell.delegate = self;
    return cell;
    
}

- (void)myFocusCellButtonDidClick:(MyFocusCell *)cell indexPath:(NSIndexPath *)indexPath {
//    ButtonModel *tempModel = self.models[indexPath.row];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

@end
