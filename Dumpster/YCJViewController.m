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
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ezgif.com-gif-maker" ofType:@"gif"];
//    NSData *gif = [NSData dataWithContentsOfFile:filePath];
//    UIWebView *webViewBG = [[UIWebView alloc] initWithFrame:CGRectMake(15, 100, 265, 400)];
//    webViewBG.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
//    webViewBG.opaque = NO;
//    [webViewBG loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
//    webViewBG.userInteractionEnabled = NO;
//    [self.view addSubview:webViewBG];
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
    
    

//         Load images
        NSArray *imageNames = @[@"DumpsterLoadAni0001.jpg",@"DumpsterLoadAni0001.jpg",@"DumpsterLoadAni0001.jpg",@"DumpsterLoadAni0001.jpg",@"DumpsterLoadAni0001.jpg",@"DumpsterLoadAni0001.jpg",@"DumpsterLoadAni0001.jpg",@"DumpsterLoadAni0001.jpg",@"DumpsterLoadAni0001.jpg",@"DumpsterLoadAni0001.jpg",@"DumpsterLoadAni0001.jpg",@"DumpsterLoadAni0001.jpg", @"DumpsterLoadAni0002.jpg", @"DumpsterLoadAni0003.jpg", @"DumpsterLoadAni0004.jpg", @"DumpsterLoadAni0005.jpg", @"DumpsterLoadAni0006.jpg", @"DumpsterLoadAni0007.jpg", @"DumpsterLoadAni0008.jpg", @"DumpsterLoadAni0009.jpg", @"DumpsterLoadAni0010.jpg", @"DumpsterLoadAni0011.jpg", @"DumpsterLoadAni0012.jpg", @"DumpsterLoadAni0013.jpg", @"DumpsterLoadAni0014.jpg", @"DumpsterLoadAni0015.jpg", @"DumpsterLoadAni0016.jpg", @"DumpsterLoadAni0017.jpg", @"DumpsterLoadAni0018.jpg", @"DumpsterLoadAni0019.jpg", @"DumpsterLoadAni0020.jpg", @"DumpsterLoadAni0021.jpg", @"DumpsterLoadAni0022.jpg", @"DumpsterLoadAni0023.jpg", @"DumpsterLoadAni0024.jpg", @"DumpsterLoadAni0025.jpg", @"DumpsterLoadAni0026.jpg", @"DumpsterLoadAni0027.jpg", @"DumpsterLoadAni0028.jpg", @"DumpsterLoadAni0029.jpg", @"DumpsterLoadAni0030.jpg", @"DumpsterLoadAni0031.jpg", @"DumpsterLoadAni0032.jpg", @"DumpsterLoadAni0033.jpg", @"DumpsterLoadAni0034.jpg", @"DumpsterLoadAni0035.jpg", @"DumpsterLoadAni0036.jpg", @"DumpsterLoadAni0037.jpg", @"DumpsterLoadAni0038.jpg", @"DumpsterLoadAni0039.jpg", @"DumpsterLoadAni0040.jpg", @"DumpsterLoadAni0041.jpg", @"DumpsterLoadAni0042.jpg", @"DumpsterLoadAni0043.jpg", @"DumpsterLoadAni0044.jpg", @"DumpsterLoadAni0045.jpg", @"DumpsterLoadAni0046.jpg", @"DumpsterLoadAni0047.jpg", @"DumpsterLoadAni0048.jpg", @"DumpsterLoadAni0049.jpg", @"DumpsterLoadAni0050.jpg", @"DumpsterLoadAni0051.jpg", @"DumpsterLoadAni0052.jpg", @"DumpsterLoadAni0053.jpg", @"DumpsterLoadAni0054.jpg", @"DumpsterLoadAni0055.jpg", @"DumpsterLoadAni0056.jpg", @"DumpsterLoadAni0057.jpg", @"DumpsterLoadAni0058.jpg", @"DumpsterLoadAni0059.jpg", @"DumpsterLoadAni0060.jpg", @"DumpsterLoadAni0061.jpg", @"DumpsterLoadAni0062.jpg", @"DumpsterLoadAni0063.jpg", @"DumpsterLoadAni0064.jpg", @"DumpsterLoadAni0065.jpg", @"DumpsterLoadAni0066.jpg", @"DumpsterLoadAni0067.jpg", @"DumpsterLoadAni0068.jpg", @"DumpsterLoadAni0069.jpg", @"DumpsterLoadAni0070.jpg", @"DumpsterLoadAni0071.jpg", @"DumpsterLoadAni0072.jpg", @"DumpsterLoadAni0073.jpg", @"DumpsterLoadAni0074.jpg", @"DumpsterLoadAni0075.jpg", @"DumpsterLoadAni0076.jpg", @"DumpsterLoadAni0077.jpg", @"DumpsterLoadAni0078.jpg", @"DumpsterLoadAni0079.jpg", @"DumpsterLoadAni0080.jpg", @"DumpsterLoadAni0081.jpg", @"DumpsterLoadAni0082.jpg", @"DumpsterLoadAni0083.jpg", @"DumpsterLoadAni0084.jpg", @"DumpsterLoadAni0085.jpg", @"DumpsterLoadAni0086.jpg", @"DumpsterLoadAni0087.jpg", @"DumpsterLoadAni0088.jpg", @"DumpsterLoadAni0089.jpg", @"DumpsterLoadAni0090.jpg", @"DumpsterLoadAni0091.jpg", @"DumpsterLoadAni0092.jpg", @"DumpsterLoadAni0093.jpg", @"DumpsterLoadAni0094.jpg", @"DumpsterLoadAni0095.jpg", @"DumpsterLoadAni0096.jpg", @"DumpsterLoadAni0096.jpg", @"DumpsterLoadAni0096.jpg", @"DumpsterLoadAni0096.jpg", @"DumpsterLoadAni0096.jpg", @"DumpsterLoadAni0096.jpg", @"DumpsterLoadAni0096.jpg", @"DumpsterLoadAni0096.jpg", @"DumpsterLoadAni0096.jpg", @"DumpsterLoadAni0095.jpg", @"DumpsterLoadAni0094.jpg", @"DumpsterLoadAni0093.jpg", @"DumpsterLoadAni0092.jpg", @"DumpsterLoadAni0091.jpg", @"DumpsterLoadAni0090.jpg", @"DumpsterLoadAni0089.jpg", @"DumpsterLoadAni0088.jpg", @"DumpsterLoadAni0087.jpg", @"DumpsterLoadAni0086.jpg", @"DumpsterLoadAni0085.jpg", @"DumpsterLoadAni0084.jpg", @"DumpsterLoadAni0083.jpg", @"DumpsterLoadAni0082.jpg", @"DumpsterLoadAni0081.jpg", @"DumpsterLoadAni0080.jpg", @"DumpsterLoadAni0079.jpg", @"DumpsterLoadAni0078.jpg", @"DumpsterLoadAni0077.jpg", @"DumpsterLoadAni0076.jpg", @"DumpsterLoadAni0075.jpg", @"DumpsterLoadAni0074.jpg", @"DumpsterLoadAni0073.jpg", @"DumpsterLoadAni0072.jpg", @"DumpsterLoadAni0071.jpg", @"DumpsterLoadAni0070.jpg", @"DumpsterLoadAni0069.jpg", @"DumpsterLoadAni0068.jpg", @"DumpsterLoadAni0067.jpg", @"DumpsterLoadAni0066.jpg", @"DumpsterLoadAni0065.jpg", @"DumpsterLoadAni0064.jpg", @"DumpsterLoadAni0063.jpg", @"DumpsterLoadAni0062.jpg", @"DumpsterLoadAni0061.jpg", @"DumpsterLoadAni0060.jpg", @"DumpsterLoadAni0059.jpg", @"DumpsterLoadAni0058.jpg", @"DumpsterLoadAni0057.jpg", @"DumpsterLoadAni0056.jpg", @"DumpsterLoadAni0055.jpg", @"DumpsterLoadAni0054.jpg", @"DumpsterLoadAni0053.jpg", @"DumpsterLoadAni0052.jpg", @"DumpsterLoadAni0051.jpg", @"DumpsterLoadAni0050.jpg", @"DumpsterLoadAni0049.jpg", @"DumpsterLoadAni0048.jpg", @"DumpsterLoadAni0047.jpg", @"DumpsterLoadAni0046.jpg", @"DumpsterLoadAni0045.jpg", @"DumpsterLoadAni0044.jpg", @"DumpsterLoadAni0043.jpg", @"DumpsterLoadAni0042.jpg", @"DumpsterLoadAni0041.jpg", @"DumpsterLoadAni0040.jpg", @"DumpsterLoadAni0039.jpg", @"DumpsterLoadAni0038.jpg", @"DumpsterLoadAni0037.jpg", @"DumpsterLoadAni0036.jpg", @"DumpsterLoadAni0035.jpg", @"DumpsterLoadAni0034.jpg", @"DumpsterLoadAni0033.jpg", @"DumpsterLoadAni0032.jpg", @"DumpsterLoadAni0031.jpg", @"DumpsterLoadAni0030.jpg", @"DumpsterLoadAni0029.jpg", @"DumpsterLoadAni0028.jpg", @"DumpsterLoadAni0027.jpg", @"DumpsterLoadAni0026.jpg", @"DumpsterLoadAni0025.jpg", @"DumpsterLoadAni0024.jpg", @"DumpsterLoadAni0023.jpg", @"DumpsterLoadAni0022.jpg", @"DumpsterLoadAni0021.jpg", @"DumpsterLoadAni0020.jpg", @"DumpsterLoadAni0019.jpg", @"DumpsterLoadAni0018.jpg", @"DumpsterLoadAni0017.jpg", @"DumpsterLoadAni0016.jpg", @"DumpsterLoadAni0015.jpg", @"DumpsterLoadAni0014.jpg", @"DumpsterLoadAni0013.jpg", @"DumpsterLoadAni0012.jpg", @"DumpsterLoadAni0011.jpg", @"DumpsterLoadAni0010.jpg", @"DumpsterLoadAni0009.jpg", @"DumpsterLoadAni0008.jpg", @"DumpsterLoadAni0007.jpg", @"DumpsterLoadAni0006.jpg", @"DumpsterLoadAni0005.jpg", @"DumpsterLoadAni0004.jpg", @"DumpsterLoadAni0003.jpg", @"DumpsterLoadAni0002.jpg", @"DumpsterLoadAni0001.jpg", @"DumpsterLoadAni0001.jpg", @"DumpsterLoadAni0001.jpg", @"DumpsterLoadAni0001.jpg", @"DumpsterLoadAni0001.jpg", @"DumpsterLoadAni0001.jpg"];
        
        NSMutableArray *images = [[NSMutableArray alloc] init];
        for (int i = 0; i < imageNames.count; i++) {
            [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
        }
        
        // Normal Animation
        UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 120, 230, 400)];
        animationImageView.animationImages = images;
        animationImageView.animationDuration = 7;
        
        [self.view addSubview:animationImageView];
        [animationImageView startAnimating];
    
        
    
    
    
    // ****************************************************************************
    
    }

- (IBAction)buttonPressed:(UIButton *)sender {
        [self performSegueWithIdentifier:@"showQuestionSegue" sender:sender];
        
    }
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if([segue.identifier isEqualToString:@"showQuestionSegue"]){
//        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
//        YCJQuestionViewController *controller = (YCJQuestionViewController *)navController.topViewController;
//        
//        self.navCon = navController;
//        self.navigationController.navigationBar.translucent = NO;
//        [self presentViewController:controller animated:NO completion:NULL];
//    }
//}

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
