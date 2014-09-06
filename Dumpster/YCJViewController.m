//
//  YCJViewController.m
//  Dumpster
//
//  Created by Joel Wasserman on 8/5/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJViewController.h"
#import "Parse/parse.h"
#import "YCJQuestionViewController.h"
<<<<<<< HEAD
#import "YCJQuestions.h"
=======
>>>>>>> de9b30da73c053b442907c8ab272b71387ec38c8

@interface YCJViewController ()

@end

@implementation YCJViewController


int animationCompletion = 0; //created a variable to store animation count so we can load new view controller in viewDidAppear method


- (void)viewDidAppear:(BOOL)animated {
    
    if (animationCompletion == 1){    // if the animation count has gone through, so if the animation is complete, then:
        
        YCJQuestionViewController *questions = [[YCJQuestionViewController alloc] initWithNibName:NULL bundle:NULL]; //create new view controller
        [self presentViewController:questions animated:NO completion:NULL]; //present new view controller
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    
    
    // ***********************************************************************************************
    // this is the animation page, the image will be a spinning image of whatever.
    
    

        // Load images
        NSArray *imageNames = @[@"logo90.png", @"logo180.png", @"logo270.png"];
        
        NSMutableArray *images = [[NSMutableArray alloc] init];
        for (int i = 0; i < imageNames.count; i++) {
            [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
        }
        
        // Normal Animation
        UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 160, 120, 120)];
        animationImageView.animationImages = images;
        animationImageView.animationDuration = 1;
        animationImageView.animationRepeatCount = 3;
    
    if ([date timeIntervalSinceNow > 4]) {
        animationCompletion = 1;
    }
    
        [self.view addSubview:animationImageView];
        [animationImageView startAnimating];
   

    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(ButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"START" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
    
    
    // ****************************************************************************
    
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)ButtonPressed:(UIButton *)sender
{
    YCJQuestions *questionList = [[YCJQuestions alloc] init];
    
    [questionList buildQuestions];
    
    UILabel *questionLabel = [[UILabel alloc] init];
    questionLabel.text = questionList.question;
    
    
    YCJQuestionViewController *wc = [[YCJQuestionViewController alloc] initWithButton:nil button2:nil button3:nil button4:nil question:questionLabel];
    [self presentViewController:wc animated:NO completion:NULL];
    
    if (wc) {
        [wc viewDidLoad];
    }else{
        NSLog(@"error, Questions failed to load");
    }
    
}

@end
