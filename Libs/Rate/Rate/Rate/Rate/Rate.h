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

// 自定义
- (void)checkRate:(NSString *)appId title:(NSString *)title content:(NSString *)content btnTitles:(NSArray *)btnTitles block:(void(^)(BOOL rated))block;

@end

NS_ASSUME_NONNULL_END
