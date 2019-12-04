//
//  InventoryViewController.h
//  MisoChan
//
//  Created by Chang Liu on 12/4/19.
//  Copyright © 2019 Chang Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Treasure;

NS_ASSUME_NONNULL_BEGIN

@interface InventoryViewController : UITableViewController
@property (nonatomic, strong) NSArray<Treasure*> *data;
@end

NS_ASSUME_NONNULL_END
