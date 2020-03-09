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

// 是否离开app跳转到AppStore了
@property (nonatomic, assign) BOOL jump;
@property (nonatomic, retain) NSDate *backgroundDate;

// 从AppStore打分回来的回调
@property (nonatomic, strong) void (^jumpBackBlock)(BOOL success, NSTimeInterval timeInterval);

+ (instancetype)shared;

/**
* 添加从AppStore打分回来的回调
* @param block success  是否算打过分 如果间隔超过5秒 算打过分
*              timeInterval  自定义判断 根据离开回来的间隔时间
*/
- (void)addBackFromAppStoreBlock:(void(^)(BOOL success, NSTimeInterval timeInterval))block;

// 常用
- (void)aCheckRate:(NSString *)appId content:(NSString *)content block:(void(^)(BOOL rated))block;

/**
 * 自定义
 * @param appId  APPSTORE的应用id
 * @param ratedOnce  只打一次吗
 * @param rateProb  打分出现的概率 0-100
 * @param inAppRateProb  打分是应用内评分的概率 0-100
 */
- (void)checkRate:(NSString *)appId ratedOnce:(BOOL)ratedOnce rateProb:(NSUInteger)rateProb inAppRateProb:(NSUInteger)inAppRateProb title:(NSString *)title content:(NSString *)content btnTitles:(NSArray *)btnTitles block:(void(^)(BOOL rated))block;

@end

NS_ASSUME_NONNULL_END
