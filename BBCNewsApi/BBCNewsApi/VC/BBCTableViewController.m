//
//  BBCTableViewController.m
//  BBCNewsApi
//
//  Created by Alexander Gvardian on 06.02.17.
//  Copyright © 2017 home. All rights reserved.
//

#import "BBCTableViewController.h"
#import "BBCTableViewCell.h"
#import "BBCWebViewController.h"
#import "BBCNewsMappingModel.h"

@interface BBCTableViewController ()

@property (strong, nonatomic) NSArray *responseJSON;

@end

@implementation BBCTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNews];
}

- (void)loadNews
{
    NSString *path = [NSString stringWithFormat:@"%@%@%@", kBaseUrl, kApiVersion, kApiNewsPath];
    
    NSDictionary* params = @{@"source" : @"bbc-news",
                             @"apiKey" : @"dffdada08f8448998398282b26316c0a",
                             @"article": @"latest"};
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:path
      parameters:params
        progress:nil
         success:^(NSURLSessionTask *task, NSDictionary* responseObject) {
             
             self.responseJSON = [responseObject valueForKey:@"articles"];
             
             [self.tableView reloadData];
             
             NSLog(@"JSON: %@", responseObject);
             
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.responseJSON.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BBCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"                   forIndexPath:indexPath];
    NSString *publishedString = @"Published at:";
    NSDictionary *responseObjectData = self.responseJSON[indexPath.row];
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[responseObjectData valueForKey:@"urlToImage"]]];
    
    cell.imageNews.image = [UIImage imageWithData:imageData];
    cell.titleLabel.text = [responseObjectData valueForKey:@"title"];
    cell.publishedAtLabel.text = [NSString stringWithFormat:@"%@ %@", publishedString, [responseObjectData valueForKey:@"publishedAt"]];
    cell.descriptionLabel.text = [responseObjectData valueForKey:@"description"];
    cell.urlToGo = [NSURL URLWithString:[responseObjectData valueForKey:@"url"]];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BBCTableViewCell *senderCell = sender;
    
    BBCWebViewController *newsPresentation = [segue destinationViewController];
    newsPresentation.url = senderCell.urlToGo;
}


@end
