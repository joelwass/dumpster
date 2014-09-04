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
NSString *question = NULL;

- (void)buildQuestions:(NSMutableDictionary *)questionList
{
    int questionNumber = rand() % 1;
    NSString* questionID = [NSString stringWithFormat:@"%i", questionNumber];
    PFQuery *query = [PFQuery queryWithClassName:@"Questions"];
    [query whereKey:@"QNumber" equalTo:questionID];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
            // Did not find any UserStats for the current user
        } else {
            // Found UserStats
            question = [object objectForKey:@"question"];
        }
    }];
    
    NSLog(@"%@, stuff", question);
}
@end
