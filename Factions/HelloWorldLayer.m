//
//  HelloWorldLayer.m
//  Factions
//
//  Created by Jeremy Pang on 4/20/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "CCUIViewWrapper.h"
#import <MapKit/MapKit.h>
#import "MarkerAnnotation.h"
#import "MainScene.h"
#import "FactionAnnotation.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void)goBack {
    [[CCDirector sharedDirector] replaceScene:[MainScene scene]];
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        map = [[MKMapView alloc] initWithFrame: CGRectMake(0, 0, 320, 430)];
        map.delegate = self;
        map.zoomEnabled = NO;
        //Define map view region
        MKCoordinateSpan span;
        span.latitudeDelta=.01;
        span.longitudeDelta=.01;
        MKCoordinateRegion region;
        region.span=span;
        region.center=CLLocationCoordinate2DMake(34.069, -118.447);
        [map setRegion:region animated:YES];
        [map regionThatFits:region];
        [map setRegion:region animated:YES];
        [map regionThatFits:region];
        /*
        CLLocationCoordinate2D commuterLotCoords[5]={
            CLLocationCoordinate2DMake(39.048019,-76.850535),
            CLLocationCoordinate2DMake(39.048027,-76.850234),
            CLLocationCoordinate2DMake(39.047407,-76.850181),
            CLLocationCoordinate2DMake(39.047407,-76.8505),
            CLLocationCoordinate2DMake(39.048019,-76.850535)
        };
        
        MKPolygon *commuterPoly1 = [MKPolygon polygonWithCoordinates:commuterLotCoords count:5];
        [map addOverlay:commuterPoly1];
        [commuterPoly1 release];
        
        CLLocationCoordinate2D overflowLotCoords[16]={
            CLLocationCoordinate2DMake(39.04864351611461,-76.8513227245313),
            CLLocationCoordinate2DMake(39.04851710015167,-76.8517540587399),
            CLLocationCoordinate2DMake(39.04868674731313,-76.85192728689483),
            CLLocationCoordinate2DMake(39.04850095882104,-76.85230365946416),
            CLLocationCoordinate2DMake(39.04819087100218,-76.85265260435219),
            CLLocationCoordinate2DMake(39.0477370134458,-76.85286078490296),
            CLLocationCoordinate2DMake(39.04692851484644,-76.85283202926037),
            CLLocationCoordinate2DMake(39.04695987529381,-76.85235192135768),
            CLLocationCoordinate2DMake(39.04734847050665,-76.85236298239703),
            CLLocationCoordinate2DMake(39.04779491740192,-76.85232236959109),
            CLLocationCoordinate2DMake(39.04814366462639,-76.85208905182692),
            CLLocationCoordinate2DMake(39.04838024069194,-76.85164072166863),
            CLLocationCoordinate2DMake(39.04843331131504,-76.85085998781742),
            CLLocationCoordinate2DMake(39.04857547181026,-76.8507923535788),
            CLLocationCoordinate2DMake(39.04864351611461,-76.8513227245313)
        };
        
        MKPolygon *overflowPoly1 = [MKPolygon polygonWithCoordinates:overflowLotCoords count:15];
        [map addOverlay:overflowPoly1];
        [overflowPoly1 release];*/
        
        for (int i =0; i<20; i++) {
            for(int j=0; j< 20; j++)
            {
                CLLocationCoordinate2D overflowLotCoords[5]={
                CLLocationCoordinate2DMake(34.059+0.001*i, -118.437-0.001*j),
                CLLocationCoordinate2DMake(34.059+0.001*(i+1), -118.437-0.001*j),
                CLLocationCoordinate2DMake(34.059+0.001*(i+1), -118.437-0.001*(j+1)),
                CLLocationCoordinate2DMake(34.059+0.001*(i), -118.437-0.001*(j+1)),
                CLLocationCoordinate2DMake(34.059+0.001*i, -118.437-0.001*j)
                };
                
            
                MKPolygon *overflowPoly1 = [MKPolygon polygonWithCoordinates:overflowLotCoords count:5];
                [map addOverlay:overflowPoly1];
                [overflowPoly1 release];
            }
            
        }
        
        
        //Initialize annotation
        MyAnnotationClass *commuterLotAnnotation=[[MyAnnotationClass alloc] initWithCoordinate:CLLocationCoordinate2DMake(34.069, -118.447)];
        
        //Add them to array
        myAnnotations=[NSArray arrayWithObjects:commuterLotAnnotation, nil];
        
        //Release the annotations now that they've been added to the array
        [commuterLotAnnotation release];
        
        //add array of annotations to map
        [map addAnnotations:myAnnotations];
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        CCUIViewWrapper *wrapper = [CCUIViewWrapper wrapperForUIView:map];
        wrapper.position = ccp(0, winSize.height-50);
        [self addChild:wrapper];
        CCMenuItemSprite *backButton = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"backButton.png"] selectedSprite:[CCSprite spriteWithFile:@"backButton.png"] target:self selector:@selector(goBack)];
        backButton.position = ccp(25, 480-25);
        CCMenu *menu = [CCMenu menuWithItems:backButton, nil];
        menu.position = CGPointZero;
        [self addChild:menu];
        
        // Long press gesture recogniser
        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]
                                                          initWithTarget:self 
                                                          action:@selector(handleLongPressGesture:)];
        [map addGestureRecognizer:longPressGesture];
        [longPressGesture release];

	}
	return self;
}

-(void)handleLongPressGesture:(UILongPressGestureRecognizer*)sender 
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint touchPoint = [sender locationInView:map];   
        CLLocationCoordinate2D touchMapCoordinate = [map convertPoint:touchPoint toCoordinateFromView:map];
        
        FactionAnnotation *factionAnnotation = [[FactionAnnotation alloc] init];
        
        factionAnnotation.coordinate = touchMapCoordinate;
        factionAnnotation.name = @"Faction";
        factionAnnotation.description = @"10 Players";
        [map addAnnotation:factionAnnotation];
        //[map removeAnnotation:factionAnnotation];
        
        static NSString *identifier = @"FactionAnnotation";   
        MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:factionAnnotation reuseIdentifier:identifier];
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        [factionAnnotation release];
    }
}


-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id )overlay{
    if([overlay isKindOfClass:[MKPolygon class]]){
        MKPolygonView *view = [[[MKPolygonView alloc] initWithOverlay:overlay] autorelease];
        view.lineWidth=1;
        view.strokeColor=[UIColor blueColor];
        view.fillColor=[[UIColor blueColor] colorWithAlphaComponent:0.1];
        return view;
    }
    return nil;
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation{
    static NSString *parkingAnnotationIdentifier=@"ParkingAnnotationIdentifier";
    
    if([annotation isKindOfClass:[MyAnnotationClass class]]){
        //Try to get an unused annotation, similar to uitableviewcells
        MKAnnotationView *annotationView=[mapView dequeueReusableAnnotationViewWithIdentifier:parkingAnnotationIdentifier];
        //If one isn't available, create a new one
        if(!annotationView){
            annotationView=[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:parkingAnnotationIdentifier];
            //Here's where the magic happens
            annotationView.image=[UIImage imageNamed:@"Icon-Small.png"];
            annotationView.enabled = YES;
        }
        return annotationView;
    }
    else if ([annotation isKindOfClass:[FactionAnnotation class]]) {
        MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"FactionAnnotation"];
        annView.pinColor = MKPinAnnotationColorGreen;
        annView.animatesDrop = TRUE;
        annView.canShowCallout = YES;
        
        [mapView selectAnnotation:annotation animated:YES];
        return annView;
    }
    return nil;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
