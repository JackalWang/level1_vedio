//
//  ViewController.m
//  Sample
//
//  Created by Jackal Wang on 2015/6/5.
//  Copyright (c) 2015年 Jackal Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self displayTheKeyboard];
}

-(void)displayTheKeyboard{
    [self.billAmount becomeFirstResponder];
}

-(void)dismissTheKeyboard{
    [self.billAmount resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tipPercentChanged:(UISegmentedControl *)sender {
    //NSLog(@"tip percnet changed: %ld",(long)sender.selectedSegmentIndex);
    [self updateDisplayedTip];
    [self updateDisplayedTotal];
    [self dismissTheKeyboard];
}

- (NSString *)formatCurrency:(float)amount{
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    nf.numberStyle = NSNumberFormatterCurrencyStyle;
    NSNumber *number = [NSNumber numberWithInt:amount];
    return [nf stringFromNumber:number];
}

- (void)displayTotalAmount:(float)amount{
//    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
//    nf.numberStyle = NSNumberFormatterCurrencyStyle;
//    NSNumber *number = [NSNumber numberWithInt:amount];
//    self.billAmount.text = [nf stringFromNumber:number];
    self.totalAmount.text = [self formatCurrency:amount];
    //self.billAmount.text = @"$0.00";
}

- (void)displayTipAmount:(float)amount{
//    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
//    nf.numberStyle = NSNumberFormatterCurrencyStyle;
//    NSNumber *number = [NSNumber numberWithInt:amount];
//    self.tipAmount.text = [nf stringFromNumber:number];
    
    self.billAmount.text = [self formatCurrency:amount];
}

- (float)calculateTipPercentageForSegment:(int)segment{
    NSString *tipText = [self.tipPercent titleForSegmentAtIndex:segment];
    return [tipText floatValue] / 100.0;
}

- (float)getBillAmount{
    return [self.billAmount.text floatValue];
}

- (float)calculateTipAmount:(float)amount percent:(float)percent{
    return amount * percent;
}

- (void)updateDisplayedTip{
    float amount = [self getBillAmount];
    int segment = (int)self.tipPercent.selectedSegmentIndex;
    float percent = [self calculateTipPercentageForSegment:segment];
    float tip = [self calculateTipAmount:amount percent:percent];
    self.tipAmount.text = [self formatCurrency:tip];
    
}

- (void)updateDisplayedTotal{
    float amount = [self getBillAmount];
    int segment = (int)self.tipPercent.selectedSegmentIndex;
    float percent = [self calculateTipPercentageForSegment:segment];
    float tip = [self calculateTipAmount:amount percent:percent];
    self.totalAmount.text = [self formatCurrency:tip+amount];

}
@end
