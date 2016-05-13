//
//  FRmessageViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/13.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRmessageViewController.h"

@interface FRmessageViewController ()

@end

@implementation FRmessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"消息";
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithTitle:@"清空" style:UIBarButtonItemStylePlain target:self action:@selector(allDelete:)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
-(void)allDelete:(UIBarButtonItem *)item
{
    NSLog(@"allDelete");
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
