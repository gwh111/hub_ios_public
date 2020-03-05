//
//  Input.h
//  Input
//
//  Created by gwh on 2020/3/5.
//  Copyright © 2020 gwh. All rights reserved.
//

#import "ccs.h"

NS_ASSUME_NONNULL_BEGIN

@interface Input : CC_Controller

@property (nonatomic, retain) CC_View *displayView;

@property (nonatomic, retain) CC_TextView *contentView;
@property (nonatomic, retain) CC_Button *cancelBtn;
@property (nonatomic, retain) CC_Button *doneBtn;

// 取消回调
- (void)addCancelBlock:(void(^)(void))block;

// 确认回调
- (void)addDoneBlock:(void(^)(NSString *content))block;

@end

NS_ASSUME_NONNULL_END
