//
//  CourseViewController.h
//  DiscGolf
//
//  Created by Austin Rowley on 10/26/12.
//  Copyright (c) 2012 aorowley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *holesSegmented;
@property (strong, nonatomic) IBOutlet UITextField *courseTextfield;
@property (strong, nonatomic) IBOutlet UILabel *courseLabel;

- (IBAction)confirmButtonPressed:(id)sender;
- (IBAction)addButtonPressed:(id)sender;

@end
