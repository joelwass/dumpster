//
//  YCJQuestions.h
//  Dumpster
//
//  Created by Joel Wasserman on 8/15/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCJQuestions : NSObject

@property (strong, nonatomic) NSString *question;
@property (strong, nonatomic) NSString *answer1;
@property (strong, nonatomic) NSString *answer2;
@property (strong, nonatomic) NSString *answer3;
@property (strong, nonatomic) NSString *answerCorrect;
@property (strong, nonatomic) NSMutableDictionary *questionList;
@property (strong, nonatomic) NSArray *answers;

- (void)buildQuestions:(NSMutableDictionary *)questionList;

@end
