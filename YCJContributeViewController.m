//
//  YCJContributeViewController.m
//  Dumpster
//
//  Created by Joel Wasserman on 10/7/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJContributeViewController.h"


@interface YCJContributeViewController ()


@property (weak, nonatomic) IBOutlet UITextView *aboutUsField;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UITextField *questionField;
@property (weak, nonatomic) IBOutlet UITextField *answerField;

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



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _aboutUsField.layer.borderWidth = 2.0f;
    _aboutUsField.layer.borderColor = [[UIColor blackColor] CGColor];
    [self.view setBackgroundColor: [self colorWithHexString:@"68C3A3"]];
    [_aboutUsField setFont:[UIFont fontWithName:@"Chalkduster" size:16]];
    [_aboutUsField setBackgroundColor:[self colorWithHexString:@"68C3A3"]];
    _aboutUsField.text = @"Here at IVΣT we not only believe in open sourcing code, we believe in open sourcing education. We encourage you to participate in the general education of humanity by contributing questions to our network of questions. We hope to provide the platform from which education enthusiasts around the world will dive into the World Wide Web. Please, help us. - IVΣT";
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
    return YES;
}

-(void)dismissKeyboard {
    [_questionField resignFirstResponder];
    [_answerField resignFirstResponder];
}




@end
