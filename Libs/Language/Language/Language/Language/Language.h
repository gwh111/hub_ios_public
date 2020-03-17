//
//  Language.h
//  GameSP
//
//  Created by gwh on 2020/2/2.
//  Copyright © 2020 gwh. All rights reserved.
//

#import "ccs.h"

NS_ASSUME_NONNULL_BEGIN

@interface Language : NSObject

// 是否为中文会自动判断，也可手动修改
@property (nonatomic, assign) BOOL isChinese;

+ (instancetype)shared;

- (NSString *)textChinese:(NSString *)ch andEnglish:(NSString *)eng;
- (NSArray *)textChineseList:(NSArray *)chList andEnglishList:(NSArray *)engList;

@end

NS_ASSUME_NONNULL_END
