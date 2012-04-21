#import "MarkerAnnotation.h"

@implementation MyAnnotationClass

@synthesize name = _name;
@synthesize description = _description;
@synthesize coordinate = _coordinate;

-(id) initWithCoordinate:(CLLocationCoordinate2D) coordinate{
    self=[super init];
    if(self){
        _coordinate=coordinate;
    }
    return self;
}

-(void) dealloc{
    self.name = nil;
    self.description = nil;
    [super dealloc];
}
@end