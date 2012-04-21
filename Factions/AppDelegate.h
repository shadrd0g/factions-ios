//
//  AppDelegate.h
//  Factions
//
//  Created by Jeremy Pang on 4/20/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate, FBSessionDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
    Facebook *facebook;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) Facebook *facebook;

@end
