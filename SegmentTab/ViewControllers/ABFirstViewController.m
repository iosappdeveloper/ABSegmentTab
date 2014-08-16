//
//  ABFirstViewController.m
//  SegmentTab
//
//  Created by Ashok Matoria on 9/17/13.
//  Copyright (c) 2013 Ashok. All rights reserved.
//

#import "ABFirstViewController.h"

@interface ABFirstViewController ()

@end

@implementation ABFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"First", @"First");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];

    // Sample label to identify the view
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.numberOfLines = 2;
    label.text = @"Inside FIRST segment view";
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
