//
//  Rate.h
//  Rate
//
//  Created by gwh on 2020/3/4.
//  Copyright © 2020 gwh. All rights reserved.
//

#import "ccs.h"

NS_ASSUME_NONNULL_BEGIN

@interface Rate : CC_Controller

// 常用
- (void)aCheckRate:(NSString *)appId content:(NSString *)content block:(void(^)(BOOL rated))block;

/**
 * 自定义
 * @param appId  APPSTORE的应用id
 * @param ratedPass  已经打过分的过滤
 * @param ratePro  打分出现的概率 0-100
 * @param inAppRatePro  打分是应用内评分的概率 0-100
 */
- (void)checkRate:(NSString *)appId ratedPass:(BOOL)ratedPass ratePro:(NSUInteger)ratePro inAppRatePro:(NSUInteger)inAppRatePro title:(NSString *)title content:(NSString *)content btnTitles:(NSArray *)btnTitles block:(void(^)(BOOL rated))block;

@end

NS_ASSUME_NONNULL_END
