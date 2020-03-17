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
    
//    [ccs.rate aCheckRate:@"1239842" content:@"asdasd" block:^(BOOL rated) {
//
//
//    }];
    
    
    // 自定义概率弹出打分弹窗
    [ccs.rate checkRate:@"appId" ratedOnce:NO rateProb:100 inAppRateProb:0 title:@"标题" content:@"内容" btnTitles:@[@"取消",@"确定",] block:^(BOOL rated) {
        
    }];

    // 添加从AppStore打分回来的回调
    [ccs.rate addBackFromAppStoreBlock:^(BOOL success, NSTimeInterval timeInterval) {
        
        if (success) {
            // 打分过了 给奖励
            
        }
    }];
}

@end
