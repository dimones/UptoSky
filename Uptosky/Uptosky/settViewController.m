//
//  settViewController.m
//  Uptosky
//
//  Created by Dmitriy Bogomolov on 24.05.14.
//  Copyright (c) 2014 Dimones-dev. All rights reserved.
//

#import "settViewController.h"

@interface settViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *refreshIndicator;

@end

@implementation settViewController
{
    NSArray *first;
    NSArray *second;
    NSMutableArray *items;
}
- (IBAction)refresh:(id)sender {
}
@synthesize refreshIndicator;

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
    // Do any additional setup after loading the view.
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
    [items init];
    /* shit code begin*/
    [items addObject:[first valueForKey:@"name"]];
    [items addObject:[second valueForKey:@"name"]];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"TEST DID ROW SELECT");
}



/*UITableView custom*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
  //  NSDictionary *item = (NSDictionary *)[self.content objectAtIndex:indexPath.row];
   // cell.textLabel.text = [item objectForKey:@"mainTitleKey"];
    //cell.detailTextLabel.text = [item objectForKey:@"secondaryTitleKey"];
    //NSString *path = [[NSBundle mainBundle] pathForResource:[item objectForKey:@"imageKey"] ofType:@"png"];
    //UIImage *theImage = [UIImage imageWithContentsOfFile:path];
    //cell.imageView.image = theImage;
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
