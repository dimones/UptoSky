//
//  tableUIViewController.m
//  Uptosky
//
//  Created by Dmitriy Bogomolov on 25.05.14.
//  Copyright (c) 2014 Dimones-dev. All rights reserved.
//

#import "tableUIViewController.h"
#import <JSONKit.h>
#import "previewCell.h"
@interface tableUIViewController ()

@end

@implementation tableUIViewController
{
    NSArray *first;
    NSArray *second;
    NSMutableArray *itemsName;
    NSMutableArray *itemsComment;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString* path = @"http://download.trigen.pro/uptosky/uptosky.json";
    NSURL *theURL = [NSURL URLWithString:path];
    NSError *error = nil;
    NSString *theJSON = [NSString stringWithContentsOfURL:theURL encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"%@",theJSON);
    NSData *allData = [[NSData alloc] initWithContentsOfURL:
                              [NSURL URLWithString:@"http://download.trigen.pro/uptosky/uptosky.json"]];
    
    
    NSMutableDictionary *allCourses = [NSJSONSerialization
                                       JSONObjectWithData:allData
                                       options:NSJSONReadingMutableContainers
                                       error:&error];
    first = allCourses[@"1"];
    second = allCourses[@"2"];
    /* shit code begin*/
    itemsName = [[NSMutableArray alloc] initWithObjects:nil]; itemsComment = [[NSMutableArray alloc] initWithObjects:nil];
    [itemsName addObject:@"natural"];
    [itemsName addObject:@"city"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [itemsName count];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    previewCell *cell = (previewCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[previewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.name.text = [itemsName objectAtIndex:indexPath.row];
    cell.comment.text = [itemsComment objectAtIndex:indexPath.row];
    //cell.imageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
