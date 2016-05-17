//
//  FRFoundingViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/13.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRFoundingViewController.h"
#import "FRmessageViewController.h"
#import "CircleScrollView.h"
#import <UIImageView+WebCache.h>

@interface FRFoundingViewController ()<UISearchBarDelegate,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,CircleScrollDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UISearchBar * searchBar;
@property (nonatomic, strong)UITextField * textField;

@property (nonatomic, strong)UITableView *searchTagTableView;

@property (nonatomic, strong)UIButton * imgSortButton;

@property (nonatomic, strong)UICollectionView * collectionView;
@property (nonatomic, strong)UICollectionViewFlowLayout * firstLayout;
@property (nonatomic, strong)UICollectionViewFlowLayout * secondLayout;
@property (nonatomic, strong)NSMutableArray * collectionDataSource;
@end

@implementation FRFoundingViewController
{
    NSArray * arr;
}
-(NSMutableArray *)collectionDataSource
{
    if (!_collectionDataSource) {
        _collectionDataSource = [NSMutableArray array];
    }
    return _collectionDataSource;
}
-(UICollectionViewFlowLayout *)firstLayout
{
    if (!_firstLayout) {
        _firstLayout = [[UICollectionViewFlowLayout alloc]init];
        _firstLayout.itemSize = CGSizeMake(SCREEN_WIDTH - 2, SCREEN_WIDTH * 0.2);
    }
    return _firstLayout;
}
-(UICollectionViewFlowLayout *)secondLayout
{
    if (!_secondLayout) {
        _secondLayout = [[UICollectionViewFlowLayout alloc]init];
        _secondLayout.itemSize = CGSizeMake(SCREEN_WIDTH * 0.3 - 4, SCREEN_WIDTH * 0.6);
    }
    return _secondLayout;
}
-(UITableView *)searchTagTableView
{
    if (!_searchTagTableView) {
        _searchTagTableView = [[UITableView alloc]initWithFrame:CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
    }
    return _searchTagTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreateSubViews];
    
    arr =@[@[@"紫砂",@"跑步",@"香格里拉",@"今年流行款"],@[@"旅行",@"健身",@"艺术",@"摄影",@"电影",@"美食",@"成长",@"设计",@"时尚",@"魔兽",@"行为艺术",@"春天"]];
    
    
}
-(void)CreateSubViews
{
    UIBarButtonItem * rightButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"messageBtnIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(messageBtnHandler:)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    
    //**用UITextField来代替*/
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 0.8, 34)];
    _textField.backgroundColor = [UIColor grayColor];
    
    UIImageView *  searchView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search"]];
    _textField.leftView = searchView;
    [_textField setLeftViewMode:UITextFieldViewModeAlways];
    _textField.placeholder = @"搜索";
    _textField.delegate = self;
    _textField.layer.cornerRadius = 8.0f;
    self.navigationItem.titleView = _textField;
    
    self.searchTagTableView.delegate = self;
    self.searchTagTableView.dataSource = self;
    //**这里暂时用本地图片*/
    CircleScrollView * scr = [[CircleScrollView alloc]initWithImgs:@[@"ad_1.jpg",@"ad_2.jpg",@"ad_3.jpg",@"ad_4.jpg",@"ad_5.jpg"] fram:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    //网络异步加载
    //CircleScrollView *scr1 = [[CircleScrollView alloc]initWithImgUrls:@[@"http://hiphotos.baidu.com/praisejesus/pic/item/e8df7df89fac869eb68f316d.jpg",@"http://pic15.nipic.com/20110731/8022110_162804602317_2.jpg",@"http://pic10.nipic.com/20101103/5063545_000227976000_2.jpg"] fram:CGRectMake(0,420, self.view.frame.size.width, 300)];

    scr.circleScrollType = CircleScrollTypePageControlAndTimer;
    scr.circleScrollStyle = CircleScrollStyleSkewing;
    scr.circleDelegate = self;
    [self.view addSubview:scr];

    //**热门图册labelo及按钮*/
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, scr.frame.size.height, SCREEN_WIDTH, 50)];
    label.text = @"  热门图册";
    label.textAlignment = NSTextAlignmentLeft;
    //label.backgroundColor = [UIColor purpleColor];
    
    self.imgSortButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.imgSortButton setImage:[UIImage imageNamed:@"changeToCollect_icon_yellow"] forState:UIControlStateNormal];
    [self.imgSortButton addTarget:self action:@selector(changeCollectionTap:) forControlEvents:UIControlEventTouchUpInside];
    [label addSubview:self.imgSortButton];
    [self.imgSortButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.top).offset(10);
        make.bottom.equalTo(label.bottom).offset(-10);
        make.right.equalTo(label.right).offset(-10);
        make.width.equalTo(30);
    }];
    
    [self.view addSubview:label];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(2, 2, 2, 2);
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
}
#pragma mark - action
-(void)changeCollectionTap:(UIButton *)_b
{
    NSLog(@"changeCollection");
}
#pragma mark - CircleScrollDelegate
//**轮播图点击事件*/
-(void)circleScroll:(CircleScrollView *)scrollView selectIndex:(NSInteger)index
{
    //NSLog(@"%ld",index);
}
#pragma mark - UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //NSLog(@"start editing");
    if (_searchTagTableView.frame.origin.x == 0) {
        return;
    }
    
    [self.view addSubview:self.searchTagTableView];
    
    [UIView animateWithDuration:0.2 animations:^{
        _searchTagTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
    }];
    self.navigationItem.rightBarButtonItem.image = nil;
    self.navigationItem.rightBarButtonItem.title =@"取消";

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)messageBtnHandler:(UIBarButtonItem *)item
{
    if (self.navigationItem.rightBarButtonItem.image) {
        [self.navigationController pushViewController:[FRmessageViewController new] animated:YES];
        return;
    } else if (self.navigationItem.rightBarButtonItem.title) {
        [UIView animateWithDuration:0.2 animations:^{
            _searchTagTableView.frame = CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
            
            [_textField resignFirstResponder];
            _textField.text = nil;
            [self.view endEditing:YES];
            
        }];
    }

}
#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 4 : 12;
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
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return section == 0 ? @"最近搜索" : @"热门标签";
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
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
