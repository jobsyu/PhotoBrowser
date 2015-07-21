//
//  PBPhotoBrowserView.h
//  PhotoBrowser
//
//  Created by jobs on 15/7/16.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBPhotoBrowserView : UIView
@property (nonatomic,strong) UIScrollView *scrollview;
@property (nonatomic,strong) UIImageView *imageview;
@property (nonatomic,assign) CGFloat progress;
@property (nonatomic,assign) BOOL beginLoadingImage;

//单机回调
@property (nonatomic,strong) void (^singleTapBlock)(UITapGestureRecognizer *recognizer);

-(void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
@end
