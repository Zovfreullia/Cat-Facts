//
//  C4QCatFactDetailViewController.m
//  unit-3-final-app-assessment
//
//  Created by Michael Kavouras on 12/18/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsDetailViewController.h"
#import "APIManager.h"

#define CAT_GIF_URL @"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC";

@interface C4QCatFactsDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *catFactsDetailLabel;
@property (nonatomic) NSMutableArray *catPictures;
@property (weak, nonatomic) IBOutlet UIImageView *randomCatImage;

@end

@implementation C4QCatFactsDetailViewController


#pragma mark
#pragma mark - Networking
- (void)fetchData {
    // create an instagram url
    NSURL *instagramURL = [NSURL URLWithString:@"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"];
    
    // fetch data from the instagram endpoint and print json response
    [APIManager GETRequestWithURL:instagramURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSArray *dataCats = [json objectForKey:@"data"];
        NSInteger random = arc4random()%[dataCats count];
        
        NSString *stillImage = [[[[[json objectForKey:@"data"]objectAtIndex:random]  objectForKey:@"images"]objectForKey:@"original_still"]objectForKey:@"url"];
        
//        dispatch_async(dispatch_get_global_queue(0,0), ^{
//            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: stillImage]];
//            if ( data == nil )
//                return;
//            dispatch_async(dispatch_get_main_queue(), ^{
//                // WARNING: is the cell still using the same data by this point??
//                self.randomCatImage.image = [UIImage imageWithData: data];
//            });
//        });
//        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^(void) {
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: stillImage]];
            if ( data == nil )
                return;
            dispatch_sync(dispatch_get_main_queue(), ^(void) {
                self.randomCatImage.image = [UIImage imageWithData: data];

            });
        });


        NSLog(@"%@", stillImage);
        
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.catFactsDetailLabel.text = self.catFactDetail;
    // Do any additional setup after loading the view.
    
    // load api
    [self fetchData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
