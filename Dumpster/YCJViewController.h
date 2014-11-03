//
//  YCJViewController.h
//  Dumpster
//
//  Created by Joel Wasserman on 8/5/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCJViewController : UIViewController

@property (weak, nonatomic)NSString *animationString;
@property (weak, nonatomic)NSURL *animationURL;
@property (weak, nonatomic) IBOutlet UIImageView *animationView;
@property (weak, nonatomic)UINavigationController *navCon;

@property (strong, nonatomic)NSMutableArray *questionArray;
@property (strong, nonatomic)NSMutableArray *answerArray;
@property (strong, nonatomic) IBOutlet UIView *satSwitch;
@property BOOL internet;
@property (strong, nonatomic) IBOutlet UIWebView *gifImage;
//@property (strong, nonatomic)UIWebView *gifImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

-(void)makeQuestions:(long)skipNum;
-(UIColor*)colorWithHexString:(NSString*)hex;


@end


