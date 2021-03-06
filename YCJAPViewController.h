//
//  YCJAPViewController.h
//  Dumpster
//
//  Created by Joel Wasserman on 9/6/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCJAPViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UILabel *wikiScrapeLabel;
@property (weak, nonatomic) NSString *correctAnswer;

@property (weak, nonatomic) IBOutlet UIButton *learnMoreButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *contribute;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property  int score;

@end
