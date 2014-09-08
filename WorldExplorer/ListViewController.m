//
//  ViewController.m
//  WorldExplorer
//
//  Created by Yi Wang on 8/31/14.
//  Copyright (c) 2014 Yi. All rights reserved.
//

#import "ListViewController.h"
#import "Constants.h"
#import "FourSquareSessionManager.h"
#import <CoreData/CoreData.h>
#import "AFNetworking/AFNetworking.h"
#import <MMRecord/MMRecord.h>
#import "CoreData+MagicalRecord.h"
#import "AFMMRecordResponseSerializer.h"
#import "AFMMRecordResponseSerializationMapper.h"
#import "Venue.h"
#import "Location.h"
#import "MapViewController.h"


@interface ListViewController () <CLLocationManagerDelegate>

@property (strong, nonatomic) NSArray *venues;

@property (strong, nonatomic) CLLocationManager *locationManager;


@end

@implementation ListViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    self.locationManager.distanceFilter = 10.0; //meters
    
    
    FourSquareSessionManager *sessionManager = [FourSquareSessionManager sharedClient];
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext]; // MagicRecord baby!
    AFHTTPResponseSerializer *HTTPResponseSerializer = [AFJSONResponseSerializer serializer];
    // allow us to map response from JSON to coredata model
    AFMMRecordResponseSerializationMapper *mapper = [[AFMMRecordResponseSerializationMapper alloc] init];
    [mapper registerEntityName:@"Venue" forEndpointPathComponent:@"venues/search?"];
    
    // bundle everything into a serializer
    AFMMRecordResponseSerializer *serializer = [AFMMRecordResponseSerializer serializerWithManagedObjectContext:context responseObjectSerializer:HTTPResponseSerializer entityMapper:mapper];
    
    sessionManager.responseSerializer = serializer;
    
    // now when we make a request, it will use mmrecord serializer and parse json right into coredata
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark IBActions

- (IBAction)refreshBarButtonItemPressed:(id)sender {
    
    [self.locationManager startUpdatingLocation];
}


#pragma mark UITableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.venues count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Venue *venue = self.venues[indexPath.row];
    cell.textLabel.text = venue.name;
    cell.detailTextLabel.text = venue.location.address;
    return cell;
}


#pragma mark CLLocationManager Delegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    
    NSLog(@"attempting to update location...");
    
    CLLocation *location = [locations lastObject];
    [self.locationManager stopUpdatingLocation];

    [[FourSquareSessionManager sharedClient] GET: [NSString stringWithFormat:@"venues/search?ll=%f,%f", location.coordinate.latitude, location.coordinate.longitude]
                                      parameters:@{@"client_id" : kFourSquareClientId, @"client_secret" : kFourSquareClientSecret, @"v" : @"20140416"} success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSArray *venues = responseObject;
        self.venues = venues;
        [self.tableView reloadData];
        

        NSLog(@"response:%@", responseObject);
                                          
        NSLog(@"location.latitude:%f, longitude%f", location.coordinate.latitude, location.coordinate.longitude);
                                          
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error:%@", error);
    }];
    
    


}


@end
