//
//  FRAdressListViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/13.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRAdressListViewController.h"
#import "HJCornerRadius.h"
@interface FRAdressListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *friendButton;
@property (weak, nonatomic) IBOutlet UIButton *miaorenButtonHandler;
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *purpleView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation FRAdressListViewController
{
    NSArray * NameArr;
    NSArray * ImgArr;
    NSArray * showArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource  = self;

    self.navigationItem.title = @"通讯录";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.purpleView.hidden = YES;
    self.redView.hidden = NO;
    
    
    
    NameArr = @[@"艾莲",@"博予妈妈",@"陈犀利",@"卢天天SAMA",@"50Cent",@"中恒",@"swift_icon",@"sweety-hon"];
    ImgArr = @[@"user_1.jpg",
    @"user_2.jpg",
    @"user_3.jpg",
    @"user_4.jpg",
    @"user_5.jpg",
    @"user_6.jpg",
    @"user_7.jpg",
    @"user_8.jpg",];
    showArr = @[@"这个人很懒，没有留下签名",@"同上",@"同上",@"+1",@"+2",@"+3",@"+4",@"+7"];
}
- (IBAction)friendButtonHandler:(UIButton *)sender {
    if (self.redView.hidden == YES) {
        self.redView.hidden = NO;
        self.purpleView.hidden = YES;
        
    }
}
- (IBAction)miaorenButtonHandler:(UIButton *)sender {
    if (self.purpleView.hidden == YES) {
        self.purpleView.hidden = NO;
        self.redView.hidden = YES;
        
        
        [self.tableView reloadData];
    }
}
#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //**                */
    
    return NameArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString * cellID = @"friendcell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        }
        cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
        cell.imageView.aliCornerRadius = 25.0f;
        cell.imageView.image = [UIImage imageNamed:ImgArr[indexPath.row]];
        cell.textLabel.text = NameArr[indexPath.row];
        cell.detailTextLabel.text = showArr[indexPath.row];
        
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
