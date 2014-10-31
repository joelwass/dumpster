//
//  YCJAPViewController.m
//  Dumpster
//
//  Created by Joel Wasserman on 9/6/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJAPViewController.h"
#import "YCJViewController.h"
#import "YCJWVViewController.h"
#import "parse/parse.h"
#import "YCJQuestionViewController.h"
#import "YCJContributeViewController.h"

@interface YCJAPViewController ()

@property (nonatomic, retain) NSURL *urlDestination;
@property (strong, nonatomic)NSString *keyWord;
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

- (IBAction)contribute:(UIButton *)sender {
    [self performSegueWithIdentifier:@"contributeSegue" sender:sender];
    
}

- (IBAction)nextQuestion:(UIButton *)sender {
    NSArray *viewControllers = self.navigationController.viewControllers;
    YCJQuestionViewController *back = [viewControllers objectAtIndex:0];
    [back populateQuestions];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    _scoreLabel.text = [NSString stringWithFormat:@"+1.5! Score: %d", _score];
    [_scoreLabel setFont:[UIFont fontWithName:@"Chalkduster" size:18]];
    [self.view setBackgroundColor: [self colorWithHexString:@"68C3A3"]];
    [_answerLabel setFont:[UIFont fontWithName:@"Chalkduster" size:18]];
    [_learnMoreButton.titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:18]];
    [_nextButton.titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:18]];
    [_contribute.titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:14]];
    self.navigationController.navigationBar.translucent = NO;
    
    
    NSString *text1 = [@"Correct, the answer is: " stringByAppendingString:self.correctAnswer];

    _answerLabel.text = text1;
    
    
    
    
    
    //THIS IS GETTING US THE CONTENT OF WIKIPEDIAS MAIN PAGE, WE NEED TO CHANGE THE LINK TO ACCEPT
    //A FORM OF THE ANSWER APPENDED TO THE STRING
    
    
    

    

    


}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"contributeSegue"]){

    }
    else {
        YCJWVViewController *controller = (YCJWVViewController *)segue.destinationViewController;
        controller.keyWord = self.correctAnswer;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
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
