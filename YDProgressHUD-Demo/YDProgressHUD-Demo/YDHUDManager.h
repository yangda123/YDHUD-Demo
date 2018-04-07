//
//  YDHUDManager.h
//  YDProgressHUD-Demo
//
//  Created by 杨达 on 2018/4/7.
//  Copyright © 2018年 YDIOS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <YDMessageHUD.h>
#import <YDProgressHUD.h>

@interface YDHUDManager : NSObject

#pragma mark - YDProgressHUD 使用
+ (YDProgressHUD *)startNetLoaging:(UIView *)supView;


+ (void)startCustom:(UIView *)supView;
+ (void)startImages:(UIView *)supView;
+ (void)startImagesWithNoMessage:(UIView *)supView;


#pragma mark - YDMessageHUD 使用
// 顶部显示 -- 在主窗口上
+ (void)messageTop:(NSString *)message;
// 中间显示
+ (void)messageCenter:(NSString *)message;
// 底部显示
+ (void)messageBottom:(NSString *)message;

@end








