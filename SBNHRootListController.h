#import <Preferences/PSListController.h>
#import <CepheiPrefs/HBRootListController.h>
#import <Cephei/HBPreferences.h>
#import <Foundation/NSUserDefaults.h>
#import "NSTask.h"
#import "JBBulletinManager.h"

@interface SBNHRootListController : PSListController
- (void) generateNotif;
- (void) savx;
@end
