//
//  MyFocusCell.h
//  NCube
//
//  Created by 邢媛媛 on 16/10/31.
//  Copyright © 2016年 junjie.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ButtonModel;
@protocol MyFocusCellButtonClickDelegate;

@interface MyFocusCell : UITableViewCell

@property (nonatomic, strong) ButtonModel *model;
@property (nonatomic, strong) NSIndexPath *indexpath;
@property (nonatomic, weak) id<MyFocusCellButtonClickDelegate> delegate;

@end

@protocol MyFocusCellButtonClickDelegate <NSObject>

- (void)myFocusCellButtonDidClick:(MyFocusCell *)cell indexPath:(NSIndexPath *)indexPath;


@end
