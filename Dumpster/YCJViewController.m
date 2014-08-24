//
//  YCJViewController.m
//  Dumpster
//
//  Created by Joel Wasserman on 8/5/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJViewController.h"

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
    
    
    
    
    
    // ****************************************************************************
    // this is for entering in questions and answers into our database
    
    
    
    

    char str[50] = {0};                  // init all to 0
    printf("Enter question: ");
    scanf("%s", str);
    
    //222222222
    
    char a1[50] = {0};                  // init all to 0
    printf("Enter incAnswer1: ");
    scanf("%s", str);
    
    char a2[50] = {0};                  // init all to 0
    printf("Enter incAnswer2: ");
    scanf("%s", str);
    
    char a3[50] = {0};                  // init all to 0
    printf("Enter incAnswer3: ");
    scanf("%s", str);
    
    char a4[50] = {0};                  // init all to 0
    printf("Enter correctAnswer: ");
    scanf("%s", str);
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
