//
//  FirewoodAppDelegate.h
//  Firewood
//
//  Created by Elliot Crosby-McCullough on 17/02/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FirewoodAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
