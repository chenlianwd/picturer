//
//  FRSearchViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/10.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRSearchViewController.h"

@interface FRSearchViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *searchResultTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation FRSearchViewController

+(instancetype)sharedInstance
{
    static FRSearchViewController  * singleton = nil;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        singleton = [[self alloc]init];
    });
    return singleton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchResultTableView.delegate = self;
    self.searchResultTableView.dataSource = self;
    self.searchBar.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -UITableViewDelegate,UITableViewDataSource
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"相册";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    // 定义唯一标识
    static NSString *CellIdentifier = @"Cell";
    // 通过唯一标识创建cell实例
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    // 对cell 进行简单地数据配置
    cell.textLabel.text = @"text";
    cell.detailTextLabel.text = @"text";
    cell.imageView.image = [UIImage imageNamed:@"icon_3"];
    
    return cell;
}
#pragma mark -UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;
{
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
{
    
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
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
