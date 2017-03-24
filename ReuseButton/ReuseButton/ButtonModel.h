//
//  ButtonModel.h
//  按钮的重用
//
//  Created by 宋钢强 on 2017/2/16.
//  Copyright © 2017年 宋钢强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ButtonModel : NSObject

/// 是否可点击
@property (nonatomic, assign) BOOL isClick;
@property (nonatomic, strong) UIColor *color;

@end
