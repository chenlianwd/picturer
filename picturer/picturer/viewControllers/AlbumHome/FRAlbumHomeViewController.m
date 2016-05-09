//
//  FRAlbumHomeViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/9.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRAlbumHomeViewController.h"

@interface FRAlbumHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * albumTableView;

@end

@implementation FRAlbumHomeViewController
-(UITableView *)albumTableView
{
    if (!_albumTableView) {
        _albumTableView = [[UITableView alloc]init];
        [self.view addSubview:_albumTableView];
    }
    return _albumTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.albumTableView.delegate = self;
    self.albumTableView.dataSource = self;
    [self.albumTableView registerNib:[UINib nibWithNibName:@"FRAlbumCell" bundle:nil] forCellReuseIdentifier:@"AlbumCell"];
    [self createSubview];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //**设置nav*/
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"picturer";

    
    
}
#pragma mark - setup UI
-(void)createSubview
{
    
    UIImageView * searchView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    searchView.image = [UIImage imageNamed:@"search"];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchButtonClick:)];
    leftItem.customView = searchView;
    
    UIImageView * cameraView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    cameraView.image = [UIImage imageNamed:@"camera"];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(cameraButtonClick:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.albumTableView.frame = self.view.frame;
    //self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.albumTableView];
    
    UIButton * bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    bottomButton.frame = CGRectMake(0, SCREEN_HEIGHT - ADD_ALBUM_H - ADD_ALBUM_H, SCREEN_WIDTH, ADD_ALBUM_H);
    bottomButton.backgroundColor = COLOR_YELLOW;
    
    UIImageView * addImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"add01"]];
    addImageView.frame = CGRectMake(SCREEN_WIDTH / 2 - 20, 10, 40, 40);
    
    [bottomButton addSubview:addImageView];
    [bottomButton addTarget:self action:@selector(pullCreateAlbumTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:bottomButton];
    
}
#pragma mark - action
-(void)searchButtonClick:(UIBarButtonItem *)_b
{
    
}
-(void)cameraButtonClick:(UIBarButtonItem *)_b
{
    
}
-(void)pullCreateAlbumTap:(UIButton *)button
{
    
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 100;
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString * cellID = @"AlbumCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
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
