//
//  C4QCustomTableViewCell.m
//  unit-3-final-app-assessment
//
//  Created by Fatima Zenine Villanueva on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCustomTableViewCell.h"

@interface C4QCustomTableViewCell ()

@property (nonatomic) NSMutableArray *catArray;

@end

@implementation C4QCustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.catArray = [[NSMutableArray alloc]init];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)addCatFactToDefaults:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *userDefaultKeys = [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allKeys];
    
    
    BOOL isCatThere = [userDefaultKeys containsObject: @"cat"];
    
    if (isCatThere){
        NSArray *catArray =  [defaults objectForKey:@"cat"];
        NSMutableArray *catMutableArray = [catArray mutableCopy];
        [catMutableArray addObject:self.catFactsLabel.text];
        [defaults setObject:catMutableArray forKey:@"cat"];

    } else {
        NSArray *catArray = @[self.catFactsLabel.text];
        [defaults setObject:catArray forKey:@"cat"];
    }

    NSLog(@"%@", [defaults objectForKey:@"cat"]);
    
}

@end
