//
//  GooglURLShortenerService.h
//  Tiny
//
//  Created by Scott Petit on 5/10/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NTAURLShortenerService.h"

@interface GooglURLShortenerService : NSObject <NTAURLShortenerService>

+ (instancetype)service;
+ (instancetype)serviceWithAPIKey:(NSString *)apiKey;
- (instancetype)initWithAPIKey:(NSString *)apiKey;

@property (nonatomic,readonly) NSString* apiKey;

@end
