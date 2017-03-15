//
//  ALTavFooterView.m
//  ArteriovenousLien
//
//  Created by wangwenjie on 2017/3/10.
//  Copyright © 2017年 Roo. All rights reserved.
//

#import "ALTavFooterView.h"

@implementation ALTavFooterView

+(instancetype) share {
    return [[[NSBundle mainBundle] loadNibNamed:@"ALTavFooterView" owner:nil options:nil] lastObject];
}
- (IBAction)btnAdd_touchUpInside:(id)sender {
    if (self.manageAL) {
        self.manageAL(YES);
    }
}
- (IBAction)btnReduce_touchUpInside:(id)sender {
    if (self.manageAL) {
        self.manageAL(NO);
    }
}

@end
