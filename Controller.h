#import <Cocoa/Cocoa.h>
#include "sotoView.h"
@class sotoView;

@interface Controller : NSObject {
	int seconds;

	NSTimer *timer;
    
	IBOutlet id time;
	IBOutlet sotoView *thisSotoView;	
	NSStatusItem *theItem;
}

- (void)updateTime;
- (void)tick:(NSTimer *)timer;
- (void)activateStatusBar;
- (void)updateStatusBar;
- (IBAction)addMinute:(id)sender;
- (IBAction)subtractMinute:(id)sender;
- (IBAction)restart:(id)sender;
- (IBAction)startStop:(id)sender;

@end
