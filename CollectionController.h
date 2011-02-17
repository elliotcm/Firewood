//
//  CollectionController.h
//  Firewood
//
//  Created by Elliot Crosby-McCullough on 17/02/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"

@interface CollectionController : NSObject {
	NSOutlineView *collectionView;
	NSMutableDictionary *collectionData;
}

@property (assign) IBOutlet NSOutlineView *collectionView;
@property (copy, readwrite) NSMutableDictionary *collectionData;

- (NSString *)pathToKindleCollectionJSON;

@end
