//
//  ScoreCardViewController.m
//  DiscGolf
//
//  Created by Austin Rowley on 11/1/12.
//  Copyright (c) 2012 aorowley. All rights reserved.
//

#import "ScoreCardViewController.h"

@interface ScoreCardViewController ()

@end

@implementation ScoreCardViewController

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
	// Do any additional setup after loading the view.
    

    self.initialized = NO;
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if(self.initialized) {
        [self.myScroll flashScrollIndicators];
        
        self.myScroll.contentSize = CGSizeMake(self.myScroll.frame.size.width *2,
                                               self.myScroll.frame.size.height);
        
        self.initialized = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
