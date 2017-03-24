//
//  MyFocusCell.m
//  NCube
//
//  Created by 邢媛媛 on 16/10/31.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import "MyFocusCell.h"
#import "Masonry.h"
#import "ButtonModel.h"

#define Main_Height [UIScreen mainScreen].bounds.size.height
#define Main_Width  [UIScreen mainScreen].bounds.size.width
#define kWidth  Main_Width/375.0
#define kHeight Main_Height/667.0

@interface MyFocusCell ()

@property(nonatomic,strong)UIButton *focusButton;//关注

@end

@implementation MyFocusCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    
        [self setupUI];

    
    }
    return self;

}

- (void)setupUI{
    
    //加关注
    self.focusButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 0, 100, 30)];
    
    [self.focusButton addTarget:self action:@selector(focusButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.focusButton];

}

-(void) focusButtonClick:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(myFocusCellButtonDidClick:indexPath:)]) {
        self.model.color = [UIColor grayColor];
        self.model.isClick = NO;
        [self.delegate myFocusCellButtonDidClick:self indexPath:self.indexpath];
    }
    
}

- (void)setModel:(ButtonModel *)model {
    
    _model = model;
    self.focusButton.backgroundColor = model.color;
    self.focusButton.enabled = model.isClick;
    if (model.isClick) {
       [self.focusButton setTitle:@"可点击" forState:UIControlStateNormal];
    }else {
        [self.focusButton setTitle:@"不可以点击" forState:UIControlStateNormal];
    }
   
    
}





@end
