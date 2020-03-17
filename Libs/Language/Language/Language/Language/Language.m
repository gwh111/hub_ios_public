//
//  Language.m
//  GameSP
//
//  Created by gwh on 2020/2/2.
//  Copyright © 2020 gwh. All rights reserved.
//

#import "Language.h"

@implementation Language

+ (instancetype)shared {
    return [ccs registerSharedInstance:self block:^{
        NSArray *languages = [NSLocale preferredLanguages];
        NSString *currentLanguage = [languages objectAtIndex:0];
        // 是否使用中文作为iphone语言
        Language.shared.isChinese = [currentLanguage containsString:@"zh"];
    }];
}

- (NSString *)textChinese:(NSString *)ch andEnglish:(NSString *)eng {
    if (_isChinese) {
        return ch;
    }
    return eng;
}

- (NSArray *)textChineseList:(NSArray *)chList andEnglishList:(NSArray *)engList {
    if (_isChinese) {
        return chList;
    }
    return engList;
}

@end
