//
//  FirewoodAppDelegate.m
//  Firewood
//
//  Created by Elliot Crosby-McCullough on 17/02/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirewoodAppDelegate.h"

@implementation FirewoodAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	[[Book alloc] initWithPath:@"/Volumes/Kindle/documents/How I Escaped My Certain Fate - Stewart Lee.mobi"];
}

@end
