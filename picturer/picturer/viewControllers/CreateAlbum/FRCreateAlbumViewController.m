//
//  FRCreateAlbumViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/11.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRCreateAlbumViewController.h"
#import "TZImagePickerController.h"
#import "FRTagViewController.h"
#import "FRSortordViewController.h"
#import "FRPrivateViewController.h"
@interface FRCreateAlbumViewController ()<TZImagePickerControllerDelegate,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *chooseImgBtn;
@property (weak, nonatomic) IBOutlet UITextField *albumTitle;
@property (weak, nonatomic) IBOutlet UITextView *albumDescribe;
@property (weak, nonatomic) IBOutlet UILabel *wordNumLabel;
@property (weak, nonatomic) IBOutlet UIButton *tagBtn;
@property (weak, nonatomic) IBOutlet UILabel *sortordLabel;
@property (weak, nonatomic) IBOutlet UILabel *privateLable;
@property (weak, nonatomic) IBOutlet UILabel *commentPowerLabel;
@property (weak, nonatomic) IBOutlet UILabel *Describeplaceholder;

@end

@implementation FRCreateAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubviews];
    // Do any additional setup after loading the view from its nib.
    
    self.albumDescribe.backgroundColor = [UIColor clearColor];
    self.Describeplaceholder.backgroundColor = [UIColor clearColor];
    self.albumDescribe.delegate = self;
    
    
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
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosWithInfosHandle:^(NSArray<UIImage *> *image, NSArray *array, BOOL ok, NSArray<NSDictionary *> *infoDict) {
        //处理照片信息
        
        
         [self.navigationController popToViewController:self animated:YES];
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}
- (IBAction)tagChooseHandler:(UIButton *)sender {
    
    [self.navigationController pushViewController:[FRTagViewController new] animated:YES];
}
- (IBAction)imgChooseHandler:(UIButton *)sender {
    FRSortordViewController * SortVc = [FRSortordViewController new];
        __weak typeof(self)weakSelf = self;
    
    [SortVc returnSortordText:^(NSString *showText) {
        
        weakSelf.sortordLabel.text = showText;
    }];
    [self.navigationController pushViewController:SortVc animated:YES];

}
- (IBAction)privateChooseHandler:(UIButton *)sender {
    [self.navigationController pushViewController:[FRPrivateViewController new] animated:YES];
}
- (IBAction)commentPowerHandler:(UIButton *)sender {
}
#pragma mark - Delegate Method
-(void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto
{
    [self.navigationController popToViewController:self animated:YES];
}
-(void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos
{
    [self.navigationController popToViewController:self animated:YES];;
}
-(void)imagePickerControllerDidCancel:(TZImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:NO completion:nil];
    
    
    [self.navigationController popToViewController:self animated:YES];
    
}
#pragma mark -textView delegate
//隐藏placeholder
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (![text isEqualToString:@""])
        
    {
        _Describeplaceholder.hidden = YES;
    }
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1)
        
    {
        _Describeplaceholder.hidden = NO;
    }
    
    return YES;
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
