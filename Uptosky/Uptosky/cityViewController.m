//
//  cityViewController.m
//  Uptosky
//
//  Created by Dmitriy Bogomolov on 25.05.14.
//  Copyright (c) 2014 Dimones-dev. All rights reserved.
//

#import "cityViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface cityViewController (){
    AVAudioPlayer *player;
    AVAudioPlayer *player1;
    AVAudioPlayer *player2;
    AVAudioPlayer *player3;
    AVAudioPlayer *player4;
    AVAudioPlayer *player5;
    
}
@property (weak, nonatomic) IBOutlet UICircularSlider *slider_2;
@property (weak, nonatomic) IBOutlet UICircularSlider *slider_3;
@property (weak, nonatomic) IBOutlet UICircularSlider *slider_4;
@property (weak, nonatomic) IBOutlet UICircularSlider *slider_5;
@property (weak, nonatomic) IBOutlet UILabel *timeToday;
@property (weak, nonatomic) IBOutlet UICircularSlider *slider_6;
@property (weak, nonatomic) IBOutlet UICircularSlider *slider_1;
@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, retain) AVAudioPlayer *player1;
@property (nonatomic, retain) AVAudioPlayer *player2;
@property (nonatomic, retain) AVAudioPlayer *player3;
@property (nonatomic, retain) AVAudioPlayer *player4;
@property (nonatomic, retain) AVAudioPlayer *player5;
@end

@implementation cityViewController
@synthesize slider_1 = _slider_1;
@synthesize slider_2 = _slider_2;
@synthesize slider_3 = _slider_3;
@synthesize slider_4 = _slider_4;
@synthesize slider_5 = _slider_5;
@synthesize slider_6 = _slider_6;
@synthesize timeToday;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)stopAll:(id)sender {
    [player stop];
    [player1 stop];
    [player2 stop];
    [player3 stop];
    [player4 stop];
    [player5 stop];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Init time
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MMM dd, yyyy"];
    [timeToday setText:[dateFormat stringFromDate:date]];
    /*Init Sliders*/
    [self.slider_1 addTarget:self action:@selector(updateProgress1:) forControlEvents:UIControlEventValueChanged];
    [self.slider_2 addTarget:self action:@selector(updateProgress2:) forControlEvents:UIControlEventValueChanged];
    [self.slider_3 addTarget:self action:@selector(updateProgress3:) forControlEvents:UIControlEventValueChanged];
    [self.slider_4 addTarget:self action:@selector(updateProgress4:) forControlEvents:UIControlEventValueChanged];
    [self.slider_5 addTarget:self action:@selector(updateProgress5:) forControlEvents:UIControlEventValueChanged];
    [self.slider_6 addTarget:self action:@selector(updateProgress6:) forControlEvents:UIControlEventValueChanged];
    self.slider_1.value =self.slider_2.value = self.slider_3.value = self.slider_4.value = self.slider_5.value = self.slider_6.value = 0.5f;
    [self stopAll:self];
    
}
- (IBAction)play1:(id)sender {
    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
    resourcePath = [resourcePath stringByAppendingString:@"/F1.wav"];
    NSLog(@"Path to play: %@", resourcePath);
    NSError* err;
    
    //Initialize our player pointing to the path to our resource
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:
              [NSURL fileURLWithPath:resourcePath] error:&err];
    
    if( err ){
        //bail!
        NSLog(@"Failed with reason: %@", [err localizedDescription]);
    }
    else{
        //set our delegate and begin playback
        player.delegate = self;
        [player play];
        player.numberOfLoops = -1;
        player.currentTime = 0;
        player.volume = self.slider_1.value;
    }
    
}
- (IBAction)play2:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PLAY 2" object:self];
    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
    resourcePath = [resourcePath stringByAppendingString:@"/MA1.wav"];
    NSLog(@"Path to play: %@", resourcePath);
    NSError* err;
    
    //Initialize our player pointing to the path to our resource
    player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:
               [NSURL fileURLWithPath:resourcePath] error:&err];
    
    if( err ){
        //bail!
        NSLog(@"Failed with reason: %@", [err localizedDescription]);
    }
    else{
        //set our delegate and begin playback
        player1.delegate = self;
        [player1 play];
        player1.numberOfLoops = -1;
        player1.currentTime = 0;
        player1.volume = self.slider_2.value;
    }
}
- (IBAction)play3:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PLAY 2" object:self];
    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
    resourcePath = [resourcePath stringByAppendingString:@"/ME1.wav"];
    NSLog(@"Path to play: %@", resourcePath);
    NSError* err;
    
    //Initialize our player pointing to the path to our resource
    player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:
               [NSURL fileURLWithPath:resourcePath] error:&err];
    
    if( err ){
        //bail!
        NSLog(@"Failed with reason: %@", [err localizedDescription]);
    }
    else{
        //set our delegate and begin playback
        player2.delegate = self;
        [player2 play];
        player2.numberOfLoops = -1;
        player2.currentTime = 0;
        player2.volume = self.slider_3.value;
    }
}
- (IBAction)play4:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PLAY 2" object:self];
    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
    resourcePath = [resourcePath stringByAppendingString:@"/S1.wav"];
    NSLog(@"Path to play: %@", resourcePath);
    NSError* err;
    
    //Initialize our player pointing to the path to our resource
    player3 = [[AVAudioPlayer alloc] initWithContentsOfURL:
               [NSURL fileURLWithPath:resourcePath] error:&err];
    
    if( err ){
        //bail!
        NSLog(@"Failed with reason: %@", [err localizedDescription]);
    }
    else{
        //set our delegate and begin playback
        player3.delegate = self;
        [player3 play];
        player3.numberOfLoops = -1;
        player3.currentTime = 0;
        player3.volume = self.slider_4.value;
    }
}
- (IBAction)play5:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PLAY 2" object:self];
    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
    resourcePath = [resourcePath stringByAppendingString:@"/P1.wav"];
    NSLog(@"Path to play: %@", resourcePath);
    NSError* err;
    
    //Initialize our player pointing to the path to our resource
    player4 = [[AVAudioPlayer alloc] initWithContentsOfURL:
               [NSURL fileURLWithPath:resourcePath] error:&err];
    
    if( err ){
        //bail!
        NSLog(@"Failed with reason: %@", [err localizedDescription]);
    }
    else{
        //set our delegate and begin playback
        player4.delegate = self;
        [player4 play];
        player4.numberOfLoops = -1;
        player4.currentTime = 0;
        player4.volume = self.slider_5.value;
    }
}
- (IBAction)play6:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PLAY 2" object:self];
    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
    resourcePath = [resourcePath stringByAppendingString:@"/R1.wav"];
    NSLog(@"Path to play: %@", resourcePath);
    NSError* err;
    
    //Initialize our player pointing to the path to our resource
    player5 = [[AVAudioPlayer alloc] initWithContentsOfURL:
               [NSURL fileURLWithPath:resourcePath] error:&err];
    
    if( err ){
        //bail!
        NSLog(@"Failed with reason: %@", [err localizedDescription]);
    }
    else{
        //set our delegate and begin playback
        player5.delegate = self;
        [player5 play];
        player5.numberOfLoops = -1;
        player5.currentTime = 0;
        player5.volume = self.slider_6.value;
    }
}

- (void)initPlayers
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateProgress1:(UISlider *)sender {
    float progress = translateValueFromSourceIntervalToDestinationInterval(sender.value, sender.minimumValue, sender.maximumValue, 0.0, 1.0);
    [player setVolume:progress];
}
- (IBAction)updateProgress2:(UISlider *)sender {
    float progress = translateValueFromSourceIntervalToDestinationInterval(sender.value, sender.minimumValue, sender.maximumValue, 0.0, 1.0);
    [player1 setVolume:progress];
}
- (IBAction)updateProgress3:(UISlider *)sender {
    float progress = translateValueFromSourceIntervalToDestinationInterval(sender.value, sender.minimumValue, sender.maximumValue, 0.0, 1.0);
    [player2 setVolume:progress];
}
- (IBAction)updateProgress4:(UISlider *)sender {
    float progress = translateValueFromSourceIntervalToDestinationInterval(sender.value, sender.minimumValue, sender.maximumValue, 0.0, 1.0);
    [player3 setVolume:progress];
}
- (IBAction)updateProgress5:(UISlider *)sender {
    float progress = translateValueFromSourceIntervalToDestinationInterval(sender.value, sender.minimumValue, sender.maximumValue, 0.0, 1.0);
    [player4 setVolume:progress];
}
- (IBAction)updateProgress6:(UISlider *)sender {
    float progress = translateValueFromSourceIntervalToDestinationInterval(sender.value, sender.minimumValue, sender.maximumValue, 0.0, 1.0);
    [player5 setVolume:progress];
}

@end
