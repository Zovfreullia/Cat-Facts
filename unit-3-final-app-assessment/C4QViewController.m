//
//  ViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 11/30/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QViewController.h"
#import "C4QColorPickerViewController.h"

@interface C4QViewController ()<ColorPassDelegate>

@end

@implementation C4QViewController

-(void)userEnterColor:(NSString *)color{
    
    NSString *lookForThisShit = color;
    
    typedef void (^ColorBlock)();
    
    NSDictionary *colorzzz = @{
                               @"blue":
                                   ^{
                                       self.view.backgroundColor = [UIColor blueColor];
                                   },
                               @"red":
                                   ^{
                                       self.view.backgroundColor = [UIColor redColor];
                                   },
                               @"green":
                                   ^{
                                       self.view.backgroundColor = [UIColor greenColor];
                                   }
                               };
    
    ((ColorBlock)colorzzz[lookForThisShit])();
}

@end
