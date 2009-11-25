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
	seconds = 0;
	isRunning = true;
	[status setStringValue:@"Running"];
	[timer invalidate];
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0
											 target:self
										   selector:@selector(tick)
										   userInfo:NULL
											repeats:YES];
}

// receiver for pause button
- (IBAction)sendPause:(id)sender{
	[self pause];
}

// pauses timer by toggling boolean
- (void)pause{
	isRunning = !isRunning;
	if (isRunning) {
		[status setStringValue:@"Paused"];
	}
	if (!isRunning) {
		[status setStringValue:@"Running"];
	}
}

// increments seconds by one second
// updates time outlet
- (void)tick{
	if (isRunning) {
		[status setStringValue:@"Running"];
		seconds += 1;
		[time setStringValue:
		 [NSString	stringWithFormat:@"%02d:%02d:%02d",
		  (seconds / 3600) % 24,
		  (seconds / 60) % 60,
		  seconds % 60]];	
	}
	if (!isRunning) {
		[status setStringValue:@"Paused"];
	}
    // if we are at a multiple of 60 seconds, write out the seconds
    // to a file for persistence in the case of a crash
    if (seconds % 10 == 1){
		NSLog(@"10 sec tick, with %d seconds",seconds);
	}
}

// adds 60 seconds to time
// updates time outlet
- (IBAction)addMinute:(id)sender {
	seconds += 60;
	[time setStringValue:
	 [NSString	stringWithFormat:@"%02d:%02d:%02d",
	  (seconds / 3600) % 24,
	  (seconds / 60) % 60,
	  seconds % 60]];			
}

// receiver for restart button
- (IBAction)sendRestart:(id)sender {
    [self restart:self];
}


@end
