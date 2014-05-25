//
//  tabViewController.m
//  Uptosky
//
//  Created by Dmitriy Bogomolov on 25.05.14.
//  Copyright (c) 2014 Dimones-dev. All rights reserved.
//

#import "tabViewController.h"
#import <JSONKit.h>
@interface tabViewController ()
@property (weak, nonatomic) IBOutlet UITabBar *tab;

@end

@implementation tabViewController
@synthesize tab;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)setActiveBar:(NSInteger)t
{
    UITabBarItem *tabBarItem = [[tab items] objectAtIndex:1];
    [tabBarItem setEnabled:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"sett"
                                                     ofType:@"json"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    NSData *allData = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *allCourses = [NSJSONSerialization
                                       JSONObjectWithData:allData
                                       options:NSJSONReadingMutableContainers
                                       error:NULL];
      NSNumber *num = [allCourses objectForKey:@"2"];
     NSLog(@"%d",[num intValue]);
    if([num intValue]==1)
    {
        UITabBarItem *tabBarItem = [[tab items] objectAtIndex:1];
        [tabBarItem setEnabled:YES];
    }
    else
    {
        UITabBarItem *tabBarItem = [[tab items] objectAtIndex:1];
        [tabBarItem setEnabled:NO];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
