//
//  FRSortordViewController.h
//  picturer
//
//  Created by BaiLinfeng on 16/5/12.
//  Copyright © 2016年 FR. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReturnSortordTextBlock)(NSString *showText);

@interface FRSortordViewController : UIViewController
@property (nonatomic, copy) ReturnSortordTextBlock returnTextBlock;
-(void)returnSortordText:(ReturnSortordTextBlock)block;
@end
