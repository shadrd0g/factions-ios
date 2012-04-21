//
//  MainScene.m
//  Factions
//
//  Created by Jeremy Pang on 4/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainScene.h"
#import "HelloWorldLayer.h"

@implementation MainScene

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainScene *layer = [MainScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void)showFactions {
    
}

-(void)viewMap {
    [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer scene]];
}

-(id)init {
    if ( (self = [super init]) ) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCSprite *background = [CCSprite spriteWithFile:@"background.jpg"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:0];
        
        CCSprite *playerImage = [CCSprite spriteWithFile:@"Icon.png"];
        playerImage.position = ccp(50, winSize.height-50);
        [self addChild:playerImage z:10];
        
        CCLabelTTF *name = [CCLabelTTF labelWithString:@"Username" fontName:@"Helvetica" fontSize:20.0];
        name.position = ccp(playerImage.position.x + 45, playerImage.position.y+15);
        name.anchorPoint = ccp(0.0f, 0.5f);
        [self addChild:name z:10];
        
        CCLabelTTF *motto = [CCLabelTTF labelWithString:@"\"My Motto\"" fontName:@"Helvetica" fontSize:15.0];
        motto.anchorPoint = ccp(0.0f, 0.5f);
        motto.position = ccp(name.position.x, name.position.y - 30);
        [self addChild:motto z:10];
        
        CCMenuItemSprite *factionsButton = [CCMenuItemImage itemFromNormalSprite:[CCSprite spriteWithFile:@"buttonWide.png"] selectedSprite:[CCSprite spriteWithFile:@"buttonWide.png"] target:self selector:@selector(showFactions)];
        
        CCLabelTTF *factionsLabel = [CCLabelTTF labelWithString:@"FACTIONS" fontName:@"Helvetica" fontSize:20.0];
        factionsButton.position = ccp(winSize.width/2, 170);
        factionsLabel.position = factionsButton.position;
        [self addChild:factionsLabel z:11];
        
        CCMenuItemSprite *searchButton = [CCMenuItemImage itemFromNormalSprite:[CCSprite spriteWithFile:@"buttonWide.png"] selectedSprite:[CCSprite spriteWithFile:@"buttonWide.png"] target:self selector:@selector(showFactions)];
        CCLabelTTF *searchLabel = [CCLabelTTF labelWithString:@"SEARCH PLAYERS" fontName:@"Helvetica" fontSize:20.0];
        searchButton.position = ccp(winSize.width/2, factionsButton.position.y-factionsButton.contentSize.height-10);
        searchLabel.position = searchButton.position;
        [self addChild:searchLabel z:11];
        
        CCMenuItemSprite *settingsButton = [CCMenuItemImage itemFromNormalSprite:[CCSprite spriteWithFile:@"circleButton.png"] selectedSprite:[CCSprite spriteWithFile:@"circleButton.png"] target:self selector:@selector(showFactions)];
        settingsButton.position = ccp(winSize.width - 25, 25);
        
        CCMenuItemSprite *mapButton = [CCMenuItemImage itemFromNormalSprite:[CCSprite spriteWithFile:@"buttonWide.png"] selectedSprite:[CCSprite spriteWithFile:@"buttonWide.png"] target:self selector:@selector(viewMap)];
        
        CCLabelTTF *mapLabel = [CCLabelTTF labelWithString:@"VIEW MAP" fontName:@"Helvetica" fontSize:20.0];
        mapButton.position = ccp(winSize.width/2, factionsButton.position.y + factionsButton.contentSize.height + 10);
        mapLabel.position = mapButton.position;
        [self addChild:mapLabel z:11];
        
        CCMenu *menu = [CCMenu menuWithItems:factionsButton, searchButton, settingsButton, mapButton, nil];
        menu.position = ccp(0,0);
        [self addChild:menu z:10];
        
        CCSprite *box = [CCSprite spriteWithFile:@"boxBg.png"];
        box.position = ccp(winSize.width/2, winSize.height - 140);
        [self addChild:box z:1];
        
        CCLabelTTF *coins = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Coins: %d", 100] fontName:@"Helvetica" fontSize:15.0];
        coins.anchorPoint = ccp(0.0f, 0.5f);
        coins.position = ccp(25, 25);
        [self addChild:coins z:10];
        
    }
    return self;
}

@end
