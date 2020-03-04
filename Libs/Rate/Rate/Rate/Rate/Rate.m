//
//  Rate.m
//  Rate
//
//  Created by gwh on 2020/3/4.
//  Copyright © 2020 gwh. All rights reserved.
//

#import "Rate.h"
#import <StoreKit/StoreKit.h>

@implementation Rate

- (void)aCheckRate:(NSString *)appId content:(NSString *)content block:(void(^)(BOOL rated))block {
    
    [self checkRate:appId ratedPass:YES ratePro:50 inAppRatePro:50 title:@"感谢体验" content:content btnTitles:@[@"以后再说",@"去评论"] block:block];
}

- (void)checkRate:(NSString *)appId ratedPass:(BOOL)ratedPass ratePro:(NSUInteger)ratePro inAppRatePro:(NSUInteger)inAppRatePro title:(NSString *)title content:(NSString *)content btnTitles:(NSArray *)btnTitles block:(void(^)(BOOL rated))block {
    
    if (ratedPass) {
        if ([[ccs getDefault:@"rated"] intValue] == 9) {
            return;
        }
    }
    
    int rand = arc4random()%100;
    // 一定概率弹评论
    if (rand <= ratePro) {
        int rateType = 0;
        if (@available(iOS 10.3, *)) {
            if([SKStoreReviewController respondsToSelector:@selector(requestReview)]) {// iOS 10.3 以上支持
                // 一定概率应用内评论
                int rand = arc4random()%100;
                if (rand <= inAppRatePro) {
                    rateType = 1;
                }else{
                    
                }
            }
        }
        
        if (rateType == 0) {
            [ccs showAltOn:[self.cc_displayView cc_viewController] title:title msg:content bts:btnTitles block:^(int index, NSString *name) {
                
                if (index == 1) {

                    NSString *urlStr = [ccs string:@"itms-apps://itunes.apple.com/app/id%@",appId];
                    if (@available(iOS 10.0, *)) {
                        [UIApplication.sharedApplication openURL:[NSURL URLWithString:urlStr] options:ccs.mutDictionary completionHandler:^(BOOL success) {
                            
                        }];
                    } else {
                        // Fallback on earlier versions
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
                    }
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
