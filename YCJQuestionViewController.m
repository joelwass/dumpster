//
//  YCJQuestionViewController.m
//  Dumpster
//
//  Created by Joel Wasserman on 8/15/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJQuestionViewController.h"
#import "YCJAPViewController.h"
#import "YCJWVViewController.h"
#import "YCJQuestions.h"
#import "Parse/Parse.h"




@interface YCJQuestionViewController ()

//properties for button views

@end

@implementation YCJQuestionViewController


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
    
    
    
    
    /*tried putting the pfquery before super viewdidload, turns out that sometimes the query hasn't loaded
     yet and the view loads with nothing in the buttons and labels, so let's keept it so the pf query
     happens after viewdidload.
    */
    
    
    
    PFQuery *questionQuery = [PFQuery queryWithClassName:@"Questions"];
    
    [questionQuery getObjectInBackgroundWithId:@"DIJTUwrtPo" block:^(PFObject *Questions, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        _questionLabel.text = Questions[@"Question"];
        
    }];
    
    /*query based on specific number key, figure out how to create a random number and then
     pass that as the getObjectWithId so that we can pull a random question and it's answers each time the 
     user hits next 
     */
    
    PFQuery *answerQuery = [PFQuery queryWithClassName:@"Answers"];
    int random = arc4random();
    NSLog(@"%d", random);
    NSString *key = [NSString stringWithFormat:@"%d",random];
    NSLog(@"%@", key);
    
    [answerQuery whereKey:@"ANumber" containsString:@"1"];
    [answerQuery getFirstObjectInBackgroundWithBlock:^(PFObject *Answers, NSError *error){
        // Do something with the returned PFObject in the gameScore variable.
        [_button1 setTitle:Answers[@"Answer4"] forState:UIControlStateNormal];
        [_button2 setTitle:Answers[@"Answer2"] forState:UIControlStateNormal];
        [_button3 setTitle:Answers[@"Answer3"] forState:UIControlStateNormal];
        [_button4 setTitle:Answers[@"Answer"] forState:UIControlStateNormal];
        
        /*
         need to figure out how to set the correct answer to a certain button and then
         remember which button that one is, somehow keep track of it so we know which button
         needs to be pressed in order to continue, also figure out how to randomize buttons that 
         get the correct answer set to it. well i guess that randomization will be done on the parse end
         of things so we just need to keep track of which button gets the correct answer
         set to it
         */
        
    }];

    

    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
