//
//  ViewController.m
//  H264-VideoToolbox-Demo
//
//  Created by 殷汶杰 on 2018/2/4.
//  Copyright © 2018年 殷汶杰. All rights reserved.
//

#import "ViewController.h"
#import "DemoLocalFolderViewController.h"

#include "include/libavformat/avformat.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *tableViewTitles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableViewTitles = @[@"Albumn", @"Bundle"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
        cell.textLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    }
    cell.textLabel.text = self.tableViewTitles[indexPath.row];
    
    return cell;
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
            NSLog(@"Play Video from Albumn. Path: %@", documentsPath);
        }   break;
            
        case 1: {
            NSString *documentsPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:@"/Video.bundle/Contents/Resources"];
            DemoLocalFolderViewController *viewController = [[DemoLocalFolderViewController alloc] initWithFolderPath:documentsPath];
            
            [self.navigationController pushViewController:viewController animated:YES];
        }   break;
        default:
            break;
    }
}
@end
