//
//  sotoView.m
//
//  Created by Daniel Soto on 11/27/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "sotoView.h"

@implementation sotoView

- (id)initWithFrame:(NSRect)frameRect
{
	if ((self = [super initWithFrame:frameRect]) != nil) {
	}
	return self;
}

- (void)mouseDown:(NSEvent *)event {
	NSLog(@"mouseDown");
	[myController startStop:self];
}

- (void)drawRect:(NSRect)rect
{
	if (isRunning) {
		[[NSColor brownColor] set];		
	}
	if (!isRunning) {
		[[NSColor redColor] set];
	}

	NSRectFill( [self bounds]);
}

- (void)setIsRunning:(bool)is
{
	isRunning = is;
}


@end
