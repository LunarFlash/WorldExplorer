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

@interface ListViewController ()

@end

@implementation ListViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    FourSquareSessionManager *sessionManager = [FourSquareSessionManager sharedClient];
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext]; // MagicRecord baby!
    AFHTTPResponseSerializer *HTTPResponseSerializer = [AFJSONResponseSerializer serializer];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshBarButtonItemPressed:(id)sender {
}
@end
