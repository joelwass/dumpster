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
#import "YCJQuestions.h"

@interface YCJViewController ()

@end

@implementation YCJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];

    
    
    
    
    
    
    
    // ***********************************************************************************************
    
    
    /* this is the animation page, the image will be a spinning image of whatever.
    AT THIS TIME WE NEED TO CALL THE PARSE METHOD FETCH ALL IN BACKGROUND TO GET A CERTAIN AMOUNT OF 
     QUESTIONS OFF OF OUR DATABASE, WE WANT SOMETHING LIKE 100 QUESTIONS PULLED DOWN WHILE THE ANIMATION IS 
     GOING ON, WE WANT THEM PULLED DOWN IN BACKGROUND. WORK ON THIS LATER
     
    */
    

        // Load images
        NSArray *imageNames = @[@"logo90.png", @"logo180.png", @"logo270.png"];
        
        NSMutableArray *images = [[NSMutableArray alloc] init];
        for (int i = 0; i < imageNames.count; i++) {
            [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
        }
        
        // Normal Animation
        UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 160, 120, 120)];
        animationImageView.animationImages = images;
        animationImageView.animationDuration = 1.5;
        
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



@end
