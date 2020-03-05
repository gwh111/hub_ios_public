#import "ccs+Input.h"

Input *c = ccs.input;
[self.view addSubview:c.displayView];
[c addDoneBlock:^(NSString * _Nonnull content) {
    CCLOG(@"%@",content);
}];