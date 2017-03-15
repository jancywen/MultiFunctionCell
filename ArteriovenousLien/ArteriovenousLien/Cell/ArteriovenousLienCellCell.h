//
//  ArteriovenousLienCellCell.h
//  ArteriovenousLien
//
//  Created by wangwenjie on 2017/3/7.
//  Copyright © 2017年 Roo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IQDropDownTextField.h"
#import "ArteriovenousLien-Swift.h"

@protocol ALCellDelegate <NSObject>

@optional
- (void)reloadTabelCell:(NSInteger)index;
- (void)addAction;
- (void)reduceAction:(NSInteger)index;
@end


@interface ArteriovenousLienCellCell : UITableViewCell

@property (nonatomic, strong) ObjALInfo *nodeInfo;

@property (nonatomic, assign) id <ALCellDelegate> delegate;

@property (nonatomic, assign) CGFloat cellH;

@property (nonatomic, assign) NSInteger  index;

@property (weak, nonatomic) IBOutlet UIButton *btnLeft;
@property (weak, nonatomic) IBOutlet UIButton *btnCenter;
@property (weak, nonatomic) IBOutlet UIButton *btnRight;

@end
