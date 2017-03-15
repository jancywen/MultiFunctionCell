//
//  ALTableViewController.m
//  ArteriovenousLien
//
//  Created by wangwenjie on 2017/3/7.
//  Copyright © 2017年 Roo. All rights reserved.
//

#import "ALTableViewController.h"
#import "ArteriovenousLienCellCell.h"
#import "ArteriovenousLien-Swift.h"
#import "ALTavFooterView.h"

@interface ALTableViewController ()<ALCellDelegate>


@property (nonatomic, assign) CGFloat rowHeight;

@property (nonatomic, assign) NSInteger rowCount;

@property (nonatomic , copy) NSMutableArray *nodeList;

@end

@implementation ALTableViewController

- (NSMutableArray *) nodeList {
    if (_nodeList == nil) {
        _nodeList = @[].mutableCopy;
    }
    return _nodeList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ArteriovenousLienCellCell" bundle:nil] forCellReuseIdentifier:@"ArteriovenousLienCellCell"];
    self.tableView.tableFooterView = [[UIView alloc]init];
//    self.rowCount = 1;
//    [self.nodeList addObject:[self createWithId:@"528" name:@"PICC"]];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return  self.rowCount;
    return self.nodeList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ArteriovenousLienCellCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArteriovenousLienCellCell" forIndexPath:indexPath];
    self.rowHeight = cell.cellH;
    cell.index = indexPath.row;
    cell.delegate = self;

    ObjALInfo *info = [self.nodeList objectAtIndex:indexPath.row];
    NSLog( @"%@", info.skin);
    cell.nodeInfo = [self.nodeList objectAtIndex:indexPath.row];
    
    if (indexPath.row == self.nodeList.count - 1) {
        cell.btnLeft.hidden = NO;
        cell.btnRight.hidden = NO;
        cell.btnCenter.hidden = YES;
    }else {
        cell.btnLeft.hidden = YES;
        cell.btnRight.hidden = YES;
        cell.btnCenter.hidden = NO;
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ObjALInfo *nodeInfo = [self.nodeList objectAtIndex:indexPath.row];
    return nodeInfo.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.nodeList.count  > 0) {
        return 0;
    }
    return 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [self tableFooterView];
}
#pragma mark - cell delegate
- (void)reloadTabelCell:(NSInteger)index {
    [self.tableView reloadData];
}

- (void)reduceAction:(NSInteger)index {
//    self.rowCount--;
    [self.nodeList removeObjectAtIndex:index];
    [self.tableView reloadData];
    
}
- (void) addAction {
//    self.rowCount++;
    [self.nodeList addObject:[self createWithId:@"528" name:@"外周静脉"]];
    [self.tableView reloadData];
    
}

- (ObjALInfo *) createWithId:(NSString *)node_id name:(NSString *)node_name {
    ObjALInfo *nodeInfo = [[ObjALInfo alloc]init];
    nodeInfo.alType = node_name;
 //    nodeInfo.skin = @"异常";
    return nodeInfo;
}

#pragma mark - Private 
//table footer view
-(UIView *) tableFooterView {
    CGFloat SCREEN_W = [UIScreen mainScreen].bounds.size.width;
    ALTavFooterView *fv = [ALTavFooterView share];
    fv.frame = CGRectMake(0, 0, SCREEN_W, 30);
    __weak typeof(self) weakself = self;
    fv.manageAL = ^(BOOL isAdd){
        if (isAdd) {
            [weakself addAction];
        }
    };
    return fv;
}


@end
