//
//  ViewController.m
//  DudeWheresMyCar
//
//  Created by Komari Herring on 8/11/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

#import "MapViewController.h"
#import "Car.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>
@import CoreLocation;

@interface MapViewController () <CLLocationManagerDelegate>

@property (strong, nonatomic) NSMutableArray *annotations;
@property (strong, nonatomic) NSMutableArray *items;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) Car *anItem;
@property (strong, nonatomic) NSManagedObjectContext *moc;

@end

@implementation MapViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Where is my car?";
    self.annotations = [[NSMutableArray alloc] init];
    self.items = [[NSMutableArray alloc]init];
    
    //[self configureLocationManager];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureAnnotations
{
    //copy and pasted - gotta replace with info 
    
    CLLocationCoordinate2D tiyTampa = CLLocationCoordinate2DMake(27.770068, -82.63642);
    MKPointAnnotation *tiyTampaAnnotation = [[MKPointAnnotation alloc]init];
    tiyTampaAnnotation.coordinate = tiyTampa;
    tiyTampaAnnotation.title = @"The Iron Yard";
    tiyTampaAnnotation.subtitle = @"Tampa";
    [self.annotations addObject:tiyTampaAnnotation];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    [geocoder geocodeAddressString:@"Lakeland, FL" completionHandler:^(NSArray *placemarks, NSError *error) {if (!error)
    {
        MKPlacemark *placemark = placemarks [0];
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
        annotation.coordinate = placemark.location.coordinate;
        annotation.title = @"Lakeland, FL";
        [self.mapView addAnnotation:annotation];
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 200000, 200000);
        [self.mapView setRegion:viewRegion animated:YES];
    }
        
    }];
    
    [self.mapView addAnnotations:self.annotations];
}

@end
