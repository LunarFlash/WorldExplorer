//
//  MapViewController.m
//  WorldExplorer
//
//  Created by Yi Wang on 8/31/14.
//  Copyright (c) 2014 Yi. All rights reserved.
//

#import "MapViewController.h"
#import "Location.h"
#import "FSCategory.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    float latitude = self.venue.location.lat.floatValue;
    float longitude = self.venue.location.lng.floatValue;
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    
    // setup region
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // set annotation and subtitle
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    point.title = self.venue.name;
    point.subtitle = self.venue.categories.name;
    
    [self.mapView addAnnotation:point];
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
