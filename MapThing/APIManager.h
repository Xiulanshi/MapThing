//
//  APIManager.h
//  MapThing
//
//  Created by Xiulan Shi on 2/18/16.
//  Copyright © 2016 Xiulan Shi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface APIManager : NSObject

+(void)getLatestISSLocationWithCompletionHandler:(void(^)(CLLocationCoordinate2D coords)) completion;

@end
