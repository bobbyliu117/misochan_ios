//
//  InventoryViewController.m
//  MisoChan
//
//  Created by Chang Liu on 12/4/19.
//  Copyright © 2019 Chang Liu. All rights reserved.
//

#import "InventoryViewController.h"
#import "Treasure.h"

#define CELL_ID @"cell_id_1"

@interface InventoryViewController ()

@end

@implementation InventoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_ID];
    self.navigationItem.title = NSLocalizedString(@"inventory", nil);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
    }
    
    Treasure *treasure = self.data[indexPath.row];
    cell.textLabel.text = treasure.title;
    [cell.imageView setImage:[UIImage imageNamed:treasure.imageName]];
    
    return cell;
}

@end
