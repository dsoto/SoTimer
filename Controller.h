#import <Cocoa/Cocoa.h>

@interface Controller : NSObject {
	int seconds;
	NSTimer *timer;
    IBOutlet id time;
	IBOutlet id status;
	bool isRunning;
}

- (IBAction)sendRestart:(id)sender;
- (IBAction)restart:(id)sender;
- (IBAction)pause;
- (IBAction)addMinute:(id)sender;
- (IBAction)sendPause:(id)sender;

@end
