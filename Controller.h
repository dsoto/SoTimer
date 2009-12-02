#import <Cocoa/Cocoa.h>
#include "sotoView.h"
@class sotoView;

@interface Controller : NSObject {
	int seconds;

	NSTimer *timer;
    
	IBOutlet id time;
	IBOutlet sotoView *thisSotoView;	
}

- (void)updateTime;
- (IBAction)sendRestart:(id)sender;
- (IBAction)addMinute:(id)sender;
- (IBAction)subtractMinute:(id)sender;
- (IBAction)sendPause:(id)sender;
- (void)tick:(NSTimer *)timer;
- (void)restart:(id)sender;
- (void)startStop:(id)sender;

@end
