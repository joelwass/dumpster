//
//  YCJContributeViewController.m
//  Dumpster
//
//  Created by Joel Wasserman on 10/7/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJContributeViewController.h"
#import "Mailgun.h"


@interface YCJContributeViewController ()


@property (weak, nonatomic) IBOutlet UITextView *aboutUsField;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UITextField *questionField;
@property (weak, nonatomic) IBOutlet UITextField *answerField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UILabel *incorrectAnswersLabel;
@property (weak, nonatomic) IBOutlet UITextField *incorrectAnswerField;

@property NSString *question;
@property NSString *answer;


@end

@implementation YCJContributeViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}





- (IBAction)submitButtonPress:(id)sender {
    
    _question = _questionField.text;
    _answer = _answerField.text;
    NSString *messageString = [NSString stringWithFormat:@"Are you sure you want to submit the question: %@\n\n with the correct answer: %@", _question, _answer];
    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Submit Question"
                                                      message:messageString
                                                     delegate:self
                                            cancelButtonTitle:@"Cancel"
                                            otherButtonTitles:@"Yes!", nil];
    alert1.tag = 100;
    [alert1 show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 100) {
        
        if (buttonIndex == 1)
    {
        //Sends message with answers they filled out to email.
        NSString *q = @"Question: ";
        NSString *a = @" Answer: ";
        NSString *incAs = @" Incorrect Answers: ";
        NSString *denotion = @" | ";
        NSArray *qandAs = [[NSArray alloc] initWithObjects:q, _questionField.text, denotion, a, _answerField.text, denotion, incAs, _incorrectAnswerField.text, nil];
        NSString *messageBody = [qandAs componentsJoinedByString:@""];
        
        Mailgun *mailgun = [Mailgun clientWithDomain:@"sandboxa042e16a1b484de4a35e40785f8ef81b.mailgun.org" apiKey:@"key-38646dfb1d2c7fcbb838e0ec449db997"];
        [mailgun sendMessageTo:@"Joel Wasserman <joel.wasserman8@gmail.com>"
                          from:@"Excited User <someone@sample.org>"
                       subject:@"New Dumpster Question"
                          body:messageBody];
        UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:nil message:@"Question Sent.\nThank you!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        alert2.tag = 101;
        [alert2 show];
        //NSLog(@"yay you submit");
    }
    else
    {
        //NSLog(@"cancel");
    }
    }
    else if (alertView.tag == 101) {
        if (buttonIndex == 1)
        {
            NSLog(@"cool, message sent");
        }
        else {
            _questionField.text = nil;
            _answerField.text = nil;
            _incorrectAnswerField.text = nil;
           // NSLog(@"Yep, message sent");
        }
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    [_submitButton setTitle:@"Submit" forState:UIControlStateNormal];
    [_submitButton.titleLabel setFont:[UIFont fontWithName:@"Chalkduster" size:16]];
    _aboutUsField.layer.borderWidth = 2.0f;
    _aboutUsField.layer.borderColor = [[UIColor blackColor] CGColor];
    [self.view setBackgroundColor: [self colorWithHexString:@"68C3A3"]];
    [_aboutUsField setFont:[UIFont fontWithName:@"Chalkduster" size:16]];
    [_aboutUsField setBackgroundColor:[self colorWithHexString:@"68C3A3"]];
    _aboutUsField.text = @"Here at IVΣT we not only believe in open sourcing code, we believe in open sourcing education. We encourage you to participate by contributing questions to our network of questions. We hope to provide the platform from which education enthusiasts around the world will dive into the World Wide Web. Please, help us. - IVΣT";
    _incorrectAnswersLabel.text = @"and 3 incorrect answers,\n seperated by commas";
    [_incorrectAnswersLabel setFont:[UIFont fontWithName:@"Chalkduster" size:15]];
    _incorrectAnswerField.autocorrectionType = UITextAutocorrectionTypeYes;
    _incorrectAnswerField.keyboardType = UIKeyboardTypeDefault;
    _incorrectAnswerField.placeholder = @"Incorrect Answers";
    _incorrectAnswerField.returnKeyType = UIReturnKeyDone;
    [_incorrectAnswerField setDelegate:self];
    _incorrectAnswerField.textAlignment = NSTextAlignmentCenter;
    _incorrectAnswerField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _incorrectAnswerField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _questionLabel.text = @"Type your question:";
    [_questionLabel setFont:[UIFont fontWithName:@"Chalkduster" size:15]];
    _answerField.autocorrectionType = UITextAutocorrectionTypeYes;
    _answerField.keyboardType = UIKeyboardTypeDefault;
    _answerField.placeholder = @"Answer";
    _answerField.returnKeyType = UIReturnKeyDone;
    [_answerField setDelegate:self];
    _answerField.textAlignment = NSTextAlignmentCenter;
    _answerField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _answerField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [tap setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tap];
    _questionField.autocorrectionType = UITextAutocorrectionTypeYes;
    [_questionField setDelegate:self];
    _questionField.textAlignment = NSTextAlignmentCenter;
    _questionField.placeholder = @"Question";
    _questionField.keyboardType = UIKeyboardTypeDefault;
    _questionField.returnKeyType = UIReturnKeyDone;
    _questionField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _questionField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [_answerLabel setFont:[UIFont fontWithName:@"Chalkduster" size:15]];
    _answerLabel.text = @"and answer:";
    
}

-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range]; //ooh baby, check out the range on that gstring
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_questionField resignFirstResponder];
    [_answerField resignFirstResponder];
    [_incorrectAnswerField resignFirstResponder];
    return YES;
}

-(void)dismissKeyboard {
    [_questionField resignFirstResponder];
    [_answerField resignFirstResponder];
    [_incorrectAnswerField resignFirstResponder];
}


@end
