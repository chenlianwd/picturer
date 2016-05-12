//
//  FRAlbumModel.h
//  picturer
//
//  Created by BaiLinfeng on 16/5/12.
//  Copyright © 2016年 FR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRAlbumModel : NSObject
@property (nonatomic, copy) NSString * Id;
@property (nonatomic, copy) NSString * localId;
@property (nonatomic, copy) NSString * tags;
@property (nonatomic, strong) NSNumber * likeNum;
@property (nonatomic, strong) NSNumber * commentNum;
@property (nonatomic, strong) NSNumber * imagesNum;
@property (nonatomic, strong) NSNumber * permissionType;
@property (nonatomic, copy) NSString * permissionPeople;
@property (nonatomic, copy) NSString * other;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * des;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, strong) NSDate * createTime;
@property (nonatomic, strong) NSDate * updateTime;
@property (nonatomic, copy) NSString * author;

@end
