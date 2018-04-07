//
//  YDHUDManager.m
//  YDProgressHUD-Demo
//
//  Created by 杨达 on 2018/4/7.
//  Copyright © 2018年 YDIOS. All rights reserved.
//

#import "YDHUDManager.h"

@implementation YDHUDManager

#pragma mark - YDProgressHUD 使用
// 网络加载数据 YDShowModeBackBezel
+ (void)startCustom:(UIView *)supView
{
    [YDProgressHUD startLoadingBlock:^(YDProgressHUD *loadView) {
        
        if (supView) {
            loadView.supView = supView;
        }
        
        loadView.loadMode = YDProgressModeCustom;
        
        UIImage *image = [[UIImage imageNamed:@"loading1"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
        CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        anima.toValue = @(M_PI*2);
        anima.duration = 1.0f;
        anima.repeatCount = MAXFLOAT;
        [imgView.layer addAnimation:anima forKey:nil];
        loadView.customView = imgView;
    }];
}

+ (void)startImages:(UIView *)supView
{
    [YDProgressHUD startLoadingBlock:^(YDProgressHUD *loadView) {
    
        loadView.loadMode = YDProgressModeImages;
        
        if (supView) {
            loadView.supView = supView;
        }
        
        loadView.indicatorWH = 35;
        loadView.warnningTitle = @"...加载中...";
        loadView.isAnimation = NO;
        loadView.labelSpace = 20;
        loadView.duration = 0.7;
        loadView.loadMode = YDProgressModeImages;
        loadView.imgArray = @[@"loading1", @"loading2",
                              @"loading3", @"loading4",
                              @"loading5", @"loading6",
                              @"loading7", @"loading8"];
    }];
}

+ (void)startImagesWithNoMessage:(UIView *)supView
{
    [YDProgressHUD startLoadingBlock:^(YDProgressHUD *loadView) {
        
        loadView.loadMode = YDProgressModeImages;
        loadView.msgMode = YDMessageModeHidden;
        
        loadView.backBezelView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.8];
        
        if (supView) {
            loadView.supView = supView;
        }
        
        loadView.labelSpace = 20;
        loadView.duration = 0.7;
        loadView.loadMode = YDProgressModeImages;
        loadView.imgArray = @[@"loading1", @"loading2",
                              @"loading3", @"loading4",
                              @"loading5", @"loading6",
                              @"loading7", @"loading8"];
    }];
}

// 网络加载数据 YDShowModeNetwork
+ (YDProgressHUD *)startNetLoaging:(UIView *)supView
{
    return [YDProgressHUD startLoadingBlock:^(YDProgressHUD *loadView) {
        
        loadView.msgMode = YDMessageModeShowWhenStop;
        loadView.showMode = YDShowModeNetwork;
    
        if (supView) {
            loadView.supView = supView;
        }
        
        loadView.labelSpace = 20;
        loadView.duration = 0.7;
        loadView.loadMode = YDProgressModeImages;
        loadView.imgArray = @[@"loading1", @"loading2",
                              @"loading3", @"loading4",
                              @"loading5", @"loading6",
                              @"loading7", @"loading8"];
    }];
}



#pragma mark - YDMessageHUD 使用
// 顶部显示 -- 在主窗口上
+ (void)messageTop:(NSString *)message
{
    [YDMessageHUD showMessage:message block:^(YDMessageHUD *msgHUD) {
        msgHUD.msgPosition = YDMessagePositionTop;
        msgHUD.backColor = [UIColor purpleColor];
        msgHUD.textColor = [UIColor whiteColor];
        msgHUD.textFont = [UIFont systemFontOfSize:17.0];
        msgHUD.showDelay = 3.0;
    }];
}
// 中间显示
+ (void)messageCenter:(NSString *)message
{
    [YDMessageHUD showMessage:message block:^(YDMessageHUD *msgHUD) {
        msgHUD.msgPosition = YDMessagePositionCenter;
        msgHUD.backColor = [[UIColor orangeColor] colorWithAlphaComponent:0.7];
        msgHUD.textColor = [UIColor whiteColor];
        msgHUD.textFont = [UIFont systemFontOfSize:17.0];
        msgHUD.showDelay = 3.0;
    }];
}
// 底部显示
+ (void)messageBottom:(NSString *)message
{
    [YDMessageHUD showMessage:message block:^(YDMessageHUD *msgHUD) {
        msgHUD.msgPosition = YDMessagePositionBottom;
        msgHUD.backColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
        msgHUD.textColor = [UIColor whiteColor];
        msgHUD.textFont = [UIFont systemFontOfSize:17.0];
        msgHUD.showDelay = 3.0;
        
        msgHUD.bottomSpace = 30.0;
    }];
}

@end


















