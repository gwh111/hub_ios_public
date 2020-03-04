//
//  ViewController.m
//  Rate
//
//  Created by gwh on 2020/3/4.
//  Copyright 2020 gwh. All rights reserved.
//

#import "ViewController.h"
#import "ccs+Rate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)cc_viewWillLoad {
  
}

- (void)cc_viewDidLoad {
	 // Do any additional setup after loading the view.
    
    [ccs.rate aCheckRate:@"哈哈" content:@"asdasd" block:^(BOOL rated) {
        
    }];
}

@end
