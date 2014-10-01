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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor: [self colorWithHexString:@"68C3A3"]];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ezgif.com-gif-maker" ofType:@"gif"];
    NSData *gif = [NSData dataWithContentsOfFile:filePath];
    UIWebView *webViewBG = [[UIWebView alloc] initWithFrame:CGRectMake(15, 100, 265, 400)];
    webViewBG.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    webViewBG.opaque = NO;
    [webViewBG loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    webViewBG.userInteractionEnabled = NO;
    [self.view addSubview:webViewBG];
//    
//    UIView *filter = [[UIView alloc] initWithFrame:self.view.frame];
//    filter.backgroundColor = [UIColor blackColor];
//    filter.alpha = 0.05;
//    [self.view addSubview:filter];
    

    
//    _animationString = @"DumpsterLoadAni.gif";
//    _animationURL = [NSURL URLWithString:_animationString];
//    _animationView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DumpsterLoadAni.gif"]];
//    UIImage *image = _animationView.image;
//    image = [UIImage animatedImageWithAnimatedGIFURL:_animationURL];
   
    
    
    
    
    
    // ***********************************************************************************************
    
    
    /* this is the animation page, the image will be a spinning image of whatever.
    AT THIS TIME WE NEED TO CALL THE PARSE METHOD FETCH ALL IN BACKGROUND TO GET A CERTAIN AMOUNT OF 
     QUESTIONS OFF OF OUR DATABASE, WE WANT SOMETHING LIKE 100 QUESTIONS PULLED DOWN WHILE THE ANIMATION IS 
     GOING ON, WE WANT THEM PULLED DOWN IN BACKGROUND. WORK ON THIS LATER
     
    */
    
    

        // Load images
//        NSArray *imageNames = @[@"logo90.png", @"logo180.png", @"logo270.png"];
//        
//        NSMutableArray *images = [[NSMutableArray alloc] init];
//        for (int i = 0; i < imageNames.count; i++) {
//            [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
//        }
//        
//        // Normal Animation
//        UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 160, 120, 120)];
//        animationImageView.animationImages = images;
//        animationImageView.animationDuration = 1.5;
//        
//        [self.view addSubview:animationImageView];
//        [animationImageView startAnimating];
    
    
    
    
    // ****************************************************************************
    
    }

- (IBAction)buttonPressed:(UIButton *)sender {
        [self performSegueWithIdentifier:@"showQuestionSegue" sender:sender];
        
    }
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showQuestionSegue"]){
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        YCJQuestionViewController *controller = (YCJQuestionViewController *)navController.topViewController;
        self.navCon = navController;
        self.navigationController.navigationBar.translucent = NO;
        [self presentViewController:controller animated:NO completion:NULL];
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
