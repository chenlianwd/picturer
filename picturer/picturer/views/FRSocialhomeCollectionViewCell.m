//
//  FRSocialhomeCollectionViewCell.m
//  picturer
//
//  Created by 陈亮 on 16/5/12.
//  Copyright © 2016年 FR. All rights reserved.
//

#import "FRSocialhomeCollectionViewCell.h"

@implementation FRSocialhomeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor purpleColor];
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, CGRectGetWidth(self.frame) - 20, CGRectGetWidth(self.frame) - 20)];
        [self addSubview:self.imgView];
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.imgView.frame)+10, CGRectGetWidth(self.frame) -10 , 20)];
        self.label.textAlignment = NSTextAlignmentCenter;
        //self.label.backgroundColor = [UIColor brownColor];
        self.label.textColor = [UIColor whiteColor];
        [self addSubview:self.label];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
