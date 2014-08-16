//
//  ABSecondViewController.m
//  SegmentTab
//
//  Created by Ashok Matoria on 9/17/13.
//  Copyright (c) 2013 Ashok. All rights reserved.
//

#import "ABSecondViewController.h"

@interface ABSecondViewController ()

@end

@implementation ABSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Second", @"Second");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];

    // Sample label to identify the view
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.numberOfLines = 2;
    label.text = @"Inside SECOND segment view";
    label.font = [UIFont systemFontOfSize:[UIFont systemFontSize] + 5];
    [label sizeToFit];
    label.center = self.view.center;
    
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
