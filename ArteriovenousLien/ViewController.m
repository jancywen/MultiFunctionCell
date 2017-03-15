//
//  ViewController.m
//  ArteriovenousLien
//
//  Created by wangwenjie on 2017/3/7.
//  Copyright © 2017年 Roo. All rights reserved.
//

#import "ViewController.h"
#import "ALTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAction:(id)sender {
    [self.navigationController pushViewController:[ALTableViewController new] animated:YES];
}

@end
