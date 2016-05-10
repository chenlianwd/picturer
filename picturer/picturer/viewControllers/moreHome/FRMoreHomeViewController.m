//
//  FRMoreHomeViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/10.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRMoreHomeViewController.h"

@interface FRMoreHomeViewController ()

@end

@implementation FRMoreHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor blackColor];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIView animateWithDuration:0.4 animations:^{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
        self.navigationItem.title = @"picturer";
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];
    }];
    
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
