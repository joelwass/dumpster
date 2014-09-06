//
//  YCJQuestionViewController.m
//  Dumpster
//
//  Created by Joel Wasserman on 8/15/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJQuestionViewController.h"
#import "YCJQuestions.h"



@interface YCJQuestionViewController ()

//properties for button views
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;

@end

@implementation YCJQuestionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithButton:(UIButton *)button1 button2:(UIButton *)button2 button3:(UIButton *)button3 button4:(UIButton *)button4 question:(UILabel *)question
{
    if( self = [super init])
    {
        _button1 = button1;
        _button2 = button2;
        _button3 = button3;
        _button4 = button4;
        _questionLabel = question;
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
// Do any additional setup after loading the view from its nib.

//Not sure what to do with this shit yet, commenting out to save network traffic
    
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
