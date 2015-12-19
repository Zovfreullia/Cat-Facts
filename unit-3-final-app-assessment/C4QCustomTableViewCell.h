//
//  C4QCustomTableViewCell.h
//  unit-3-final-app-assessment
//
//  Created by Fatima Zenine Villanueva on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddToDefaultDelegate <NSObject>

- (void)addButtonToDefault:(NSString *)catFact;

@end

@interface C4QCustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *catFactsLabel;
@property (weak, nonatomic) IBOutlet UIButton *catPlusButton;

@property (weak, nonatomic) id<AddToDefaultDelegate> delegate;


@end
