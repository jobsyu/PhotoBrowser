//
//  PBNavigationController.m
//  PhotoBrowser
//
//  Created by jobs on 15/7/16.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import "PBNavigationController.h"

@interface PBNavigationController ()

@end

@implementation PBNavigationController

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return [self.topViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

-(BOOL)shouldAutorotate
{
    return self.topViewController.shouldAutorotate;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return self.topViewController.supportedInterfaceOrientations;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return self.topViewController.preferredStatusBarStyle;
}
@end
