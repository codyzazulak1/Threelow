//
//  DiceSides.m
//  Threelow
//
//  Created by Cody Zazulak on 2015-07-07.
//  Copyright (c) 2015 Cody Zazulak. All rights reserved.
//

#import "DiceSides.h"
#import "Dice.h"

@implementation DiceSides

+(NSArray*) listOfSides{
    return @[
             [[Dice alloc] initWithImage:[UIImage imageNamed:@"side1.png"] Value:1],
             [[Dice alloc] initWithImage:[UIImage imageNamed:@"side2.png"] Value:2],
             [[Dice alloc] initWithImage:[UIImage imageNamed:@"side3.png"] Value:0],
             [[Dice alloc] initWithImage:[UIImage imageNamed:@"side4.png"] Value:4],
             [[Dice alloc] initWithImage:[UIImage imageNamed:@"side5.png"] Value:5],
             [[Dice alloc] initWithImage:[UIImage imageNamed:@"side6.png"] Value:6]
            ];
}

@end
