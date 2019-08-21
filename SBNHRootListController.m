#include "SBNHRootListController.h"
#import "NSTask.h"
#import "AppList.h"
#import <objc/runtime.h>
#import <Foundation/NSUserDefaults.h>
#include <CoreFoundation/CoreFoundation.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>

@implementation SBNHRootListController

// init
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

// The main function to generate fake notifications
- (void) generateNotif {
    // save input
    [self savx];
    // inits
    NSMutableString *bid; /* = [NSMutableString stringWithString:@"com.apple.MobileSMS"];*/
    NSMutableString *title; /* = [NSMutableString stringWithString:@"Craig Frederighi"];*/
    NSMutableString *subtitle; /* = [NSMutableString stringWithString:@"RE: Apple Interview"];*/
    NSMutableString *message; /* = [NSMutableString stringWithString:@"You're Hired!"];*/

    // access the now saved prefs via NSUserDefaults and set the vars
    NSUserDefaults *prefs;
    prefs = [[NSUserDefaults alloc] initWithSuiteName:@"de.saadat603.notificationhelper"];
    bid = [prefs objectForKey:@"k_bid"] ? [prefs objectForKey:@"k_bid"] : bid;
    title = [prefs objectForKey:@"k_title"] ? [prefs objectForKey:@"k_title"] : title;
    subtitle = [prefs objectForKey:@"k_subtitle"] ? [prefs objectForKey:@"k_subtitle"] : subtitle;
    message = [prefs objectForKey:@"k_message"] ? [prefs objectForKey:@"k_message"] : message;

		// Execute now with NSTask  --kudos to @NepetaDev for NSTask.h
		
		NSTask *t = [[NSTask alloc] init];
    [t setLaunchPath:@"/usr/bin/stb"];
    [t setArguments:[NSArray arrayWithObjects:@"-b",bid, @"-t", title, @"-s", subtitle, @"-m", message, nil]];
    [t launch];
		
    //fin.
}


// save current input
- (void) savx {
    [self.view endEditing:YES];
    //fin.
}
//fin.
@end
