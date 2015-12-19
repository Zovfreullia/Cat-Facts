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
                                       NSLog(@"Blue");
                                   },
                               @"red":
                                   ^{
                                       self.view.backgroundColor = [UIColor redColor];
                                       NSLog(@"Red");

                                   },
                               @"green":
                                   ^{
                                       self.view.backgroundColor = [UIColor greenColor];
                                       NSLog(@"Green");

                                   }
                               };
    
    ((ColorBlock)colorzzz[lookForThisShit])();
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"ColorBoard"]) {
        
        C4QColorPickerViewController *vc = segue.destinationViewController;
        vc.delegate = self;
    }

}

@end
