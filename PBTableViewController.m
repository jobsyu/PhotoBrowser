//
//  PBTableViewController.m
//  PhotoBrowser
//
//  Created by jobs on 15/7/16.
//  Copyright (c) 2015年 jobs. All rights reserved.
//

#import "PBTableViewController.h"
#import "PBImagesGroupView.h"
#import "PBPhotoItemModel.h"

@interface PBTableViewController ()
@property (nonatomic,strong) NSArray *srcStringArray;
@end

@implementation PBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight =350;
    
    _srcStringArray = @[
                        @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                        @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr39ht9j20gy0o6q74.jpg",
                        @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr3xvtlj20gy0obadv.jpg",
                        @"http://ww4.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr4nndfj20gy0o9q6i.jpg",
                        @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr57tn9j20gy0obn0f.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/677febf5gw1erma104rhyj20k03dz16y.jpg",
                        @"http://ww4.sinaimg.cn/thumbnail/677febf5gw1erma1g5xd0j20k0esa7wj.jpg",
                        ];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 9;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    PBImagesGroupView *imagesGroupView = [[PBImagesGroupView alloc] init];
    
    NSMutableArray *temp = [NSMutableArray array];
    [_srcStringArray enumerateObjectsUsingBlock:^(NSString *src, NSUInteger idx, BOOL *stop) {
        PBPhotoItemModel *item = [[PBPhotoItemModel alloc] init];
        item.thumbnail_pic = src;
        [temp addObject:item];
    }];
    
    imagesGroupView.photoItemArray = [temp copy];
    [cell.contentView addSubview:imagesGroupView];
    return cell;
}

-(BOOL)shouldAutorotate
{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation ==  UIInterfaceOrientationPortrait);
}
@end
