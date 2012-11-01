//
//  DataInfo.m
//  DiscGolf
//
//  Created by Austin Rowley on 10/18/12.
//  Copyright (c) 2012 aorowley. All rights reserved.
//

#import "DataInfo.h"

@implementation DataInfo

@synthesize playerNames = _playerNames;
@synthesize selectedPlayers = _selectedPlayers;
@synthesize courseNames = _courseNames;
@synthesize holeNumber = _holeNumber;


- (id) init
{
    self = [super init];
    
    if (self)
    {
        self.playerNames = [[NSMutableArray alloc] init];
        self.selectedPlayers = [[NSMutableArray alloc] init];
        self.courseNames = [[NSString alloc] init];
        self.holeNumber = 9;
    }
    
    return self;
}



static DataInfo *theDataInfo = nil;

+ (DataInfo *)sharedDataInfo
{
    if (theDataInfo == nil)
    {
        theDataInfo = [[DataInfo alloc] init];
    }
    return theDataInfo;
}



@end
