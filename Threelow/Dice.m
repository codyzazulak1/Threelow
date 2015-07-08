//
//  Dice.m
//  Threelow
//
//  Created by Cody Zazulak on 2015-07-07.
//  Copyright (c) 2015 Cody Zazulak. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)initWithImage:(UIImage*)image Value:(NSInteger)value {
    self = [super init];
    if (self) {
        self.image = image;
        self.value = value;
    }
    return self;
}

@end
