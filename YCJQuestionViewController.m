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
@synthesize randomKey;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)populateQuestions{
    
    
    
     randomKey = arc4random_uniform(_questionArray.count);
    
    
    //    NSString *key = [NSString stringWithFormat:@"%d",random];
    //    self.key = key;
   
    
    
    NSArray *buttonArray = [NSArray arrayWithObjects:_button1, _button2, _button3, _button4, nil];
    NSMutableArray *answerLabelArray = [NSMutableArray arrayWithObjects:[_answerArray[randomKey] valueForKey:@"Answer"], [_answerArray[randomKey] valueForKey:@"IncAnswer2"], [_answerArray[randomKey] valueForKey:@"IncAnswer3"], [_answerArray[randomKey] valueForKey:@"incAnswer1"], nil];
    
   
    
    _questionLabel.text = [_questionArray[randomKey] valueForKey:@"Question"];
    self.correctAnswer = [_answerArray[randomKey] valueForKey:@"Answer"];
    
    for(int i = 0; i<4; i++){
        int randomLabel = (arc4random() % answerLabelArray.count);
        [buttonArray[i] setTitle:answerLabelArray[randomLabel] forState:UIControlStateNormal];
        
        
        [answerLabelArray removeObjectAtIndex:randomLabel];
        
        
    }
    
    [_answerArray removeObjectAtIndex:randomKey];
    [_questionArray removeObjectAtIndex:randomKey];
    if(_questionArray.count == 0){
        [self makeQuestions:((_skips*10)+10)];
    }

    NSLog(@"%d", _questionArray.count);
    
   
    

    
    
}

-(void)makeQuestions:(int)skipNum{
    
    _skips++;
    
    PFQuery *questionQuery = [PFQuery queryWithClassName:@"Questions"];
    [questionQuery setLimit:10];
    [questionQuery setSkip:skipNum];
    [questionQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded. Add the returned objects to allObjects
            
            
            
            _questionArray = [objects mutableCopy];
            
            
            
        }else{
            
        }
    }];
    
    PFQuery *answerQuery = [PFQuery queryWithClassName:@"Answers"];
    [answerQuery setLimit:10];
    [answerQuery setSkip:skipNum];
    [answerQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            
            _answerArray = [objects mutableCopy];
            
            
        }else{
            
        }
    }];
    
}



- (void)viewDidLoad
{
    
    _skips = 0;
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"Chalkduster" size:21],
      NSFontAttributeName, nil]];
    
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
    [_questionLabel setFont:[UIFont fontWithName:@"Chalkduster" size:18
                             ]];
    
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
        
        controller.correctAnswer = self.correctAnswer;
        
        
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
