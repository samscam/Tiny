//
//  GooglURLShortenerService.m
//  Tiny
//
//  Created by Scott Petit on 5/10/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import "GooglURLShortenerService.h"

static NSString * GooglBaseURL = @"https://www.googleapis.com/urlshortener/v1/url";
static NSString * GooglLongURLKey = @"longUrl";

@implementation GooglURLShortenerService

#pragma mark - Init

+ (instancetype)service
{
    return [[self alloc] init];
}

+ (instancetype)serviceWithAPIKey:(NSString *)apiKey{
    return [[self alloc] initWithAPIKey:apiKey];
}

- (instancetype)initWithAPIKey:(NSString *)apiKey{
    if ((self=[super init])){
        _apiKey=apiKey;
    }
    return self;
}

#pragma mark - NTAURLShortenerService

- (NSURLRequest *)URLRequestToShortenURL:(NSURL *)URL
{
    NSString *URLString = [URL absoluteString];
    if (![URLString length])
    {
        NSLog(@"URL %@ is required to create a Googl URL", URL);
        return nil;
    }
    
    NSURL *requestURL = [NSURL URLWithString:GooglBaseURL];
    
    NSMutableURLRequest *URLRequest = [NSMutableURLRequest requestWithURL:requestURL];
    [URLRequest setHTTPMethod:@"POST"];
    [URLRequest addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSString *bodyString;
    if (_apiKey){
        bodyString = [NSString stringWithFormat:@"{\"longUrl\": \"%@\" ,\"key\" : \"%@\"}", URLString, _apiKey];
    } else {
        bodyString = [NSString stringWithFormat:@"{\"longUrl\": \"%@\"}", URLString];
    }
    [URLRequest setHTTPBody:[bodyString dataUsingEncoding:NSUTF8StringEncoding]];
    
    return URLRequest;
}

- (NSString *)keyPathForShortenedURL
{
    return @"id";
}

@end
