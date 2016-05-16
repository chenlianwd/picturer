//
//  FRFoundingViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/13.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRFoundingViewController.h"
#import "FRmessageViewController.h"

@interface FRFoundingViewController ()<UISearchBarDelegate,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UISearchBar * searchBar;
@property (nonatomic, strong)UITextField * textField;

@property (nonatomic, strong)UITableView *searchTagTableView;
@end

@implementation FRFoundingViewController
{
    NSArray * arr;
}
-(UITableView *)searchTagTableView
{
    if (!_searchTagTableView) {
        _searchTagTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    }
    return _searchTagTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.navigationItem.title = @"发现";
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIBarButtonItem * rightButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"messageBtnIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(messageBtnHandler:)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
// mark - 这个searchBar内部的颜色怎么改。
    //导航条的搜索条
//    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0,0,150,44)];
//    _searchBar.delegate = self;
//    _searchBar.barTintColor = [UIColor clearColor];
//    self.navigationItem.titleView = _searchBar;
    
    
    //**用UITextField来代替*/
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 0.8, 34)];
    _textField.backgroundColor = [UIColor grayColor];
    
    UIImageView *  searchView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search"]];
    _textField.leftView = searchView;
    [_textField setLeftViewMode:UITextFieldViewModeAlways];
    _textField.placeholder = @"搜索";
    _textField.delegate = self;
    self.navigationItem.titleView = _textField;
    
    
    
    self.searchTagTableView.delegate = self;
    self.searchTagTableView.dataSource = self;
    
    
    arr =@[ @[@"紫砂",@"跑步",@"香格里拉",@"今年流行款"],@"旅行",@"健身",@"艺术",@"摄影",@"电影",@"美食",@"成长",@"设计",@"时尚",@"魔兽",@"行为艺术",@"春天"];
    
}
#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"start editing");
}


-(void)messageBtnHandler:(UIBarButtonItem *)item
{
    [self.navigationController pushViewController:[FRmessageViewController new] animated:YES];

}
#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = arr[indexPath.section][indexPath.row];
    
    return cell;
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
