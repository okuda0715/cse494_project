//
//  DataInfo.h
//  DiscGolf
//
//  Created by Austin Rowley on 10/18/12.
//  Copyright (c) 2012 aorowley. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataInfo : NSObject

//Array of player names
@property (nonatomic, strong) NSMutableArray *playerNames;
//Array of players that are selected
@property (nonatomic, strong) NSMutableArray *selectedPlayers;
//Array of course names
@property (nonatomic, strong) NSString *courseNames;

@property (nonatomic) int numberOfHoles;


+ (DataInfo *)sharedDataInfo;

@end
