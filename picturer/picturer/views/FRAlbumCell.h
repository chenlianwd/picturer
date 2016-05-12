//
//  FRAlbumCell.h
//  picturer
//
//  Created by BaiLinfeng on 16/5/9.
//  Copyright © 2016年 FR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRAlbumCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *albumName;
@property (weak, nonatomic) IBOutlet UILabel *picsNum;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
