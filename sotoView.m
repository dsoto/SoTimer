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
	//[NSApp sendAction:@selector(restart:) to:myController from:self];
	//[myController restart:self];
}

- (void)drawRect:(NSRect)rect
{
	if (isRunning) {
		[[NSColor greenColor] set];		
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
