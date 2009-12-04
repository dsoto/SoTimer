#import <Cocoa/Cocoa.h>
#include "sotoView.h"
@class sotoView;

@interface Controller : NSObject {
	// object to hold seconds elapsed
	int seconds;
	// timer to control screen refresh and addition of seconds
	NSTimer *timer;
    // pointer to NSTextField object
	IBOutlet id time;
	// string to hold seconds in readable format
	NSString *timeString;
	// time string but with attributes for NSStatusItem
	NSAttributedString *attributedTimeString;
	// dictionary of attributes for attributedTimeString
	NSMutableDictionary *stringAttributes;
	// pointer to colored box on main window
	IBOutlet sotoView *thisSotoView;	
	// menu bar status item object
	NSStatusItem *theItem;

}

- (void)prepareStringAttributes;
- (void)updateTime;
- (void)tick:(NSTimer *)timer;
- (void)activateStatusBar;
- (void)updateStatusBar;
- (IBAction)addMinute:(id)sender;
- (IBAction)subtractMinute:(id)sender;
- (IBAction)restart:(id)sender;
- (IBAction)startStop:(id)sender;

@end
