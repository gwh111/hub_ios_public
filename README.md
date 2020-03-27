# hub_ios_public

A public 'source' for iOS Pods modular.   

You can use [PodsManager](https://github.com/gwh111/PodsManager) to install all the Pods modular.  

After install the 'source', free to install/uninstall the following pods:  

Input  
Pop a input textView.  
```
Input *c = ccs.input;
[self.view addSubview:c.displayView];
[c addDoneBlock:^(NSString * _Nonnull content) {
    CCLOG(@"%@",content);
}];
```

Language  
Localized with iOS device language.  
```
id la = LANGUAGE(@"标题", @"Title");
```

Rate  
Auto check app's rate.   
```
// 自定义概率弹出打分弹窗
[ccs.rate checkRate:@"appId" ratedOnce:NO rateProb:100 inAppRateProb:0 title:@"标题" content:@"内容" btnTitles:@[@"取消",@"确定",] block:^(BOOL rated) {
    
}];

// 添加从AppStore打分回来的回调
[ccs.rate addBackFromAppStoreBlock:^(BOOL success, NSTimeInterval timeInterval) {
    
    if (success) {
        // 打分过了 给奖励
        
    }
}];
```
