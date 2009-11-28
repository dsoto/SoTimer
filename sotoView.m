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

//- (void)setRed:(NSRect)rect
- (void)setIsRunning:(bool)is
{
	isRunning = is;
}

- (void)setBlue
{
	isRunning = TRUE;
}

@end
