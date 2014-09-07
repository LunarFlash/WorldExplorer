//
//  Contact.h
//  WorldExplorer
//
//  Created by Yi Wang on 8/31/14.
//  Copyright (c) 2014 Yi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Record.h"


@interface Contact : Record

@property (nonatomic, retain) NSString * formattedPhone;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSManagedObject *venue;

@end
