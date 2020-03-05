//
//  ViewController.m
//  Input
//
//  Created by gwh on 2020/3/5.
//  Copyright 2020 gwh. All rights reserved.
//

#import "ViewController.h"
#import "ccs+Input.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)cc_viewWillLoad {
  
}

- (void)cc_viewDidLoad {
	 // Do any additional setup after loading the view.
    
    Input *c = ccs.input;
    [self.view addSubview:c.displayView];
    [c addDoneBlock:^(NSString * _Nonnull content) {
        CCLOG(@"%@",content);
    }];
    
}

@end
