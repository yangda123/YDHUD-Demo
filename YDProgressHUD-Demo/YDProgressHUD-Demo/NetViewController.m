//
//  NetViewController.m
//  YDProgressHUD-Demo
//
//  Created by 杨达 on 2018/4/7.
//  Copyright © 2018年 YDIOS. All rights reserved.
//

#import "NetViewController.h"
#import "YDHUDManager.h"

@interface NetViewController ()

@end

@implementation NetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    self.title = @"网络请求";
   
    // 网络请求之前，开始加载动画
    [[YDHUDManager startNetLoaging:self.view] reloadHUD:^(YDProgressHUD *loadView) {
        
        // 加载失败，点击回掉 重新进行网络请求
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 网络请求结束  -- 网络请求成功,没有数据
            [YDProgressHUD stopNetLoading:self.view status:YDStopLoadEmtyp];
        });
    }];
    
    // 开始网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 网络请求结束  -- 失败的状态
        [YDProgressHUD stopNetLoading:self.view status:YDStopLoadFaiure];
    });
}

@end







