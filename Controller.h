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
- (void)tick:(NSTimer *)timer;

- (IBAction)addMinute:(id)sender;
- (IBAction)subtractMinute:(id)sender;
- (IBAction)restart:(id)sender;
- (IBAction)startStop:(id)sender;

@end
