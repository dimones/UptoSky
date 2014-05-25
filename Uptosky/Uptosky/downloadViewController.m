//
//  downloadViewController.m
//  Uptosky
//
//  Created by Dmitriy Bogomolov on 25.05.14.
//  Copyright (c) 2014 Dimones-dev. All rights reserved.
//

#import "downloadViewController.h"
#import "tableTableViewController.h"

@interface downloadViewController ()

@end

@implementation downloadViewController
{
    NSInteger current;
    __weak IBOutlet UIActivityIndicatorView *activity;
    __weak IBOutlet UIButton *goTo;
    __weak IBOutlet UILabel *namePreset;
    __weak IBOutlet UILabel *completeTitle;
}
@synthesize cur,total;
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
    [self performSelector:@selector(aTime) withObject:nil afterDelay:0.7f];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setName:(NSString*)name
{
    namePreset.text = name;    
}
- (IBAction)go:(id)sender {
    NSString *content = @"{   \"1\": 1,    \"2\": 1   }";
    //save content to the documents directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex: 0];
    NSString *docFile = [docDir stringByAppendingPathComponent: @"sett.json"];
   // NSString *content = @"Test";
    [content writeToFile: docFile atomically: NO];
}
-(void)aTime
{
    current++;
    cur.text = [NSString stringWithFormat:@"%d", current];
    if(current<6)
    [self performSelector:@selector(aTime) withObject:nil afterDelay:1.2f];
    else
    {
        activity.hidden = YES;
        goTo.hidden = NO;
        completeTitle.hidden = NO;
        
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue: %@", segue.identifier);
   // [segue.destinationViewController setActiveBar:1];/**/
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
