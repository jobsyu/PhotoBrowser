//
//  PBPhotoBrowser.h
//  PhotoBrowser
//
//  Created by jobs on 15/7/16.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PBIndicatorView.h"
@class PBPhotoBrowser;

@protocol PBPhotoBrowserDelegate  <NSObject>

-(UIImage *)photoBrowser:(PBPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index;
-(NSURL *)photoBrowser:(PBPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index;
@end

@interface PBPhotoBrowser : UIViewController

@property (nonatomic,assign) int currentImageIndex;
@property (nonatomic,assign) NSInteger imageCount; //图片总数
@property (nonatomic,weak) UIView *sourceImagesContainerView;

@property (nonatomic,weak) id<PBPhotoBrowserDelegate> delegate;

-(void)show;
@end

