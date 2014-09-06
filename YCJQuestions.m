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

<<<<<<< HEAD

- (void)buildQuestions{
    
    [self setAnswer2:@"updated"];
    PFQuery *query = [PFQuery queryWithClassName:@"Questions"];
    

    [query getObjectInBackgroundWithId:@"DIJTUwrtPo" block:^(PFObject *Questions, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"Hi again");
        
        _question = Questions[@"Question"];
        

        
    }];

    
    

=======
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
>>>>>>> de9b30da73c053b442907c8ab272b71387ec38c8
}
    

@end
