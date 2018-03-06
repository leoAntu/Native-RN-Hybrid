//
//  RootViewController.m
//  NativeRNDemo
//
//  Created by 叮咚钱包富银 on 2018/3/5.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "RootViewController.h"
#import "InitRootViewController.h"
#import "CommunicationController.h"
#import "TestScrollControllerViewController.h"

@interface RootViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0 ) {
        InitRootViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"InitRootViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        CommunicationController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CommunicationController"];
        vc.colloerType = NativeToRNbyNotification;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 2) {
        CommunicationController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CommunicationController"];
        vc.colloerType = RNToNative;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 3) {
        TestScrollControllerViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TestScrollControllerViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}



@end
