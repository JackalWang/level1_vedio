//
//  ViewController.h
//  Sample
//
//  Created by Jackal Wang on 2015/6/5.
//  Copyright (c) 2015年 Jackal Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *totalAmount;
@property (weak, nonatomic) IBOutlet UITextField *tipAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercent;
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
- (IBAction)tipPercentChanged:(UISegmentedControl *)sender;

- (void)displayTotalAmount:(float)amount;

- (void)displayTipAmount:(float)amount;

- (float)calculateTipPercentageForSegment:(int)segment;

- (float)getBillAmount;

- (float)calculateTipAmount:(float)amount percent:(float)percent;

- (void)updateDisplayedTip;

- (void)updateDisplayedTotal;

@end

