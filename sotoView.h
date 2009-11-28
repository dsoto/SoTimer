//
//  sotoView.h
//
//  Created by Daniel Soto on 11/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface sotoView :	NSView	
{
	bool isRunning;
}

-(void)setIsRunning:(bool)is;
-(void)setBlue;

@end
