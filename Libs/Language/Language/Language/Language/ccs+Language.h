//
//  ccs+Language.h
//  GameSP
//
//  Created by gwh on 2020/3/17.
//  Copyright © 2020 gwh. All rights reserved.
//

#import "ccs.h"
#import "Language.h"

NS_ASSUME_NONNULL_BEGIN

#define LANGUAGE(ch,eng) [Language.shared textChinese:ch andEnglish:eng]

@interface ccs (Language)

+ (Language *)language;

@end

NS_ASSUME_NONNULL_END
