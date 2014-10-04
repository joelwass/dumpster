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
#import "Reachability.h"

@interface YCJViewController ()
{
Reachability *internetReachableFoo;
}
@property (weak, nonatomic) IBOutlet UIButton *nextButton;




@end

@implementation YCJViewController

@synthesize answerArray;
@synthesize questionArray;
@synthesize nextButton;

- (void)viewDidLoad
{
    
    
    
    [super viewDidLoad];

    
    [self.view setBackgroundColor: [self colorWithHexString:@"68C3A3"]];
    [nextButton.titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:18]];
    [_titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:33]];
    //following code is all animation gif
    

    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DumpLoopTrans2" ofType:@"gif"];
    NSData *gif = [NSData dataWithContentsOfFile:filePath];
    
    //_gifImage = [[UIWebView alloc] initWithFrame:CGRectMake(14, 104, 265, 400)];
    _gifImage.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    
    _gifImage.opaque = NO;
    
    [_gifImage loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    _gifImage.userInteractionEnabled = NO;
    [self.view addSubview:_gifImage];
    
    UIView *filter = [[UIView alloc] initWithFrame:self.view.frame];
    filter.backgroundColor = [UIColor blackColor];
    filter.alpha = 0.05;
    [self.view addSubview:filter];
    [self.view sendSubviewToBack:filter];
    nextButton.hidden = true;

    [self testInternetConnection];
    
     //tests to see if we have an internet connection

    
    //create mutable array of PFObjects for use in question data
    
    [self makeQuestions];
    [self performSelector:@selector(makeButtonVisible) withObject:self afterDelay:3.72];
    
}


- (void)testInternetConnection
{
    internetReachableFoo = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    // Internet is reachable
    internetReachableFoo.reachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
        });
    };
    
    // Internet is not reachable
    internetReachableFoo.unreachableBlock = ^(Reachability*reach)
    {
        

        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"No :("
                                                              message:@"Unfortunately you need an internet connection to use Dumpster."
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
            
        });
    };
    
    [internetReachableFoo startNotifier];
}
-(void)makeButtonVisible{
    nextButton.hidden = false;

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons
    if (buttonIndex == 0)
    {
        exit(1);
    }
    else
    {
        NSLog(@"cancel");
    }
}

-(void)makeQuestions{
    
    
    PFQuery *questionQuery = [PFQuery queryWithClassName:@"Questions"];
    [questionQuery setLimit:50];
    [questionQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded. Add the returned objects to allObjects
            
            
            
            questionArray = [objects mutableCopy];
           // NSLog(@"%@", [questionArray[1] valueForKey:@"Question"]);
            
            
        }else{
            
        }
    }];
    
    PFQuery *answerQuery = [PFQuery queryWithClassName:@"Answers"];
    [answerQuery setLimit:50];
    [answerQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            
            answerArray = [objects mutableCopy];
           // NSLog(@"%@", [answerArray[1] valueForKey:@"Answer"]);
            
            
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
