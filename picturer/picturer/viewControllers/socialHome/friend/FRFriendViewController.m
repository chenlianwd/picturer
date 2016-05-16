//
//  FRFriendViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/13.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRFriendViewController.h"

@interface FRFriendViewController ()
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation FRFriendViewController
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"朋友";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.tableView.frame = self.view.frame;
    [self.view addSubview:self.tableView];
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
