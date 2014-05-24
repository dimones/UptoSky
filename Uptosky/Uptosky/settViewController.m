//
//  settViewController.m
//  Uptosky
//
//  Created by Dmitriy Bogomolov on 24.05.14.
//  Copyright (c) 2014 Dimones-dev. All rights reserved.
//

#import "settViewController.h"
#import "previewCell.h"

@interface settViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *refreshIndicator;

@end

@implementation settViewController
{
    NSArray *first;
    NSArray *second;
    NSMutableArray *itemsName;
    NSMutableArray *itemsComment;
}
- (IBAction)refresh:(id)sender {
}
@synthesize refreshIndicator;
@synthesize table;
@synthesize picker;
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
    /* shit code begin*/
    itemsName = [[NSMutableArray alloc] initWithObjects:nil]; itemsComment = [[NSMutableArray alloc] initWithObjects:nil];
    [itemsName addObject:@"natural"];
    [itemsName addObject:@"city"];
    //[itemsComment addObject:[first valueForKey:@"comment"]];
    //[itemsComment addObject:[second valueForKey:@"comment"]];
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
