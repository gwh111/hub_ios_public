//
//  ccs+Input.m
//  Input
//
//  Created by gwh on 2020/3/5.
//  Copyright © 2020 gwh. All rights reserved.
//

#import "ccs+Input.h"

@implementation ccs (Input)

+ (Input *)input {
    Input *c = [ccs init:Input.class];
    [c cc_setup];
    return c;
}

@end
