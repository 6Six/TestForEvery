//
//  ViewController.m
//  LocationDemo
//
//  Created by Garry on 15/10/10.
//  Copyright © 2015年 richinfo. All rights reserved.
//

#import "ViewController.h"

#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self startLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//开始定位
- (void)startLocation
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    self.locationManager.distanceFilter = 10.0f;
    
    // 开始定位
    if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
    {
//        [self.locationManager requestAlwaysAuthorization]; // 永久授权
        [self.locationManager requestWhenInUseAuthorization]; //使用中授权
    }
    
    [self.locationManager startUpdatingLocation];
}


//定位代理经纬度回调
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [manager stopUpdatingLocation];
    
    NSLog(@"location ok");
    NSLog(@"%@",[NSString stringWithFormat:@"经度:%3.5f\n纬度:%3.5f",newLocation.coordinate.latitude,newLocation.coordinate.longitude]);
    
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    
    [geoCoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        
        for (CLPlacemark *placemark in placemarks)
        {
            NSDictionary *test = [placemark addressDictionary];
            //  Country(国家)  State(城市)  SubLocality(区)
            
            NSLog(@"%@", [test objectForKey:@"State"]);
        }
    }];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    NSLog(@"update locations");
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"update error!");
}

@end
