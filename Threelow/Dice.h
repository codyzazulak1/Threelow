//
//  Dice.h
//  Threelow
//
//  Created by Cody Zazulak on 2015-07-07.
//  Copyright (c) 2015 Cody Zazulak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Dice : NSObject

@property (nonatomic, strong) UIImage* image;
@property (nonatomic, assign) NSInteger value;

- (instancetype)initWithImage:(UIImage*)image Value:(NSInteger)value;

@end
