//
//  YCJAPViewController.m
//  Dumpster
//
//  Created by Joel Wasserman on 9/6/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJAPViewController.h"
#import "parse/parse.h"
#import "YCJQuestionViewController.h"
#import "SBJSON.h"

@interface YCJAPViewController ()

@property (nonatomic, retain) NSURL *urlDestination;

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

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    
    PFQuery *answerQuery = [PFQuery queryWithClassName:@"Answers"];
    
   // [answerQuery whereKey:@"ANumber" containsString:key];
    [answerQuery getFirstObjectInBackgroundWithBlock:^(PFObject *Answers, NSError *error){
        _answerLabel.text = [@"Correct, the answer is: " stringByAppendingString:Answers[@"Answer"]];
        
    }];
    
    _urlDestination = [[NSURL alloc] initWithString:@"http://dbpedia.org/page/The_Lord_of_the_Rings"];
    
    
    
    //THIS IS GETTING US THE CONTENT OF WIKIPEDIAS MAIN PAGE, WE NEED TO CHANGE THE LINK TO ACCEPT
    //A FORM OF THE ANSWER APPENDED TO THE STRING BUT THAT'S A LATER CHANGE
    
    
    
    NSMutableURLRequest *request =
    [[NSMutableURLRequest alloc] initWithURL:
     _urlDestination];
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil error:nil];
    
    
    NSString *json_string = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSDictionary *results = [json_string JSONValue];
    
    NSLog(@"%@",results);
    
  //  NSArray *resultArray = [results valueForKeyPath:@"results.variant.product.name"];
  //  NSLog(@"%@",resultArray);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
