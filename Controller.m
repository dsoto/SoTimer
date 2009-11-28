#import "Controller.h"

@implementation Controller

- (id)init {
	[super init];
	return self;
}

-(void)awakeFromNib {
	[self restart:self];
}

-(void)restart:(id)sender{
	NSLog(@"restart");
	seconds = 0;
	if (timer != nil) {
		[timer invalidate];
		[timer release];
		timer = nil;
	}
	[self startStop:self];
}

- (IBAction)startStop:(id)sender {
	NSLog(@"startStop");
	if (timer == nil) {
		NSLog(@"starting");
		timer = [[NSTimer scheduledTimerWithTimeInterval:1.0
												 target:self
											   selector:@selector(tick:)
											   userInfo:NULL
												repeats:YES]retain];
		[thisSotoView setIsRunning:YES];
	}
	else {
		NSLog(@"stopping");
		[timer invalidate];
        [timer release];
		timer = nil;
		[thisSotoView setIsRunning:NO];
	}
	[thisSotoView setNeedsDisplay:YES];
}

// receiver for pause button
- (IBAction)sendPause:(id)sender{
	NSLog(@"sendPause");
	[self startStop:self];
}


// increments seconds by one second
// updates time outlet
- (void)tick:(NSTimer *)timer{
	// NSLog(@"tick");
	[time setStringValue:
		 [NSString	stringWithFormat:@"%02d:%02d:%02d",
		  (seconds / 3600) % 24,
		  (seconds / 60) % 60,
		  seconds % 60]];	
    // if we are at a multiple of 60 seconds, write out the seconds
    // to a file for persistence in the case of a crash
    if (seconds % 60 == 0){
		NSLog(@"%d minutes",seconds/60);
	}
	seconds += 1;
}

// adds 60 seconds to time
// updates time outlet
- (IBAction)addMinute:(id)sender {
	NSLog(@"addMinute");
	seconds += 60;
	[time setStringValue:
	 [NSString	stringWithFormat:@"%02d:%02d:%02d",
	  (seconds / 3600) % 24,
	  (seconds / 60) % 60,
	  seconds % 60]];			
}

// receiver for restart button
- (IBAction)sendRestart:(id)sender {
	NSLog(@"sendRestart");
    [self restart:self];
}


@end
