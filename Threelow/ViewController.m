//
//  ViewController.m
//  Threelow
//
//  Created by Cody Zazulak on 2015-07-07.
//  Copyright (c) 2015 Cody Zazulak. All rights reserved.
//

#import "ViewController.h"
#import "Dice.h"
#import "DiceSides.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *diceImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *diceImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *diceImageView3;
@property (weak, nonatomic) IBOutlet UIImageView *diceImageView4;
@property (weak, nonatomic) IBOutlet UIImageView *diceImageView5;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UIButton *holdButton1;
@property (weak, nonatomic) IBOutlet UIButton *holdButton2;
@property (weak, nonatomic) IBOutlet UIButton *holdButton3;
@property (weak, nonatomic) IBOutlet UIButton *holdButton4;
@property (weak, nonatomic) IBOutlet UIButton *holdButton5;

@property (weak, nonatomic) IBOutlet UIButton *rollButton;

@end

@implementation ViewController

NSInteger startingValue1 = 0;
NSInteger startingValue2 = 0;
NSInteger startingValue3 = 0;
NSInteger startingValue4 = 0;
NSInteger startingValue5 = 0;

BOOL dice1IsHeld = false;
BOOL dice2IsHeld = false;
BOOL dice3IsHeld = false;
BOOL dice4IsHeld = false;
BOOL dice5IsHeld = false;

NSInteger count1 = 0;
NSInteger count2 = 0;
NSInteger count3 = 0;
NSInteger count4 = 0;
NSInteger count5 = 0;

NSInteger rollCount = 0;
NSInteger holdCount = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Dice *dice1 = [DiceSides listOfSides][startingValue1];
    Dice *dice2 = [DiceSides listOfSides][startingValue2];
    Dice *dice3 = [DiceSides listOfSides][startingValue3];
    Dice *dice4 = [DiceSides listOfSides][startingValue4];
    Dice *dice5 = [DiceSides listOfSides][startingValue5];
    
    self.diceImageView1.image = dice1.image;
    self.diceImageView2.image = dice2.image;
    self.diceImageView3.image = dice3.image;
    self.diceImageView4.image = dice4.image;
    self.diceImageView5.image = dice5.image;
    
    [_holdButton1 setHidden:YES];
    [_holdButton2 setHidden:YES];
    [_holdButton3 setHidden:YES];
    [_holdButton4 setHidden:YES];
    [_holdButton5 setHidden:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rollButtonPressed:(UIButton *)sender {
    
    [_holdButton1 setHidden:NO];
    [_holdButton2 setHidden:NO];
    [_holdButton3 setHidden:NO];
    [_holdButton4 setHidden:NO];
    [_holdButton5 setHidden:NO];
    
    holdCount = 0;
    
    ++rollCount;
    
    if (!dice1IsHeld) {
        int randomNumber = arc4random() % [DiceSides listOfSides].count;
        Dice *dice1 = [DiceSides listOfSides][randomNumber];
        self.diceImageView1.image = dice1.image;
        count1 = dice1.value;
        
        self.diceImageView1.alpha = 0;
        [UIView transitionWithView:self.diceImageView1 duration:0.3 options:UIViewAnimationOptionTransitionCurlDown animations:^{
            self.diceImageView1.alpha = 1;
        } completion:^(BOOL finished) {}];
    }
    
    if (!dice2IsHeld) {
        int randomNumber = arc4random() % [DiceSides listOfSides].count;
        Dice *dice2 = [DiceSides listOfSides][randomNumber];
        self.diceImageView2.image = dice2.image;
        count2 = dice2.value;
        
        self.diceImageView2.alpha = 0;
        [UIView transitionWithView:self.diceImageView2 duration:0.3 options:UIViewAnimationOptionTransitionCurlDown animations:^{
            self.diceImageView2.alpha = 1;
        } completion:^(BOOL finished) {}];
    }
    
    if (!dice3IsHeld) {
        int randomNumber = arc4random() % [DiceSides listOfSides].count;
        Dice *dice3 = [DiceSides listOfSides][randomNumber];
        self.diceImageView3.image = dice3.image;
        count3 = dice3.value;
        
        self.diceImageView3.alpha = 0;
        [UIView transitionWithView:self.diceImageView3 duration:0.3 options:UIViewAnimationOptionTransitionCurlDown animations:^{
            self.diceImageView3.alpha = 1;
        } completion:^(BOOL finished) {}];
    }
    
    if (!dice4IsHeld) {
        int randomNumber = arc4random() % [DiceSides listOfSides].count;
        Dice *dice4 = [DiceSides listOfSides][randomNumber];
        self.diceImageView4.image = dice4.image;
        count4 = dice4.value;
        
        self.diceImageView4.alpha = 0;
        [UIView transitionWithView:self.diceImageView4 duration:0.3 options:UIViewAnimationOptionTransitionCurlDown animations:^{
            self.diceImageView4.alpha = 1;
        } completion:^(BOOL finished) {}];
    }
    
    if (!dice5IsHeld) {
        int randomNumber = arc4random() % [DiceSides listOfSides].count;
        Dice *dice5 = [DiceSides listOfSides][randomNumber];
        self.diceImageView5.image = dice5.image;
        count5 = dice5.value;
        
        self.diceImageView5.alpha = 0;
        [UIView transitionWithView:self.diceImageView5 duration:0.3 options:UIViewAnimationOptionTransitionCurlDown animations:^{
            self.diceImageView5.alpha = 1;
        } completion:^(BOOL finished) {}];
    }
    
    NSInteger total = count1 + count2 + count3 + count4 + count5;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)total];
    
    if (rollCount < 5) {
        [_rollButton setHidden:NO];
        if (dice1IsHeld && dice2IsHeld && dice3IsHeld && dice4IsHeld && dice5IsHeld) {
            [_rollButton setTitle:@"Submit" forState:UIControlStateNormal];
        }
        if (rollCount == 5) {
            [_rollButton setTitle:@"Submit" forState:UIControlStateNormal];
        }
    } else {
        [_rollButton setHidden:YES];
    }
    
    [_rollButton setHidden:YES];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    dice1IsHeld = false;
    dice2IsHeld = false;
    dice3IsHeld = false;
    dice4IsHeld = false;
    dice5IsHeld = false;
    
    [_holdButton1 setTitle:@"Hold" forState:UIControlStateNormal];
    [_holdButton2 setTitle:@"Hold" forState:UIControlStateNormal];
    [_holdButton3 setTitle:@"Hold" forState:UIControlStateNormal];
    [_holdButton4 setTitle:@"Hold" forState:UIControlStateNormal];
    [_holdButton5 setTitle:@"Hold" forState:UIControlStateNormal];
    
    Dice *dice1 = [DiceSides listOfSides][startingValue1];
    Dice *dice2 = [DiceSides listOfSides][startingValue2];
    Dice *dice3 = [DiceSides listOfSides][startingValue3];
    Dice *dice4 = [DiceSides listOfSides][startingValue4];
    Dice *dice5 = [DiceSides listOfSides][startingValue5];
    
    self.diceImageView1.image = dice1.image;
    self.diceImageView2.image = dice2.image;
    self.diceImageView3.image = dice3.image;
    self.diceImageView4.image = dice4.image;
    self.diceImageView5.image = dice5.image;
    
    rollCount = 0;
    holdCount = 0;
    
    [_holdButton1 setHidden:YES];
    [_holdButton2 setHidden:YES];
    [_holdButton3 setHidden:YES];
    [_holdButton4 setHidden:YES];
    [_holdButton5 setHidden:YES];
    
    self.scoreLabel.text = @"Score: ";
    
    [_rollButton setHidden:NO];
    
}

- (IBAction)hold1ButtonPressed:(UIButton *)sender {
    if (!dice1IsHeld) {
        dice1IsHeld = true;
        [_holdButton1 setTitle:@"Unhold" forState:UIControlStateNormal];
        ++holdCount;
    } else {
        dice1IsHeld = false;
        [_holdButton1 setTitle:@"Hold" forState:UIControlStateNormal];
        --holdCount;
    }
    
    if (holdCount == 0 ){
        [_rollButton setHidden:YES];
    } else {
        [_rollButton setHidden:NO];
    }

}

- (IBAction)hold2ButtonPressed:(UIButton *)sender {
    if (!dice2IsHeld) {
        dice2IsHeld = true;
        [_holdButton2 setTitle:@"Unhold" forState:UIControlStateNormal];
        ++holdCount;
    } else {
        dice2IsHeld = false;
        [_holdButton2 setTitle:@"Hold" forState:UIControlStateNormal];
        --holdCount;
    }
    
    if (holdCount == 0 ){
        [_rollButton setHidden:YES];
    } else {
        [_rollButton setHidden:NO];
    }

}

- (IBAction)hold3ButtonPressed:(UIButton *)sender {
    if (!dice3IsHeld) {
        dice3IsHeld = true;
        [_holdButton3 setTitle:@"Unhold" forState:UIControlStateNormal];
        ++holdCount;
    } else {
        dice3IsHeld = false;
        [_holdButton3 setTitle:@"Hold" forState:UIControlStateNormal];
        --holdCount;
    }
    
    if (holdCount == 0 ){
        [_rollButton setHidden:YES];
    } else {
        [_rollButton setHidden:NO];
    }

}

- (IBAction)hold4ButtonPressed:(UIButton *)sender {
    if (!dice4IsHeld) {
        dice4IsHeld = true;
        [_holdButton4 setTitle:@"Unhold" forState:UIControlStateNormal];
        ++holdCount;
    } else {
        dice4IsHeld = false;
        [_holdButton4 setTitle:@"Hold" forState:UIControlStateNormal];
        --holdCount;
    }
    
    if (holdCount == 0 ){
        [_rollButton setHidden:YES];
    } else {
        [_rollButton setHidden:NO];
    }

}

- (IBAction)hold5ButtonPressed:(UIButton *)sender {
    if (!dice5IsHeld) {
        dice5IsHeld = true;
        [_holdButton5 setTitle:@"Unhold" forState:UIControlStateNormal];
        ++holdCount;
    } else {
        dice5IsHeld = false;
        [_holdButton5 setTitle:@"Hold" forState:UIControlStateNormal];
        --holdCount;
    }
    
    if (holdCount == 0 ){
        [_rollButton setHidden:YES];
    } else {
        [_rollButton setHidden:NO];
    }

}


@end
