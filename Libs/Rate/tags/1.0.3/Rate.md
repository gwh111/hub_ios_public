#import "ccs+Rate.h"

// 自定义概率弹出打分弹窗
[ccs.rate checkRate:@"appId" ratedOnce:NO rateProb:100 inAppRateProb:0 title:@"标题" content:@"内容" btnTitles:@[@"取消",@"确定",] block:^(BOOL rated) {
    
}];

// 添加从AppStore打分回来的回调
[ccs.rate addBackFromAppStoreBlock:^(BOOL success, NSTimeInterval timeInterval) {
    
    if (success) {
        // 打分过了 给奖励
        
    }
}];