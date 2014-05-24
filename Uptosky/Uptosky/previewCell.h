//
//  previewCell.h
//  Uptosky
//
//  Created by Dmitriy Bogomolov on 24.05.14.
//  Copyright (c) 2014 Dimones-dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface previewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *comment;
@property (weak, nonatomic) IBOutlet UILabel *cost;
//@property (weak, nonatomic) IBOutlet UILabel *comment;
@property (weak, nonatomic) IBOutlet UIButton *download;

@end
