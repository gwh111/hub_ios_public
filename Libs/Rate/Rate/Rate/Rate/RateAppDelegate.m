//
//  RateAppDelegate.m
//  Rate
//
//  Created by gwh on 2020/3/9.
//  Copyright © 2020 gwh. All rights reserved.
//

#import "RateAppDelegate.h"
#import "Rate.h"

@implementation RateAppDelegate

+ (void)load {
    [ccs registerAppDelegate:self];
}

- (void)cc_applicationWillResignActive:(UIApplication *)application {
    // 赋值离开时间
    Rate.shared.backgroundDate = [NSDate date];
}

- (void)cc_applicationDidEnterBackground:(UIApplication *)application {
    // 赋值离开时间
    Rate.shared.backgroundDate = [NSDate date];
}

- (void)cc_applicationDidBecomeActive:(UIApplication *)application {

    if (Rate.shared.jump) {
        Rate.shared.jump = 0;
        NSDate *currentDate = [NSDate date];
        NSTimeInterval t = [ccs.tool compareDate:currentDate cut:Rate.shared.backgroundDate];
        if (t >= 5) {
            // 超过5秒 算打过分了
            if (Rate.shared.jumpBackBlock) {
                Rate.shared.jumpBackBlock(1, t);
            }
        } else {
            if (Rate.shared.jumpBackBlock) {
                Rate.shared.jumpBackBlock(0, t);
            }
        }
    }
}

@end
