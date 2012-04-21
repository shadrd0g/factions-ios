//
//  CreateAccount.h
//  Factions
//
//  Created by Jeremy Pang on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface CreateAccount : CCScene <UITextFieldDelegate> {
    UITextField *nameField;
    UITextField *mottoNameField;
    UITextField *descriptionField;
}

+(CCScene *)scene;

@end
