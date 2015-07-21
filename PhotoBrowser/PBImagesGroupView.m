//
//  PBImagesGroupView.m
//  PhotoBrowser
//
//  Created by jobs on 15/7/16.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import "PBImagesGroupView.h"
#import "UIButton+WebCache.h"
#import "PBPhotoItemModel.h"

#define kImagesMargin 15
@interface PBImagesGroupView()

@end

@implementation PBImagesGroupView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //清除图片缓存，便于测试
        [[SDWebImageManager sharedManager].imageCache clearDisk];
    }
    return self;
}

-(void)setPhotoItemArray:(NSArray *)photoItemArray
{
    _photoItemArray = photoItemArray;
    [photoItemArray enumerateObjectsUsingBlock:^(PBPhotoItemModel *obj, NSUInteger idx, BOOL *stop) {
        UIButton *btn =[[UIButton alloc] init];
        
        //让图形不变形，以适应按钮宽高，按钮中图片部分内容可能看不到
        btn.imageView.contentMode = UIViewContentModeScaleToFill;
        btn.clipsToBounds = YES;
        
        [btn sd_setImageWithURL:[NSURL URLWithString:obj.thumbnail_pic] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"whiteplaceholder"]];
        btn.tag = idx;
        
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    long imageCount = self.photoItemArray.count;
    int perRowImageCount = ((imageCount == 4) ? 2 : 3);
    CGFloat perRowImageCountF = (CGFloat)perRowImageCount;
    int totalRowCount = ceil(imageCount / perRowImageCountF);
    CGFloat w = 80;
    CGFloat h = 80;
    
    [self.subviews enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL *stop) {
        
        long rowIndex = idx / perRowImageCount;
        int columnIndex = idx % perRowImageCount;
        CGFloat x = columnIndex * (w + kImagesMargin);
        CGFloat y = rowIndex * (h + kImagesMargin);
        btn.frame = CGRectMake(x, y, w, h);
    }];
    
    self.frame = CGRectMake(10, 10, 280, totalRowCount * (h + kImagesMargin));
}

-(void)buttonClick:(UIButton *)button
{
    
}


@end
