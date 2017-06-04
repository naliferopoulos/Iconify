//
//  AppDelegate.m
//  Iconify
//
//  Created by Nick Aliferopoulos on 04/06/2017.
//  Copyright © 2017 Nick Aliferopoulos. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (strong, nonatomic) NSStatusItem *iconify;
@property (strong, nonatomic) NSDictionary *settings;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.iconify = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath: @"/Library/Application Support/Iconify/iconify.png"])
    {
        _iconify.image = [[NSImage alloc] initWithContentsOfFile: @"/Library/Application Support/Iconify/iconify.png"];
    }
    
    if ([fileManager fileExistsAtPath: @"/Library/Application Support/Iconify/settings.plist"])
    {
        _settings = [[NSDictionary alloc] initWithContentsOfFile: @"/Library/Application Support/Iconify/settings.plist"];
        _iconify.toolTip = [_settings objectForKey:@"Text"];
    }
    
    [_iconify.image setTemplate:YES];
    
    _iconify.highlightMode = NO;
    
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification
{
}


@end
