//
//  tableTableViewController.m
//  Uptosky
//
//  Created by Dmitriy Bogomolov on 25.05.14.
//  Copyright (c) 2014 Dimones-dev. All rights reserved.
//

#import "tableTableViewController.h"
#import "previewCell.h"
@interface tableTableViewController ()
{
    IBOutlet UITableView *table;
    
}

@end

@implementation tableTableViewController
{
    NSArray *first;
    NSArray *second;
    NSMutableArray *itemsName;
    NSMutableArray *itemsComment;
    NSDictionary *firstURL;
    NSArray *secondURL;
    NSInteger cur;
}
@synthesize tableView;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    NSData *allCoursesData = [[NSData alloc] initWithContentsOfURL:
                              [NSURL URLWithString:@"http://download.trigen.pro/uptosky/uptosky.json"]];
    
    
    NSMutableDictionary *allCourses = [NSJSONSerialization
                                       JSONObjectWithData:allCoursesData
                                       options:NSJSONReadingMutableContainers
                                       error:&error];
    first = allCourses[@"1"];
    second = allCourses[@"2"];
    /* shit code begin*/
    itemsName = [[NSMutableArray alloc] initWithObjects:nil]; itemsComment = [[NSMutableArray alloc] initWithObjects:nil];
    [itemsName addObject:[first valueForKey:@"name"]];
    [itemsName addObject:[second valueForKey:@"name"]];
    [itemsComment addObject:[first valueForKey:@"comment"]];
    [itemsComment addObject:[second valueForKey:@"comment"]];
    [table reloadData];
    [tableView reloadData];
}
- (IBAction)toDown:(id)sender {
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue: %@", segue.identifier);
    [segue.destinationViewController setName:@"Natural"];/*
    if ([segue.identifier isEqualToString:@"Happy"]) {
        [segue.destinationViewController setName:];
    } else if ([segue.identifier isEqualToString:@"Sad"]) {
        [segue.destinationViewController setHappiness:0];
    }*/
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [itemsName count];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    cur = indexPath.row;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    previewCell *cell = (previewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.name.text = [itemsName objectAtIndex:indexPath.row
                      ];
    [cell.download addTarget:self action:@selector(downloadClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.comment.text = [itemsComment objectAtIndex:indexPath.row];
    return cell;
}
-(void)downloadClicked:(UIButton*)sender
{
    NSLog(@"PRESSED");
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
    //[segue segue];
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//}


@end
