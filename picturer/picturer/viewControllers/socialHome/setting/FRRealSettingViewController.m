//
//  FRRealSettingViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/16.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRRealSettingViewController.h"
//**真setting*/
@interface FRRealSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation FRRealSettingViewController
{
    NSArray * arr;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"设置";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    [self.tableView setSeparatorColor:[UIColor grayColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    self.navigationItem.title = @"设置";
    arr = @[@"Picturer账号",@"修改密码",@"推送设置",@"更换背景图片",@"关于Picturer",@"清空缓存",@"退出登录"];
    
}
#pragma mark -UITableViewDelegate/UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = arr[indexPath.row];
    if (indexPath.row == 0) {
        UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(cell.contentView.frame.size.width - 150, 5, 200, cell.contentView.frame.size.height - 10)];
        lable.text = @"50 Centttttttttttttttttt";
        lable.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:lable];
        
        
    }else {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            //
            break;
        case 1:
            //修改密码
            
            break;
        case 2:
            //推送设置
            
            break;
        case 3:
            //更换背景图片
            
            break;
        case 4:
            //关于Picture
            
            break;
        case 5:
            //清空缓存
            
            break;
        case 6:
            //退出登录
            //NSLog(@"11");
            
            break;
            
                                         
                                         
    
            
        default:
            break;
    }
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
