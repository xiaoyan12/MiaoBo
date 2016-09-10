//
//  XLThirdLoginView.m
//  XLMiaoBo
//
//  Created by XuLi on 16/8/30.
//  Copyright © 2016年 XuLi. All rights reserved.
//

#import "XLThirdLoginView.h"

@implementation XLThirdLoginView

- (instancetype)init
{
    if (self = [super init]){
    
        [self setupBasic];
    }
    
    return self;
}

- (void)setupBasic
{
    [self createBtnWithImage:@"wbLoginicon_60x60" tag:0];
    [self createBtnWithImage:@"qqloginicon_60x60" tag:1];
    [self createBtnWithImage:@"wxloginicon_60x60" tag:2];
}

- (UIButton *)createBtnWithImage:(NSString *)imageName tag:(NSInteger)tag
{
    UIButton *btn = [[UIButton alloc] init];
    
    btn.image = imageName;
    btn.tag = tag;
    
//    自适应大小
    [btn sizeToFit];
    
    [btn addTarget:self action:@selector(btnClick:)];
    
    [self addSubview:btn];
    return btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    
    //按钮核按钮之间的固定间距
    CGFloat Space = 40;
    CGFloat margin =  (self.width - (count + Space) * count) / (count + 1);
    
    for (int i=0; i<count; i++){
        
        UIButton *btn = self.subviews[i];
        
        
        CGFloat x = (btn.width + Space) * i + margin;
        CGFloat y = 0;
        
        btn.frame = CGRectMake(x, y, btn.width, btn.height);
    }
}

- (void)btnClick:(UIButton *)btn
{
    if (self.selectedBlock){
        
        self.selectedBlock(btn.tag);
    }
}
@end
