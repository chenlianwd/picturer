//
//  FRFirstViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/9.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRFirstViewController.h"
#import "FRRegisterViewController.h"
#import "FRLoginViewController.h"

#import "FRAlbumHomeViewController.h"
@interface FRFirstViewController ()

@end

@implementation FRFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [UIApplication sharedApplication].statusBarHidden = YES;
}
- (IBAction)registerTap:(UIButton *)sender {
    [self.navigationController pushViewController:[FRRegisterViewController new] animated:YES];
}
- (IBAction)loginTap:(UIButton *)sender {
    //[self.navigationController pushViewController:[FRLoginViewController new] animated:YES];
    //**这里方便测试暂时跳过登陆界面直接进入*/
    [self.navigationController popViewControllerAnimated:YES];
    NSMutableArray *controllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    controllers[0] = [[FRAlbumHomeViewController alloc] init];
    [self.navigationController setViewControllers:controllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
