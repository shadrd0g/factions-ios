//
//  FactionsScene.m
//  Factions
//
//  Created by Jeremy Pang on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FactionsScene.h"

@implementation FactionsScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	FactionsScene *layer = [FactionsScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id)init {
    if ( (self = [super init]) ) {
        
    }
    return self;
}

@end
