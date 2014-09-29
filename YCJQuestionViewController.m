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
#import "YCJViewController.h"
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

- (void)populateQuestions
{
    
    PFQuery *answerQuery = [PFQuery queryWithClassName:@"Answers"];
    int random = arc4random_uniform(4);
    
    NSString *key = [NSString stringWithFormat:@"%d",random];
    self.key = key;
    
    
    
    PFQuery *questionQuery = [PFQuery queryWithClassName:@"Questions"];
    [questionQuery whereKey:@"QNumber" containsString:key];
    [questionQuery getFirstObjectInBackgroundWithBlock:^(PFObject *Questions, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        _questionLabel.text = [Questions[@"Question"] stringByAppendingString:@"?"];
        
        
    }];
    
    /*query based on specific number key, */
    
    [answerQuery whereKey:@"ANumber" containsString:key];
    [answerQuery getFirstObjectInBackgroundWithBlock:^(PFObject *Answers, NSError *error){
        // initialize array of buttons and possible answer texts
        NSArray *buttonArray = [NSArray arrayWithObjects:_button1, _button2, _button3, _button4, nil];
        NSMutableArray *answerArray = [NSMutableArray arrayWithObjects:@"Answer",@"Answer2", @"Answer3", @"Answer4", nil];
        self.correctAnswer = Answers[@"Answer"];
        
        //randomize which button gets which answer text
        for(int i = 0; i<4; i++){
            int randomAnswer = (arc4random() % answerArray.count);
            
            
            [buttonArray[i] setTitle:Answers[answerArray[randomAnswer]] forState:UIControlStateNormal];
            [answerArray removeObjectAtIndex:randomAnswer];
            
            
        }
        
        
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


- (void)viewDidLoad
{
    
   
    
    [super viewDidLoad];
    _button1.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _button1.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view setBackgroundColor: [self colorWithHexString:@"68C3A3"]];
    [_button1.titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:18]];
    _button2.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _button2.titleLabel.textAlignment = NSTextAlignmentCenter;
   [_button2.titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:18]];
    _button3.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _button3.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_button3.titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:18]];
    _button4.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _button4.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_button4.titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:18]];
    [_skipButton.titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:18]];
        [_questionLabel setFont:[UIFont fontWithName:@"Chalkduster" size:18]];
    
    self.navigationController.navigationBar.translucent = NO;
    [self populateQuestions];
    
    
    /*tried putting the pfquery before super viewdidload, turns out that sometimes the query hasn't loaded
     yet and the view loads with nothing in the buttons and labels, so let's keept it so the pf query
     happens after viewdidload.
    */
    
    

    
   
}

- (IBAction)buttonPressed:(UIButton *)sender {
    if(sender.currentTitle == self.correctAnswer){
    [self performSegueWithIdentifier:@"showAnswerSegue" sender:sender];
    }else{
        
    }
}
- (IBAction)nextQuestion:(UIButton *)sender {
    [self populateQuestions];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showAnswerSegue"]){
        YCJAPViewController *controller = (YCJAPViewController *)segue.destinationViewController;
       // YCJAPViewController *controller = [[YCJAPViewController alloc] initWithNibName:nil bundle:nil];
        controller.answerKey = self.key;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


@end
