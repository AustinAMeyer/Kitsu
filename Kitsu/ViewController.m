//
//  ViewController.m
//  Kitsu
//
//  Created by Austin Meyer on 8/5/19.
//  Copyright © 2019 Austin Meyer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *canonicalTitle;
@property (strong, nonatomic) NSArray *posterImage;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSError *error;
    NSString *kitsuUrl = [NSString stringWithFormat: @"https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=0"];
    NSData *kitsuData = [NSData dataWithContentsOfURL: [NSURL URLWithString:kitsuUrl]];
    NSDictionary *kitsuJson = [NSJSONSerialization JSONObjectWithData:kitsuData options:kNilOptions error:&error];
    //NSLog(@"json: %@", kitsuJson);
    
    self.canonicalTitle = [kitsuJson valueForKeyPath:@"data.attributes.canonicalTitle"];
    self.posterImage = [kitsuJson valueForKeyPath:@"data.attributes.posterImage.tiny"];
    
    //NSLog(@"The content of arry is%@",self.canonicalTitle);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.canonicalTitle[indexPath.item]];
    
    NSString *imgString = self.posterImage[indexPath.item];
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imgString]];
    
    cell.imageView.image = [UIImage imageWithData: imageData];

    return cell;
}



@end
