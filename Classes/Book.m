//
//  Book.m
//  Firewood
//
//  Created by Elliot Crosby-McCullough on 18/02/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Book.h"


@implementation Book

@synthesize path, asid;

-(id)initWithPath:(NSString *)filePath {
	if (self = [super init]) {
		path = filePath;
		[self setASID];
	}
	return self;
}

-(void)setASID {
	NSData *mobiData = [NSData dataWithContentsOfFile:path];

	NSString *mobiHeaderString;
	[mobiData getBytes:*mobiHeaderString range:NSMakeRange(64, 4)];
	NSLog(@"%s", mobiHeaderString);
	
	uint mobiHeaderLength;
	[mobiData getBytes:&mobiHeaderLength range:NSMakeRange(68, 4)];
	mobiHeaderLength = ntohl(mobiHeaderLength);
}

@end
