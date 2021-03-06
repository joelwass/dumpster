//
//  YCJWVViewController.m
//  Dumpster
//
//  Created by Joel Wasserman on 9/6/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJWVViewController.h"
#import "UIWebView+Clean.h"

@interface YCJWVViewController ()


@end

@implementation YCJWVViewController

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
    self.navigationController.navigationBar.translucent = NO;
    NSArray *answerWithoutSpaces = [_keyWord componentsSeparatedByString:@" "];
    NSString *answer = answerWithoutSpaces[0];
    for (int i = 1; i < [answerWithoutSpaces count]; i++)
    {
        answer = [[answer stringByAppendingString:@"_"] stringByAppendingString:answerWithoutSpaces[i]];
    }
   
    
    NSString *partialURL = @"https://en.wikipedia.org/wiki/";
    NSString *fullURL = [partialURL stringByAppendingString:answer];
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_learnMoreWebView loadRequest:request];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

-(void) viewWillDisappear:(BOOL)animated {
    // Your Code
    // going to add memory leak dealloc
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [self.learnMoreWebView cleanForDealloc];
    self.learnMoreWebView = nil;
    [super viewWillDisappear:YES];
}

@end
