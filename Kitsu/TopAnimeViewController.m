//
//  TopAnimeViewController.m
//  Kitsu
//
//  Created by Austin Meyer on 8/11/19.
//  Copyright © 2019 Austin Meyer. All rights reserved.
//

#import "TopAnimeViewController.h"
#import "ViewController.h"

@interface TopAnimeViewController ()

@end

@implementation TopAnimeViewController
NSString *mostPopular = @"https://kitsu.io/api/edge/anime?sort=popularityRank";
NSString *highestRanked = @"https://kitsu.io/api/edge/anime?sort=ratingRank";
NSString *highestRankedRRated = @"https://kitsu.io/api/edge/anime?filter[ageRating]=R&sort=popularityRank";

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"topTenMostPopular"]){
        ViewController *controller = (ViewController *)segue.destinationViewController;
        controller.kitsuUrl = mostPopular;
        
    }
    if ([segue.identifier isEqualToString:@"highestRankedAnime"]) {
        ViewController *controller = (ViewController *)segue.destinationViewController;
        controller.kitsuUrl = highestRanked;
    }
    if ([segue.identifier isEqualToString:@"rRated"]) {
        ViewController *controller = (ViewController *)segue.destinationViewController;
        controller.kitsuUrl = highestRankedRRated;
    }
}



@end
