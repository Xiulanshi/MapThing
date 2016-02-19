//
//  APIManager.m
//  MapThing
//
//  Created by Xiulan Shi on 2/18/16.
//  Copyright © 2016 Xiulan Shi. All rights reserved.
//

#import "APIManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation APIManager

+(void)getLatestISSLocationWithCompletionHandler:(void(^)(CLLocationCoordinate2D coords)) completion
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    [manager GET:@"http://api.open-notify.org/iss-now.json"
      parameters:nil progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
             NSDictionary *postion = [responseObject objectForKey:@"iss_position"];
             double latitude = [[postion objectForKey:@"latitude"] doubleValue];
             double longitude = [[postion objectForKey:@"longitude"] doubleValue];
             
             CLLocationCoordinate2D location = CLLocationCoordinate2DMake(latitude, longitude);
             
             completion(location);
             
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"%@", error);
         }];
}

@end
