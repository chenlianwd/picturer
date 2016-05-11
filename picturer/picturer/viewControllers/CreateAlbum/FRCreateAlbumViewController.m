//
//  FRCreateAlbumViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/11.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRCreateAlbumViewController.h"

@interface FRCreateAlbumViewController ()
@property (weak, nonatomic) IBOutlet UIButton *chooseImgBtn;
@property (weak, nonatomic) IBOutlet UITextField *albumTitle;
@property (weak, nonatomic) IBOutlet UITextView *albumDescribe;
@property (weak, nonatomic) IBOutlet UILabel *wordNumLabel;
@property (weak, nonatomic) IBOutlet UIButton *tagBtn;
@property (weak, nonatomic) IBOutlet UILabel *sortordLabel;
@property (weak, nonatomic) IBOutlet UILabel *privateLable;
@property (weak, nonatomic) IBOutlet UILabel *commentPowerLabel;

@end

@implementation FRCreateAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubviews];
    // Do any additional setup after loading the view from its nib.
   }
-(void)createSubviews
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    [backBtn setTitle:@"取消" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;

    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(0, 0, 44, 44);
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(dosave:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithCustomView:saveBtn];
    self.navigationItem.rightBarButtonItem = saveItem;
}
-(void)doBack:(UIButton *)_b
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)dosave:(UIButton *)_b
{
    NSLog(@"dosave");
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -action
- (IBAction)chooseImgHandler:(UIButton *)sender {
}
- (IBAction)tagChooseHandler:(UIButton *)sender {
}
- (IBAction)imgChooseHandler:(UIButton *)sender {
}
- (IBAction)privateChooseHandler:(UIButton *)sender {
}
- (IBAction)commentPowerHandler:(UIButton *)sender {
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
