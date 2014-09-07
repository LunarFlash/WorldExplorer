//
//  FourSquareSessionManager.h
//  WorldExplorer
//
//  Created by Yi Wang on 8/31/14.
//  Copyright (c) 2014 Yi. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface FourSquareSessionManager : AFHTTPSessionManager

+(instancetype)sharedClient;

@end
