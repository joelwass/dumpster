//
//  YCJAPViewController.m
//  Dumpster
//
//  Created by Joel Wasserman on 9/6/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJAPViewController.h"
#import "YCJViewController.h"
#import "YCJWVViewController.h"
#import "parse/parse.h"
#import "YCJQuestionViewController.h"
#import "SBJSON.h"

@interface YCJAPViewController ()

@property (nonatomic, retain) NSURL *urlDestination;
@property (strong, nonatomic)NSString *keyWord;
@end

@implementation YCJAPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)nextQuestion:(UIButton *)sender {
    NSArray *viewControllers = self.navigationController.viewControllers;
    YCJQuestionViewController *back = [viewControllers objectAtIndex:0];
    [back populateQuestions];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    
    PFQuery *answerQuery = [PFQuery queryWithClassName:@"Answers"];
    
    [answerQuery whereKey:@"ANumber" containsString:self.answerKey];
    [answerQuery getFirstObjectInBackgroundWithBlock:^(PFObject *Answers, NSError *error){
        _answerLabel.text = [@"Correct, the answer is: " stringByAppendingString:Answers[@"Answer"]];
        _keyWord = Answers[@"Answer"];
        
    }];
    
    _urlDestination = [[NSURL alloc] initWithString:@"http://en.wikipedia.org/w/api.php?format=json&action=query&titles=Germany&prop=revisions&rvprop=content"];
    
    
    
    //THIS IS GETTING US THE CONTENT OF WIKIPEDIAS MAIN PAGE, WE NEED TO CHANGE THE LINK TO ACCEPT
    //A FORM OF THE ANSWER APPENDED TO THE STRING
    
    
    

    

    


}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    YCJWVViewController *controller = (YCJWVViewController *)segue.destinationViewController;
    controller.keyWord = self.keyWord;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
