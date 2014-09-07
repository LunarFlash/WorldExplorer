//
//  FourSquareSessionManager.m
//  WorldExplorer
//
//  Created by Yi Wang on 8/31/14.
//  Copyright (c) 2014 Yi. All rights reserved.
//

#import "FourSquareSessionManager.h"
#import "Constants.h"



@implementation FourSquareSessionManager

+(instancetype)sharedClient {
    static FourSquareSessionManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[FourSquareSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kFourSquareBaseURLString]];
    });
    return _sharedClient;
}

@end
