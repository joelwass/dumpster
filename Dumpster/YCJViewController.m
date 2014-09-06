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

-(IBAction)ButtonPressed:(UIButton *)sender
{
    
    
    
           
    YCJQuestionViewController *wc = [[YCJQuestionViewController alloc]init];
        [self presentViewController:wc animated:NO completion:NULL];
        
       

        
        
   

    
    
   }

@end
