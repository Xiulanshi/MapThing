//
//  ViewController.m
//  MapThing
//
//  Created by Xiulan Shi on 2/18/16.
//  Copyright © 2016 Xiulan Shi. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "APIManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@property (nonatomic) CLLocationManager *locationManager;

@property (nonatomic, assign) NSInteger timerCount;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.showsUserLocation = YES;
    self.locationManager = [[CLLocationManager alloc] init];
    
    [self setupTimer];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    [self.locationManager requestWhenInUseAuthorization];
    
}

- (void)setupTimer {
    
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:NO];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
     self.timerCount = 10;
    [timer fire];
    
}

- (void)timerFired:(NSTimer *)timer {
    
    // create a reference count
    // check current timer against the time when the timer was created
    if (self.timerCount < 0) {
//        [timer invalidate];
        //[self doTheThingToDoWhenTheTimersDone];
        
        
        //make sure to set it to 0, so it will start from 0 when run
        self.timerCount = 10;
    }
    
    // determine time left on timer
    
    NSString *string = [[NSNumber numberWithInteger: self.timerCount] stringValue];
    
    self.timerLabel.text = string;
    
    
    self.timerCount--;
    
    NSLog(@"GotCha");
    
    
//    [APIManager getLatestISSLocationWithCompletionHandler:^(CLLocationCoordinate2D coords) {
//        NSLog(@"lat: %f, lng: %f", coords.latitude, coords.longitude);
//    }];
    
    
    [APIManager getLatestISSLocationWithCompletionHandler:^(CLLocationCoordinate2D coords) {
        MKCoordinateSpan span = MKCoordinateSpanMake(50, 50);
        MKCoordinateRegion region = MKCoordinateRegionMake(coords, span);
        
        [self.mapView setRegion:region];
    }];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
