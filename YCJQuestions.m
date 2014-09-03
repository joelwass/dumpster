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

- (void)buildQuestions:(NSMutableDictionary *)questionList
{
    questionNumber = arc4random() % 100;
    
    PFQuery *query = [PFQuery queryWithClassName:@"Questions"];
    [query whereKey:@"QNumber" equalTo:questionNumber];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
            // Did not find any UserStats for the current user
        } else {
            // Found UserStats
            int highScore = [[object objectForKey:@"highScore"] intValue];
        }
    }];
}
@end
