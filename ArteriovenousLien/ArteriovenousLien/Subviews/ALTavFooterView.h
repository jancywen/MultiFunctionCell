//
//  ALTavFooterView.h
//  ArteriovenousLien
//
//  Created by wangwenjie on 2017/3/10.
//  Copyright © 2017年 Roo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALTavFooterView : UIView

+(instancetype) share;

@property (nonatomic, copy) void(^manageAL)(BOOL isAdd);

@end
