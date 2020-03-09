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
    
    [ccs.rate addBackFromAppStoreBlock:^(BOOL success, NSTimeInterval timeInterval) {
        
        if (success) {
            // 打分过了 给奖励
            
        }
    }];
    
//    [ccs.rate aCheckRate:@"1239842" content:@"asdasd" block:^(BOOL rated) {
//
//
//    }];
    
    [ccs.rate checkRate:@"32234324" ratedOnce:NO rateProb:100 inAppRateProb:0 title:@"1323" content:@"123" btnTitles:@[@"取消",@"确定",] block:^(BOOL rated) {
        
    }];
}

@end
