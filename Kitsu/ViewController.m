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
   // _kitsuUrl = [NSString stringWithFormat: @"https://kitsu.io/api/edge/anime?sort=popularityRank"];
    NSData *kitsuData = [NSData dataWithContentsOfURL: [NSURL URLWithString:_kitsuUrl]];
    _kitsuJson = [NSJSONSerialization JSONObjectWithData:kitsuData options:kNilOptions error:&error];
   // NSLog(@"json: %@", _kitsuJson);
    
   //NSUInteger keyCount = [_kitsuJson count];
    
    self.canonicalTitle = [_kitsuJson valueForKeyPath:@"data.attributes.canonicalTitle"];
    self.posterImage = [_kitsuJson valueForKeyPath:@"data.attributes.posterImage.tiny"];
    
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
    NSUInteger keyCount = [[_kitsuJson objectForKey: @"data"] count];
   // NSLog(@"%lu",keyCount);
    return keyCount;
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
