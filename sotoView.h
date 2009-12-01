//
//  sotoView.h
//
//  Created by Daniel Soto on 11/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Controller.h"
@class Controller;

@interface sotoView :	NSView	
{
	bool isRunning;
	IBOutlet Controller *myController;
}

-(void)setIsRunning:(bool)is;

@end
