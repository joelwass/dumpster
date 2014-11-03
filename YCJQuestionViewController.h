//
//  YCJQuestionViewController.h
//  Dumpster
//
//  Created by Joel Wasserman on 8/15/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCJQuestionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *skipButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property  int randomKey;
@property  int skips;
@property  int score;

@property (strong, nonatomic) NSString *correctAnswer;

@property (strong, nonatomic) NSMutableArray *answerArray;
@property (strong, nonatomic) NSMutableArray *questionArray;
@property (strong, nonatomic) IBOutlet UIView *satSwitch;


- (void)populateQuestions;
- (void)setAnswerRed:(UIButton *)sender;


@end
