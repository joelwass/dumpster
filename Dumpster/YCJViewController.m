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
#import "UIImage+animatedGIF.h"

@interface YCJViewController ()

@end

@implementation YCJViewController
@synthesize answerArray;
@synthesize questionArray;

- (void)viewDidLoad
{
    
    
    
    [super viewDidLoad];
    [self.view setBackgroundColor: [self colorWithHexString:@"68C3A3"]];
    
    
    
    ////    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DumpLoopTrans2" ofType:@"gif"];
    ////    NSData *gif = [NSData dataWithContentsOfFile:filePath];
    ////
    //    UIWebView *webViewBG = [[UIWebView alloc] initWithFrame:CGRectMake(14, 104, 265, 400)];
    //    webViewBG.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    //
    //    webViewBG.opaque = NO;
    //
    //    [webViewBG loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    //    webViewBG.userInteractionEnabled = NO;
    //
    //    [self.view addSubview:webViewBG];
    //
    //    UIView *filter = [[UIView alloc] initWithFrame:self.view.frame];
    //    filter.backgroundColor = [UIColor blackColor];
    //    filter.alpha = 0.05;
    //    [self.view addSubview:filter];
    
    
    
    
    //create mutable array of PFObjects for use in question data
    [self makeQuestions];
    
}

-(void)makeQuestions{
    PFQuery *questionQuery = [PFQuery queryWithClassName:@"Questions"];
    [questionQuery setLimit:50];
    [questionQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded. Add the returned objects to allObjects
            
            
            
            questionArray = [objects mutableCopy];
            NSLog(@"%@", [questionArray[1] valueForKey:@"Question"]);
            
            
        }else{
            
        }
    }];
    
    PFQuery *answerQuery = [PFQuery queryWithClassName:@"Answers"];
    [answerQuery setLimit:50];
    [answerQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            
            answerArray = [objects mutableCopy];
            NSLog(@"%@", [answerArray[1] valueForKey:@"Answer"]);
            
            
        }else{
            
        }
    }];
    
}

- (IBAction)buttonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"showQuestionSegue" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showQuestionSegue"]){
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        YCJQuestionViewController *controller = (YCJQuestionViewController *)navController.topViewController;
        controller.answerArray = answerArray;
        controller.questionArray = questionArray;
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSString *gString = [cString substringWithRange:range]; //ooh baby, check out the range on that gstring
    
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
