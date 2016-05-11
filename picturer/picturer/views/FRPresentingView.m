//
//  FRPresentingView.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/10.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRPresentingView.h"
#import "FRCreateAlbumViewController.h"
#import "FRAddImgViewController.h"
@implementation FRPresentingView

-(void)layoutSubviews
{
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 0, SCREEN_WIDTH, 30);
    [button1 setTitle:@"创建相册" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(createAlbumTap:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button1];
    
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, 1)];
    view1.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:view1];
    
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(0, 30, SCREEN_WIDTH, 30);
    [button2 setTitle:@"添加图片" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(addPicturesTap:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button2];
    
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 60, SCREEN_WIDTH, 1)];
    view2.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:view2];
    
    
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(0, 60, SCREEN_WIDTH, 30);
    [button3 setTitle:@"抓取网页" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(catchWebImgTap:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button3];
}

-(void)createAlbumTap:(UIButton *)_b
{
    //NSLog(@"button被点击了");
    [(UINavigationController *)[self getCurrentVC] pushViewController:[FRCreateAlbumViewController new] animated:YES];
    //NSLog(@"%@",[self getCurrentVC]);
}
-(void)addPicturesTap:(UIButton *)_b
{
    [(UINavigationController *)[self getCurrentVC] pushViewController:[FRAddImgViewController new] animated:NO];

}
-(void)catchWebImgTap:(UIButton *)_b
{
    //NSLog(@"button1");
}
//**获取当前显示的Vc*/
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
