//
//  FRAddImgViewController.m
//  picturer
//
//  Created by BaiLinfeng on 16/5/11.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRAddImgViewController.h"
#import "TZImagePickerController.h"
@interface FRAddImgViewController ()<TZImagePickerControllerDelegate>

@end

@implementation FRAddImgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosWithInfosHandle:^(NSArray<UIImage *> *image, NSArray *array, BOOL ok, NSArray<NSDictionary *> *infoDict) {
        //处理照片信息
        
        
        [self.navigationController popViewControllerAnimated:NO];
    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}
#pragma mark - Delegate Method
-(void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto
{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos
{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)imagePickerControllerDidCancel:(TZImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:NO];
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
