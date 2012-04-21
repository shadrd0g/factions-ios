//
//  CreateAccount.m
//  Factions
//
//  Created by Jeremy Pang on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreateAccount.h"
#import "MainScene.h"

@implementation CreateAccount

+(CCScene *)scene {
    // 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	CreateAccount *layer = [CreateAccount node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void)submit {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://facebook.glentakahashi.com:8080/signup/%@/%@/%@/%@/", [defaults objectForKey:@"FBAccessTokenKey"], [nameField text], [mottoNameField text], [descriptionField text]]]];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [[CCDirector sharedDirector] replaceScene:[MainScene scene]];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Success handling here
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Error handling here
}


-(id)init {
    if ( (self = [super init]) ) {
        CGSize winSize = [CCDirector sharedDirector].winSize;
        CCSprite *background = [CCSprite spriteWithFile:@"background.jpg"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background z:0];
        [self specifyStartLevel];
        [nameField becomeFirstResponder];
        
        CCMenuItemSprite *submit = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"submitButton.png"] selectedSprite:[CCSprite spriteWithFile:@"submitButton.png"] target:self selector:@selector(submit)];
        submit.position = ccp(250, 260);
        CCMenu *menu = [CCMenu menuWithItems:submit, nil];
        [self addChild:menu z:10];
        menu.position = CGPointZero;
        
        CCSprite *box1 = [CCSprite spriteWithFile:@"textbg.png"];
        box1.position = ccp(winSize.width/2, 400);
        [self addChild:box1 z:2];
        CCSprite *box2 = [CCSprite spriteWithFile:@"textbg.png"];
        box2.position = ccp(winSize.width/2, 360);
        [self addChild:box2 z:2];
        CCSprite *box3 = [CCSprite spriteWithFile:@"textbg.png"];
        box3.position = ccp(winSize.width/2, 320);
        [self addChild:box3 z:2];
    }
    
    return self;
}



-(void)specifyStartLevel {
    nameField = [[UITextField alloc] initWithFrame:CGRectMake(60, 70, 200, 30)];
    nameField.font = [UIFont fontWithName:@"Arial" size:15];
    nameField.autocorrectionType = UITextAutocorrectionTypeNo;
    [nameField setDelegate:self];
    [nameField setText:@"Name"];
    [nameField setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0]];
    [[[[CCDirector sharedDirector] openGLView] window] addSubview:nameField];
    
    mottoNameField = [[UITextField alloc] initWithFrame:CGRectMake(60, 110, 200, 30)];
    mottoNameField.font = [UIFont fontWithName:@"Arial" size:15];
    mottoNameField.autocorrectionType = UITextAutocorrectionTypeNo;
    [mottoNameField setDelegate:self];
    [mottoNameField setText:@"Motto"];
    [mottoNameField setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0]];
    [[[[CCDirector sharedDirector] openGLView] window] addSubview:mottoNameField];
    
    descriptionField = [[UITextField alloc] initWithFrame:CGRectMake(60, 150, 200, 30)];
    descriptionField.font = [UIFont fontWithName:@"Arial" size:15];
    descriptionField.autocorrectionType = UITextAutocorrectionTypeNo;
    [descriptionField setDelegate:self];
    [descriptionField setText:@"Description"];
    [descriptionField setTextColor: [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0]];
    [[[[CCDirector sharedDirector] openGLView] window] addSubview:descriptionField];
}



-(void) dealloc
{
    [super dealloc];
}


@end
