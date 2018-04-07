//
//  BezelViewController.m
//  YDProgressHUD-Demo
//
//  Created by 杨达 on 2018/4/7.
//  Copyright © 2018年 YDIOS. All rights reserved.
//

#import "BezelViewController.h"
#import "YDHUDManager.h"

@interface BezelViewController ()

@end

@implementation BezelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"加载弹框";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createBtn:@"YDProgressModeDefault" index:0];
    [self createBtn:@"YDProgressModeImages"  index:1];
    [self createBtn:@"YDProgressModeCustom"  index:2];
    [self createBtn:@"YDMessageModeHidden"   index:3];
}

- (void)createBtn:(NSString *)title index:(NSInteger)index
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 90 + [UIApplication sharedApplication].statusBarFrame.size.height + index * 90, self.view.bounds.size.width - 60, 50)];
    btn.tag = index;
    btn.layer.cornerRadius = 6;
    btn.layer.masksToBounds = YES;
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickStart:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)clickStart:(UIButton *)btn
{
    self.view.userInteractionEnabled = NO;
    
    switch (btn.tag) {
        case 0: {
            [YDProgressHUD startLoadingBlock:nil];
            [self stopInView:nil];
        }
            break;
        case 1: {
            [YDHUDManager startImages:self.view];
            [self stopInView:self.view];
        }
            break;
        case 2: {
            [YDHUDManager startCustom:self.view];
            [self stopInView:self.view];
        }
            break;
        case 3: {
            [YDHUDManager startImagesWithNoMessage:nil];
            [self stopInView:nil];
        }
            break;
    }
}

- (void)stopInView:(UIView *)supView
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        if (supView) {
            [YDProgressHUD stopLoading:supView];
        }else {
            [YDProgressHUD stopLoadingKeyWindow];
        }
        
        self.view.userInteractionEnabled = YES;
    });
}

@end






























