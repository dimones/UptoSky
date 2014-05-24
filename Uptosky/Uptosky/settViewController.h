//
//  settViewController.h
//  Uptosky
//
//  Created by Dmitriy Bogomolov on 24.05.14.
//  Copyright (c) 2014 Dimones-dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONKit.h>
#import "previewCell.h"

@interface settViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end
