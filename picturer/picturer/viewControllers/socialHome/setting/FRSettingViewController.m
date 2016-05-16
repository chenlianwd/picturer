//
//  FRSettingViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/13.
//  Copyright © 2016年 FR. All rights reserved.
//

//**这个不是设置页面，写错。是主页中的编辑个人首页页面*/
#import "FRSettingViewController.h"
#import "FRSettingInfoTableViewCell.h"
@interface FRSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView * tableView;

@end

@implementation FRSettingViewController
{
    NSArray * arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"编辑个人资料";
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FRSettingInfoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
    arr = @[@[@"头像",@"名字",@"签名",@"Picture账号"],@[@"性别",@"生日",@"地区"]];
}
#pragma mark - UITableViewDelegate/UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 4 : 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellID = @"cell";
    FRSettingInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.leftLabel.text = arr[indexPath.section][indexPath.row];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"%ld,%ld",indexPath.section,indexPath.row);
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
