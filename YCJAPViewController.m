//
//  YCJAPViewController.m
//  Dumpster
//
//  Created by Joel Wasserman on 9/6/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJAPViewController.h"
#import "parse/parse.h"

@interface YCJAPViewController ()

@end

@implementation YCJAPViewController

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
    
    
    PFQuery *answerQuery = [PFQuery queryWithClassName:@"Answers"];
    
    [answerQuery getObjectInBackgroundWithId:@"zTyjQ2Qm0z" block:^(PFObject *Answers, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        _answerLabel.text = Answers[@"Answer"];
        
    }];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
