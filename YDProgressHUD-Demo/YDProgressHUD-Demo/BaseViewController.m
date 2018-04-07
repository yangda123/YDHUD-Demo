//
//  BaseViewController.m
//  YDProgressHUD-Demo
//
//  Created by 杨达 on 2018/4/7.
//  Copyright © 2018年 YDIOS. All rights reserved.
//

#import "BaseViewController.h"
#import "YDHUDManager.h"

#import "NetViewController.h"
#import "BezelViewController.h"

@interface BaseViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *titleArr;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"加载框的使用";
    
    self.titleArr = @[@[@"YDShowModeBackBezel", @"YDShowModeNetwork"],
                      @[@"YDMessagePositionTop", @"YDMessagePositionCenter", @"YDMessagePositionBottom"]];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.rowHeight = 50;
    tableView.tableFooterView = [UIView new];
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = self.titleArr[section];
    
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.textLabel.font = [UIFont systemFontOfSize:15.0];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = self.titleArr[indexPath.section][indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 36)];
    label.font = [UIFont boldSystemFontOfSize:16.0];
    label.textColor = [UIColor colorWithWhite:0.3 alpha:1.0];
    label.text = section ? @"   YDMessageHUD 使用" : @"   YDProgressHUD 使用";
    return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 36;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section) {
        
        if (indexPath.row == 0) {
            [YDHUDManager messageTop:@"我显示在顶部..."];
        }else if (indexPath.row == 1) {
            [YDHUDManager messageCenter:@"我显示在中间..."];
        }else {
            [YDHUDManager messageBottom:@"我显示在底部..."];
        }
        
    }else {
        if (indexPath.row) {
            [self.navigationController pushViewController:[NetViewController new] animated:YES];
        }else {
            [self.navigationController pushViewController:[BezelViewController new] animated:YES];
        }
    }
}

@end









































