#import "Controller.h"

@implementation Controller

- (id)init {
	[super init];
	return self;
}

- (void)awakeFromNib {
	[self activateStatusBar];
	[self restart:self];
}

- (void)tick:(NSTimer *)timer{
	// NSLog(@"tick");
	[self updateTime];
    if (seconds % 60 == 0){
		NSLog(@"%d minutes",seconds/60);
	}
	seconds += 1;
	[self updateStatusBar];
}

- (void)updateTime {
	[time setStringValue:
	 [NSString	stringWithFormat:@"%02d:%02d:%02d",
	  (seconds / 3600) % 24,
	  (seconds / 60) % 60,
	  seconds % 60]];				
}

- (IBAction)restart:(id)sender{
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

- (IBAction)addMinute:(id)sender {
	NSLog(@"addMinute");
	seconds += 60;
	[self updateTime];			
}

- (IBAction)subtractMinute:(id)sender {
	NSLog(@"subtractMinute");
	seconds -= 60;
	[self updateTime];
}

- (void)activateStatusBar
{
	NSStatusBar *bar = [NSStatusBar systemStatusBar];
	
	theItem = [bar statusItemWithLength:NSVariableStatusItemLength];
	[theItem retain];
	[theItem setTarget:self];
	[theItem setAction:@selector(startStop:)];
	}

- (void)updateStatusBar {
	[theItem setTitle:[NSString	stringWithFormat:@"%02d:%02d:%02d",
					   (seconds / 3600) % 24,
					   (seconds / 60) % 60,
					   seconds % 60]];	
}
@end
