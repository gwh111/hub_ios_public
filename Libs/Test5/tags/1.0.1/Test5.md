//
//  ViewController.m
//  Test5
//
//  Created by gwh on 2020/4/12.
//  Copyright 2020 gwh. All rights reserved.
//

#import "ViewController.h"
#import "ccs+Test5.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)cc_viewWillLoad {
  
}

- (void)cc_viewDidLoad {
	 // Do any additional setup after loading the view.
    
// v1.0.1
    Test5 *test5 = ccs.test5;
    [test5 test];
    
}

@end
