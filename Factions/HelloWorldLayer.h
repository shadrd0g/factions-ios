//
//  HelloWorldLayer.h
//  Factions
//
//  Created by Jeremy Pang on 4/20/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "cocos2d.h"

@class FactionAnnotation;

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <MKMapViewDelegate>
{
    NSArray *myAnnotations;
    MKMapView *map;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
