//
//  ScoreCardViewController.h
//  DiscGolf
//
//  Created by Austin Rowley on 11/1/12.
//  Copyright (c) 2012 aorowley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreCardViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *myScroll;

@property (nonatomic) BOOL initialized;

@end
