//
//  FRMyhomeViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/13.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRMyhomeViewController.h"
#import "FRmessageViewController.h"
@interface FRMyhomeViewController ()

@end

@implementation FRMyhomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem * rightButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"messageBtnIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(messageBtnHandler:)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}
-(void)messageBtnHandler:(UIBarButtonItem *)_item
{
    //NSLog(@"moremoremore");
    [self.navigationController pushViewController:[FRmessageViewController new] animated:YES];
    
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
