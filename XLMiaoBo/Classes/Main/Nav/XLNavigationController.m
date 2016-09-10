//
//  XLNavigationController.m
//  XLMiaoBo
//
//  Created by XuLi on 16/8/30.
//  Copyright © 2016年 XuLi. All rights reserved.
//

#import "XLNavigationController.h"
#import "XLLoginViewController.h"

@interface XLNavigationController ()

@end

@implementation XLNavigationController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navBar_bg_414x70"] forBarMetrics:UIBarMetricsDefault];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}



- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIButton *btn = [[UIButton alloc] init];
    
    btn.image = @"back_9x16";
    [btn addTarget:self action:@selector(back)];
    
    [btn sizeToFit];

    // 自定义返回按钮
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    if (self.childViewControllers.count) { // 隐藏导航栏
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        
        // 如果自定义返回按钮后, 滑动返回可能失效, 需要添加下面的代码
        __weak typeof(viewController)Weakself = viewController;
        self.interactivePopGestureRecognizer.delegate = (id)Weakself;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    // 判断两种情况: push 和 present
    if ((self.presentedViewController || self.presentingViewController) && self.childViewControllers.count == 1) {
        
               
        if ([self.presentingViewController isKindOfClass:([XLLoginViewController class])]){
        
            [MBProgressHUD showAlertMessage:@"取消授权"];
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }else
        [self popViewControllerAnimated:YES];
}

@end
