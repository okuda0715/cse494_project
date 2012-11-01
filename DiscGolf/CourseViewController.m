//
//  CourseViewController.m
//  DiscGolf
//
//  Created by Austin Rowley on 10/26/12.
//  Copyright (c) 2012 aorowley. All rights reserved.
//

#import "CourseViewController.h"
#import "DataInfo.h"

@interface CourseViewController ()

@end

@implementation CourseViewController

@synthesize holesSegmented = _holesSegmented;
@synthesize courseTextfield = _courseTextfield;
@synthesize courseLabel = _courseLabel;

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
    [self.navigationController setNavigationBarHidden:NO];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmButtonPressed:(id)sender
{
    if (self.holesSegmented.selectedSegmentIndex == 0)
    {
        DataInfo *holes = [DataInfo sharedDataInfo];
        

    }
}

- (IBAction)addButtonPressed:(id)sender
{
    //Dismiss keyboard
    [self.courseTextfield resignFirstResponder];
    
    //Getting my data instance,then adding the string object to my array
    DataInfo *names = [DataInfo sharedDataInfo];
    
    names.courseNames = self.courseTextfield.text;
    
    self.courseLabel.text = self.courseTextfield.text;

    
}



@end
