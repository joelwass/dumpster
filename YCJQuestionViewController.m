//
//  YCJQuestionViewController.m
//  Dumpster
//
//  Created by Joel Wasserman on 8/15/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJQuestionViewController.h"
#import "YCJAPViewController.h"
#import "YCJWVViewController.h"
#import "YCJQuestions.h"
#import "Parse/Parse.h"




@interface YCJQuestionViewController ()

//properties for button views
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;

@end

@implementation YCJQuestionViewController
- (IBAction)button1:(UIButton *)sender {
    
    YCJQuestionViewController *firstVC = [[YCJQuestionViewController alloc] initWithNibName:nil bundle:nil];
    YCJAPViewController *secondVC = [[YCJAPViewController alloc] initWithNibName:nil bundle:nil];
    
    NavigationController.viewControllers = [NSArray arrayWithObjects:firstVC, secondVC, nil];
    [UINavigationController popToViewController:secondVC animated:NO];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    

    UIViewController *firstController = [[YCJQuestionViewController alloc] initWithNibName:@"MyFirstViewCon" bundle:nil];
    UIViewController *secondController = [[YCJAPViewController alloc] initWithNibName:@"SecondViewCon" bundle:nil] ;
    UIViewController *thirdController = [[YCJWVViewController alloc] initWithNibName:@"ThirdViewCon" bundle:nil];
    
    UINavigationController *theNavCon = [[UINavigationController alloc] initWithRootViewController:firstController];
    
    [theNavCon pushViewController:secondController animated:NO];
    [theNavCon pushViewController:thirdController animated:NO];
    
    self.window.rootViewController = theNavCon;
    
    PFQuery *questionQuery = [PFQuery queryWithClassName:@"Questions"];
    
    [questionQuery getObjectInBackgroundWithId:@"DIJTUwrtPo" block:^(PFObject *Questions, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        _questionLabel.text = Questions[@"Question"];
        
    }];
    
    
    PFQuery *answerQuery = [PFQuery queryWithClassName:@"Answers"];
    
    [answerQuery getObjectInBackgroundWithId:@"zTyjQ2Qm0z" block:^(PFObject *Answers, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        [_button1 setTitle:Answers[@"Answer4"] forState:UIControlStateNormal];
        [_button2 setTitle:Answers[@"Answer2"] forState:UIControlStateNormal];
        [_button3 setTitle:Answers[@"Answer3"] forState:UIControlStateNormal];
        [_button4 setTitle:Answers[@"Answer"] forState:UIControlStateNormal];
        
    }];
    

    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
