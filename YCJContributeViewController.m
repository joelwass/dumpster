//
//  YCJContributeViewController.m
//  Dumpster
//
//  Created by Joel Wasserman on 10/7/14.
//  Copyright (c) 2014 JoelWass. All rights reserved.
//

#import "YCJContributeViewController.h"


@interface YCJContributeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *aboutUsLabel;

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
    _aboutUsLabel = @"Here at IVΣT we not only believe in open sourcing code, we believe in open sourcing education. We encourage you to participate in the general education of humanity by contributing questions to our network of questions. We hope to provide the platform from which education enthusiasts around the world will dive into the World Wide Web. Please, help us. - IVΣT";
    
}

@end
