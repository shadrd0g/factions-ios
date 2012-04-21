//
//  FactionAnnotation.m
//  Factions
//
//  Created by Jeremy Pang on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FactionAnnotation.h"

@implementation FactionAnnotation
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

- (NSString *)subtitle{
    return self.description;
}

- (NSString *)title{
    return self.name;
}

-(void) dealloc{
    self.name = nil;
    self.description = nil;
    [super dealloc];
}

@end
