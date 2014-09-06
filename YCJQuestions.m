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


- (void)buildQuestions{
    
   
    PFQuery *query = [PFQuery queryWithClassName:@"Questions"];
    
    [query getObjectInBackgroundWithId:@"DIJTUwrtPo" block:^(PFObject *Questions, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"Hi again");
        
        _question = Questions[@"Question"];
        
        
    }];

    
    

}
    

@end
