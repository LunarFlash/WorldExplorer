//
//  MapViewController.h
//  WorldExplorer
//
//  Created by Yi Wang on 8/31/14.
//  Copyright (c) 2014 Yi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Venue.h"

@interface MapViewController : UIViewController

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) Venue *venue;

@end
