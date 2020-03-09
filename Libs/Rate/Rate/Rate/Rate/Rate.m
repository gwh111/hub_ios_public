//
//  Rate.m
//  Rate
//
//  Created by gwh on 2020/3/4.
//  Copyright © 2020 gwh. All rights reserved.
//

#import "Rate.h"
#import <StoreKit/StoreKit.h>

@interface Rate()

@end

@implementation Rate

+ (instancetype)shared {
    return [ccs registerSharedInstance:self];
}

- (void)addBackFromAppStoreBlock:(void(^)(BOOL success, NSTimeInterval timeInterval))block {
    _jumpBackBlock = block;
}

- (void)aCheckRate:(NSString *)appId content:(NSString *)content block:(void(^)(BOOL rated))block {
    
    [self checkRate:appId ratedOnce:YES rateProb:50 inAppRateProb:50 title:@"感谢体验" content:content btnTitles:@[@"以后再说",@"去评论"] block:block];
}

- (void)checkRate:(NSString *)appId ratedOnce:(BOOL)ratedOnce rateProb:(NSUInteger)rateProb inAppRateProb:(NSUInteger)inAppRateProb title:(NSString *)title content:(NSString *)content btnTitles:(NSArray *)btnTitles block:(void(^)(BOOL rated))block {
    
    if (ratedOnce) {
        if ([[ccs getDefault:@"rated"] intValue] == 9) {
            return;
        }
    }
    
    int rand = arc4random()%100;
    // 一定概率弹评论
    if (rand <= rateProb) {
        int rateType = 0;
        if (@available(iOS 10.3, *)) {
            if([SKStoreReviewController respondsToSelector:@selector(requestReview)]) {// iOS 10.3 以上支持
                // 一定概率应用内评论
                int rand = arc4random()%100;
                if (rand < inAppRateProb) {
                    rateType = 1;
                }else{
                    
                }
            }
        }
        
        if (rateType == 0) {
            [ccs showAltOn:ccs.currentVC title:title msg:content bts:btnTitles block:^(int index, NSString *name) {
                
                if (index == 1) {

                    NSString *urlStr = [ccs string:@"itms-apps://itunes.apple.com/app/id%@",appId];
                    if (@available(iOS 10.0, *)) {
                        [UIApplication.sharedApplication openURL:[NSURL URLWithString:urlStr] options:ccs.mutDictionary completionHandler:^(BOOL success) {
                            
                        }];
                    } else {
                        // Fallback on earlier versions
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
                    }
                    
                    // 设置标志
                    Rate.shared.jump = YES;
                    [ccs saveDefaultKey:@"rated" value:@(9)];
                    block(YES);
                } else {
                    block(NO);
                }
            }];
        } else if (rateType == 1) {
            if (@available(iOS 10.3, *)) {
                [[UIApplication sharedApplication].keyWindow endEditing:YES];
                [SKStoreReviewController requestReview];
                [ccs saveDefaultKey:@"rated" value:@(9)];
            }
        }
    }
}

@end
