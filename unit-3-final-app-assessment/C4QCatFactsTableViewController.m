//
//  C4QCatsTableViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsTableViewController.h"
#import "C4QCustomTableViewCell.h"
#import "APIManager.h"
#import "C4QCatFactsDetailViewController.h"

#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController ()<AddToDefaultDelegate>

@property (nonatomic) NSMutableArray *catPosts;
@property (nonatomic) NSString *catToPass;

@end

@implementation C4QCatFactsTableViewController


#pragma mark
#pragma mark - User Default Delegate
- (void)addButtonToDefault:(NSString *)catFact {
    NSLog(@"%@", catFact);
}

#pragma mark
#pragma mark - Networking
- (void)fetchData {
    // create an instagram url
    NSURL *instagramURL = [NSURL URLWithString:@"http://catfacts-api.appspot.com/api/facts?number=100"];
    
    // fetch data from the instagram endpoint and print json response
    [APIManager GETRequestWithURL:instagramURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

        NSArray *cats = [json objectForKey:@"facts"];
        
        for (NSString *catPost in cats){
            [self.catPosts addObject:catPost];
        }
        
        NSLog(@"%@", self.catPosts);
        
        [self.tableView reloadData];
        
    }];
}




#pragma mark
#pragma mark - Life Cycle Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    C4QCustomTableViewCell *object = [[C4QCustomTableViewCell alloc]init];
    object.delegate = self;
    
    //set the cat posts
    self.catPosts = [[NSMutableArray alloc]init];
    
    //call networking
    [self fetchData];
    
    // tell the table view to auto adjust the height of each cell
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 15.0;
    
    // grab the nib from the main bundle
    UINib *nib = [UINib nibWithNibName:@"C4QCustomCell" bundle:nil];
    
    // register the nib for the cell identifer
    [self.tableView registerNib:nib forCellReuseIdentifier:@"C4QCustomCellIdentifier"];
    

}


#pragma mark
#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.catPosts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    C4QCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"C4QCustomCellIdentifier" forIndexPath:indexPath];
    
    cell.catFactsLabel.text = [self.catPosts objectAtIndex:indexPath.row];
    
    cell.catPlusButton.tag = indexPath.row;

        
    [cell.catPlusButton addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

    
    return cell;
}

-(void)yourButtonClicked:(UIButton*)sender
{
            NSLog(@"tesetsts");
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *catFact = [self.catPosts objectAtIndex:indexPath.row];
    self.catToPass = catFact;
  
    [self performSegueWithIdentifier:@"CatDetail" sender:self];
    

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"CatDetail"]) {
        
        C4QCatFactsDetailViewController *dvc = segue.destinationViewController;
        dvc.catFactDetail = self.catToPass;
   }
    

}
@end
