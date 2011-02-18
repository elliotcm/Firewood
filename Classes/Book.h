//
//  Book.h
//  Firewood
//
//  Created by Elliot Crosby-McCullough on 18/02/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Book : NSObject {
}

@property(copy, readwrite) NSString *path;
@property(copy, readwrite) NSString *asid;

-(id)initWithPath:(NSString *)path;
-(void)setASID;

@end
