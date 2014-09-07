//
//  ViewController.h
//  WorldExplorer
//
//  Created by Yi Wang on 8/31/14.
//  Copyright (c) 2014 Yi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"


@interface ListViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;



- (IBAction)refreshBarButtonItemPressed:(UIBarButtonItem *)sender;

@end

