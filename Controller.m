#import "Controller.h"

@implementation Controller

- (id)init {
	[super init];
	return self;
}

-(void)awakeFromNib {
	[self restart:self];
}

// reset seconds to zero
// release previous timer
// set timer to call tick every second
- (IBAction)restart:(id)sender {
	NSLog(@"restart");
	seconds = 0;
	isRunning = TRUE;
	[thisSotoView setIsRunning:isRunning];
	[thisSotoView setNeedsDisplay:YES];
	[timer invalidate];
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0
											 target:self
										   selector:@selector(tick:)
										   userInfo:NULL
											repeats:YES];
}

// receiver for pause button
- (IBAction)sendPause:(id)sender{
	NSLog(@"sendPause");
	[self pause];
}

// pauses timer by toggling boolean
- (void)pause{
	NSLog(@"Play/Pause");
	isRunning = !isRunning;
	[thisSotoView setIsRunning:isRunning];
	[thisSotoView setNeedsDisplay:YES];
}

// increments seconds by one second
// updates time outlet
- (void)tick:(NSTimer *)timer{
	NSLog(@"tick");
	if (isRunning) {
		seconds += 1;
		[time setStringValue:
		 [NSString	stringWithFormat:@"%02d:%02d:%02d",
		  (seconds / 3600) % 24,
		  (seconds / 60) % 60,
		  seconds % 60]];	
	}
    // if we are at a multiple of 60 seconds, write out the seconds
    // to a file for persistence in the case of a crash
    if (seconds % 60 == 0){
		NSLog(@"%d minutes",seconds/60);
	}
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
