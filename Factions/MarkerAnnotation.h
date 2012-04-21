#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotationClass : NSObject <MKAnnotation> {
    NSString *_name;
    NSString *_description;
    CLLocationCoordinate2D _coordinate;
    
    
}
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

-(id) initWithCoordinate:(CLLocationCoordinate2D) coordinate;

@end