//
//  PBIndicatorView.m
//  PhotoBrowser
//
//  Created by jobs on 15/7/16.
//  Copyright (c) 2015年 jobs. All rights reserved.
//


#import "PBPhotoBrowserConfig.h"
#import "PBIndicatorView.h"

@implementation PBIndicatorView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kIndicatorViewBackgroundColor;
        self.clipsToBounds = YES;
        self.viewMode = PBIndicatorViewModeLoopDiagram;//圆
    }
    return self;
}

-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self setNeedsDisplay];
    if (progress >= 1) {
        [self removeFromSuperview];
    }
}

-(void)setFrame:(CGRect)frame
{
    frame.size.width = 42;
    frame.size.height = 42;
    self.layer.cornerRadius = 21;
    [super setFrame:frame];
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx =UIGraphicsGetCurrentContext();
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    [[UIColor whiteColor] set];
    
    switch (self.viewMode) {
        case PBIndicatorViewModePieDiagram:
        {
            CGFloat radius = MIN(rect.size.width * 0.5, rect.size.height * 0.5) - kIndicatorViewItemMargin;
            
            CGFloat w = radius * 2 + kIndicatorViewItemMargin;
            CGFloat h = w;
            CGFloat x = (rect.size.width - w) * 0.5;
            CGFloat y = (rect.size.height - h) * 0.5;
            CGContextAddEllipseInRect(ctx, CGRectMake(x, y, w, h));
            
            [kIndicatorViewBackgroundColor set];
            CGContextAddLineToPoint(ctx, xCenter, 0);
            CGFloat to = -M_PI * 0.5 + self.progress * M_PI * 2 + 0.001; //初始值
            CGContextAddArcToPoint(ctx, xCenter, yCenter, - M_PI *0.5 , to, 0);
            CGContextStrokePath(ctx);
        }
            break;
            
        default:
        {
            CGContextSetLineWidth(ctx, 4);
            CGContextSetLineCap(ctx, kCGLineCapRound);
            CGFloat to = -M_PI * 0.5 + self.progress * M_PI * 2 +0.05;
            CGFloat radius = MIN(rect.size.width, rect.size.height) * 0.5 -kIndicatorViewItemMargin;
            CGContextAddArc(ctx, xCenter, yCenter, radius, -M_PI * 0.5, to, 0);
            CGContextStrokePath(ctx);
        }
            break;
    }
}
@end
