//
//  ForestController.m
//  Uptosky
//
//  Created by Dmitriy Bogomolov on 24.05.14.
//  Copyright (c) 2014 Dimones-dev. All rights reserved.
//

#import "ForestController.h"
#import "UICircularSlider.h"

@interface ForestController ()
{
    AVAudioPlayer *player;
    AVAudioPlayer *player1;
}
@property (weak, nonatomic) IBOutlet UICircularSlider *slider_2;
@property (weak, nonatomic) IBOutlet UICircularSlider *slider_3;
@property (weak, nonatomic) IBOutlet UICircularSlider *slider_4;
@property (weak, nonatomic) IBOutlet UICircularSlider *slider_5;
@property (weak, nonatomic) IBOutlet UICircularSlider *slider_6;
@property (weak, nonatomic) IBOutlet UICircularSlider *slider_1;
@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, retain) AVAudioPlayer *player1;
@end

@implementation ForestController{
    
}

@synthesize slider_1 = _slider_1;
@synthesize slider_2 = _slider_2;
@synthesize slider_3 = _slider_3;
@synthesize slider_4 = _slider_4;
@synthesize slider_5 = _slider_5;
@synthesize slider_6 = _slider_6;


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
    /*Init Sliders*/
    [self.slider_1 addTarget:self action:@selector(updateProgress1:) forControlEvents:UIControlEventValueChanged];
    [self.slider_2 addTarget:self action:@selector(updateProgress2:) forControlEvents:UIControlEventValueChanged];
    [self.slider_3 addTarget:self action:@selector(updateProgress3:) forControlEvents:UIControlEventValueChanged];
    [self.slider_4 addTarget:self action:@selector(updateProgress4:) forControlEvents:UIControlEventValueChanged];
    [self.slider_5 addTarget:self action:@selector(updateProgress5:) forControlEvents:UIControlEventValueChanged];
    [self.slider_6 addTarget:self action:@selector(updateProgress6:) forControlEvents:UIControlEventValueChanged];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    
    /*
     CGRect minuteSliderFrame = CGRectMake(5, 170, 310, 310);
     minuteSlider = [[EFCircularSlider alloc] initWithFrame:minuteSliderFrame];
     minuteSlider.unfilledColor = [UIColor colorWithRed:23/255.0f green:47/255.0f blue:70/255.0f alpha:1.0f];
     minuteSlider.filledColor = [UIColor colorWithRed:155/255.0f green:211/255.0f blue:156/255.0f alpha:1.0f];
     [minuteSlider setInnerMarkingLabels:@[@"5", @"10", @"15", @"20", @"25", @"30", @"35", @"40", @"45", @"50", @"55", @"60"]];
     minuteSlider.labelFont = [UIFont systemFontOfSize:14.0f];
     minuteSlider.lineWidth = 8;
     minuteSlider.minimumValue = 0;
     minuteSlider.maximumValue = 60;
     minuteSlider.labelColor = [UIColor colorWithRed:76/255.0f green:111/255.0f blue:137/255.0f alpha:1.0f];
     minuteSlider.handleType = EFDoubleCircleWithOpenCenter;
     minuteSlider.handleColor = minuteSlider.filledColor;
     [self.view addSubview:minuteSlider];
     [minuteSlider addTarget:self action:@selector(minuteDidChange:) forControlEvents:UIControlEventValueChanged];
     */
    /*
    CGRect slider_1_rect = CGRectMake(50 , 150, 80, 80);
    EFCircularSlider* circularSlider = [[EFCircularSlider alloc] initWithFrame:slider_1_rect];
    circularSlider.unfilledColor = [UIColor clearColor];
    //circularSlider.unfilledColor = [UIColor colorWithRed:23/255.0f green:47/255.0f blue:70/255.0f alpha:1.0f];
    circularSlider.filledColor = [UIColor colorWithRed:255.0f green:255.0f blue:255.0f alpha:0.5f];
    circularSlider.lineWidth = 8;
    circularSlider.minimumValue = 0;
    circularSlider.maximumValue = 100;
    circularSlider.handleColor = circularSlider.filledColor;
    [self.view addSubview:circularSlider];
    [circularSlider setCurrentValue:10.0f];*/
    
    
    
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view.

}
- (IBAction)play1:(id)sender {
    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
    resourcePath = [resourcePath stringByAppendingString:@"/WIND.mp3"];
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
        player.volume = 1.0;
    }
    
}
- (IBAction)play2:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PLAY 2" object:self];
    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
    resourcePath = [resourcePath stringByAppendingString:@"/TEST.mp3"];
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
        player1.volume = 1.0;
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
    NSLog(@"%f 111    ",progress);
    [player setVolume:progress];
}
- (IBAction)updateProgress2:(UISlider *)sender {
    float progress = translateValueFromSourceIntervalToDestinationInterval(sender.value, sender.minimumValue, sender.maximumValue, 0.0, 1.0);
    NSLog(@"%f 222    ",progress);
    [player1 setVolume:progress];
}
- (IBAction)updateProgress3:(UISlider *)sender {
}
- (IBAction)updateProgress4:(UISlider *)sender {
}
- (IBAction)updateProgress5:(UISlider *)sender {
}
- (IBAction)updateProgress6:(UISlider *)sender {
}

@end
