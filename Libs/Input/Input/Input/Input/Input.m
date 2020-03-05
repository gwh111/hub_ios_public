//
//  Input.m
//  Input
//
//  Created by gwh on 2020/3/5.
//  Copyright © 2020 gwh. All rights reserved.
//

#import "Input.h"

@interface Input ()

@property (nonatomic, strong) void (^btnCancelBlock)(void);
@property (nonatomic, strong) void (^btnDoneBlock)(NSString *content);

@end

@implementation Input

- (void)dismiss {
    [UIView animateWithDuration:.5f animations:^{
        self.displayView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.displayView removeFromSuperview];
    }];
}

- (void)cc_setup {
    
    [self initUI];
}

- (void)initUI {
    
    _displayView = ccs.View;
    _displayView.backgroundColor = RGBA(0, 0, 0, .8);
    _displayView.frame = CGRectMake(0, 0, WIDTH(), HEIGHT());
    _displayView.alpha = 0;
    [UIView animateWithDuration:.5f animations:^{
        self.displayView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];

    _contentView = ccs.TextView
    .cc_frame(RH(10), ccs.y + RH(10), WIDTH() - RH(20), RH(200))
    .cc_font(RF(16))
    .cc_backgroundColor(RGBA(0, 0, 0, 0.8))
    .cc_textColor(COLOR_WHITE)
    .cc_addToView(_displayView);
    
    NSArray *names = @[@"取消",@"确认"];
    for (NSString *name in names) {

        CC_Button *btn = ccs.Button
        .cc_setTitleForState(name,UIControlStateNormal)
        .cc_setTitleColorForState(COLOR_WHITE,UIControlStateNormal)
        .cc_font(RF(16))
        .cc_addToView(_displayView);
        if ([name isEqualToString:@"取消"]) {
            btn.cc_frame(RH(10), _contentView.bottom, RH(60), RH(50));
            [btn addTappedOnceDelay:.1 withBlock:^(CC_Button *btn) {
                if (self.btnCancelBlock) {
                    self.btnCancelBlock();
                }
                [self.displayView removeFromSuperview];
            }];
        } else {
            btn.cc_frame(WIDTH() - RH(70), _contentView.bottom, RH(60), RH(50));
            [btn addTappedOnceDelay:.1 withBlock:^(CC_Button *btn) {
                if (self.btnDoneBlock) {
                    self.btnDoneBlock(self.contentView.text);
                }
                [self.displayView removeFromSuperview];
            }];
        }
    }
}

- (void)addCancelBlock:(void(^)(void))block {
    _btnCancelBlock = block;
    
}

- (void)addDoneBlock:(void(^)(NSString *content))block {
    _btnDoneBlock = block;
    
}

@end
