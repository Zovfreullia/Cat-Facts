//
//  C4QColorPickerViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QColorPickerViewController.h"


@interface C4QColorPickerViewController ()

@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;

@end

@implementation C4QColorPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)redColorButton:(id)sender {
    
    [self.delegate userEnterColor:@"red"];
}

- (IBAction)greenColorButton:(id)sender {
    [self.delegate userEnterColor:@"green"];
    
}

- (IBAction)blueColorButton:(id)sender {
    [self.delegate userEnterColor:@"blue"];
    
}

@end
