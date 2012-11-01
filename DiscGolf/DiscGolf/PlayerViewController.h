//
//  PlayerViewController.h
//  DiscGolf
//
//  Created by Austin Rowley on 10/18/12.
//  Copyright (c) 2012 aorowley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataInfo.h"

//Using the UITableView's DataSource and Delegate
@interface PlayerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

//Outlet for my UITextField and UITableView
@property (strong, nonatomic) IBOutlet UITextField *myTextfield;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic) BOOL clearsOnBeginEditing;
//Declaring my addButtonPressed method for when the user presses the 'add' button
- (IBAction)addButtonPressed;

@end
