#import "Controller.h"

@implementation Controller

- (id)init {
	[super init];
	return self;
}

- (void)awakeFromNib {
	[self prepareStringAttributes];
	[self activateStatusBar];
	[self restart:self];
}

- (void)tick:(NSTimer *)timer{
	[self updateTime];
    if (seconds % 60 == 0){
		NSLog(@"%d minutes",seconds/60);
	}
	seconds += 1;
	[self updateStatusBar];
}

- (void)updateTime {
	timeString = [NSString	stringWithFormat:@"%02d:%02d:%02d",
				  (seconds / 3600) % 24,
				  (seconds / 60) % 60,
				  seconds % 60];
	[time setStringValue:timeString];
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
		[stringAttributes setObject:[NSColor blackColor] forKey:NSForegroundColorAttributeName];
		[thisSotoView setIsRunning:YES];
	}
	else {
		NSLog(@"stopping");
		[timer invalidate];
        [timer release];
		timer = nil;
		[stringAttributes setObject:[NSColor grayColor] forKey:NSForegroundColorAttributeName];
		[self updateStatusBar];

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

-(void)prepareStringAttributes {	
	stringAttributes = [[NSMutableDictionary alloc] init];
	[stringAttributes setObject:[NSFont fontWithName:@"Helvetica"  
												size:13] 
						 forKey:NSFontAttributeName];
	[stringAttributes retain];
}

- (void)activateStatusBar {
	NSStatusBar *bar = [NSStatusBar systemStatusBar];
	theItem = [bar statusItemWithLength:NSVariableStatusItemLength];
	[theItem retain];
	[theItem setTarget:self];
	[theItem setAction:@selector(startStop:)];
}

- (void)updateStatusBar {
	attributedTimeString = [[NSAttributedString alloc] initWithString:timeString attributes:stringAttributes];
	[theItem setAttributedTitle:attributedTimeString];
 }
@end
