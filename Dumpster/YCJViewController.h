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
@property BOOL internet;
@property (strong, nonatomic)UIWebView *gifImage;

-(void)makeQuestions;
-(UIColor*)colorWithHexString:(NSString*)hex;


@end


