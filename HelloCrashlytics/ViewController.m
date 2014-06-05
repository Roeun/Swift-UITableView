//
//  ViewController.m
//  HelloCrashlytics
//
//  Created by gguser on 3/6/2014.
//  Copyright (c) 2014 gguser. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)actionButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@property (weak, nonatomic) IBOutlet UIButton *navigationButton;

@end


@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
 
  self.actionButton.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:.35];
  self.actionButton.layer.cornerRadius = 5;
  self.actionButton.layer.masksToBounds = YES;
  
  self.navigationButton.backgroundColor=[[UIColor whiteColor] colorWithAlphaComponent:.35];
  self.navigationButton.layer.cornerRadius = 5;
  self.navigationButton.layer.masksToBounds = YES;
}


- (IBAction)actionButton:(id)sender {
  [self test];
}
@end
