#import <Cocoa/Cocoa.h>
#include "sotoView.h"

@interface Controller : NSObject {
	int seconds;
	NSTimer *timer;
    IBOutlet id time;
	IBOutlet id status;
	bool isRunning;
	IBOutlet sotoView *thisSotoView;	
}

- (IBAction)sendRestart:(id)sender;
- (void)restart:(id)sender;
- (IBAction)addMinute:(id)sender;
- (IBAction)sendPause:(id)sender;
- (void)startStop:(id)sender;

@end
