//
//  ABSegmentTabViewController.m
//  SegmentTab
//
//  Created by Ashok Matoria on 9/17/13.
//  Copyright (c) 2013 Ashok. All rights reserved.
//

#import "ABSegmentTabViewController.h"

#import "ABFirstViewController.h"
#import "ABSecondViewController.h"

@interface ABSegmentTabViewController ()

@property (nonatomic, retain) UISegmentedControl *titleSegments;

@end

@implementation ABSegmentTabViewController

@synthesize selectSegmentTab = _selectSegmentTab;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _selectSegmentTab = UISegmentedControlNoSegment;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSMutableArray *titles = [NSMutableArray arrayWithCapacity:self.tabControllers.count];

    for (UIViewController *vc in self.tabControllers)
    {
        [titles addObject:vc.title];
    }

    self.titleSegments = [[UISegmentedControl alloc] initWithItems:titles];
    [self.titleSegments setSegmentedControlStyle:UISegmentedControlStyleBar];
    self.navigationItem.titleView = self.titleSegments;

    // Register for change in segement selection
    [self.titleSegments addObserver:self forKeyPath:@"selectedSegmentIndex" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];

    // Sample label to identify the view
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.numberOfLines = 2;
    label.text = @"Inside segment container view\nNONE selected";
    label.font = [UIFont systemFontOfSize:[UIFont systemFontSize] + 5];
    [label sizeToFit];
    label.center = self.view.center;

    [self.view addSubview:label];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    if (self.titleSegments.selectedSegmentIndex == UISegmentedControlNoSegment)
    {
        NSLog(@"self.selectSegmentTab = %d", self.selectSegmentTab);
        self.titleSegments.selectedSegmentIndex = self.selectSegmentTab;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    NSAssert1([object isKindOfClass:[UISegmentedControl class]], @"Unexpected object for keypath = %@", keyPath);
    
    // Change in number of unread messages
    if ([keyPath isEqual:@"selectedSegmentIndex"] && ([change[NSKeyValueChangeNewKey] integerValue] != [change[NSKeyValueChangeOldKey] integerValue]))
    {
        NSInteger oldIndex = [change[NSKeyValueChangeOldKey] integerValue];
        NSInteger newIndex = [change[NSKeyValueChangeNewKey] integerValue];
        
        NSAssert(newIndex >= 0 && newIndex < self.tabControllers.count, @"Out of range selection of segement tab");

        if (oldIndex != UISegmentedControlNoSegment)
        {
            UIViewController *topViewController = self.tabControllers[oldIndex];

            [topViewController.view removeFromSuperview];
        }

        UIViewController *newTopViewController = self.tabControllers[newIndex];
        newTopViewController.view.frame =self.view.frame;
        [self.view addSubview:newTopViewController.view];

        self.selectSegmentTab = newIndex;
    }
}
- (void)setSelectSegmentTab:(NSInteger)selectIndex
{
    if (self.selectSegmentTab != selectIndex)
    {
        _selectSegmentTab = selectIndex;
        self.titleSegments.selectedSegmentIndex = selectIndex;
    }
}

- (NSInteger)selectSegmentTab
{
    return _selectSegmentTab;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
