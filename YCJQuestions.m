//
//  YCJQuestions.m
//  Dumpster
//
//  Created by Joel Wasserman on 8/15/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJQuestions.h"
#import <Parse/Parse.h>

@implementation YCJQuestions
id questionNumber = 0;
NSString *question = NULL;

- (void)buildQuestions{
    
    [self setAnswer2:@"updated"];
    PFQuery *questionQuery = [PFQuery queryWithClassName:@"Questions"];
    
    [questionQuery getObjectInBackgroundWithId:@"DIJTUwrtPo" block:^(PFObject *Questions, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable
        
        [self setQuestion: Questions[@"Questions"]];
        
    }];
    
    PFQuery *answerQuery = [PFQuery queryWithClassName:@"Answers"];
    
    [answerQuery getObjectInBackgroundWithId:@"zTyjQ2Qm0z" block:^(PFObject *Answers, NSError * error){
        [self setAnswer1: Answers[@"Answer4"]];
        [self setAnswer2: Answers[@"Answer2"]];
        [self setAnswer3: Answers[@"Answer3"]];
        [self setAnswerCorrect:Answers[@"Answer"]];
        
        NSLog(@"%@", self.answerCorrect);
        
    }];

    
    

}
    

@end
