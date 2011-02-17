//
//  CollectionController.m
//  Firewood
//
//  Created by Elliot Crosby-McCullough on 17/02/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CollectionController.h"

@implementation CollectionController

@synthesize collectionView, collectionData;

- (void)awakeFromNib {
	NSString *filePath = [self pathToKindleCollectionJSON];
	NSString *fileContent = [[NSString alloc] initWithContentsOfFile:filePath];
	SBJsonParser *parser = [[SBJsonParser alloc] init];

	NSError *jsonErrors = [[NSError alloc] init];
	collectionData = [[parser objectWithString:fileContent error:&jsonErrors] copy];
		
	[parser release], parser = nil;
	[fileContent release], fileContent = nil;
	[jsonErrors release], jsonErrors = nil;
}

- (void)dealloc {
	[collectionData release], collectionData = nil;
	[super dealloc];
}

// Kindle mountpoint identification
- (NSString *)pathToKindleMountPoint {
	NSArray *volumes = [[NSWorkspace sharedWorkspace] mountedRemovableMedia];
	for	(NSString *path in volumes) {
		if ([[NSFileManager defaultManager] fileExistsAtPath:[path stringByAppendingString:@"/system/collections.json"]]) {
			return path;
		}
	}
	return nil;
}
- (NSString *)pathToKindleCollectionJSON {
	return [[self pathToKindleMountPoint] stringByAppendingString:@"/system/collections.json"];
}

// Pipework for the collectionView
- (NSArray *)sortedKeys {
	return [[collectionData allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
	if (item == nil) {
		return [collectionData count];
	} else {
		return [[[collectionData objectForKey:item] objectForKey:@"items"] count];
	}
}
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
	if (item == nil) {
		return ([collectionData count] > 0);
	} else if ([item rangeOfString:@"@en-US"].location == NSNotFound) {
		return false;
	} else {
		return ([[[collectionData objectForKey:item] objectForKey:@"items"] count] > 0);
	}
}
- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
	if (item == nil) {
		return [[self sortedKeys] objectAtIndex:index];
	} else {
		return [[[collectionData objectForKey:item] objectForKey:@"items"] objectAtIndex:index];
	}
}
- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item {
	return [item stringByReplacingOccurrencesOfString:@"@en-US" withString:@""];
}
- (void)outlineView:(NSOutlineView *)outlineView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn byItem:(id)item {
}


@end
