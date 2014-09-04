//
//  YCJQuestions.h
//  Dumpster
//
//  Created by Joel Wasserman on 8/15/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCJQuestions : NSObject

@property (strong, atomic) NSString *question;
@property (strong, atomic) NSString *answer1;
@property (strong, atomic) NSString *answer2;
@property (strong, atomic) NSString *answer3;
@property (strong, atomic) NSString *answerCorrect;
@property (strong, atomic) NSMutableDictionary *questionList;
@property (strong, atomic) NSArray *answers;

- (void)buildQuestions;

@end
