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
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *subText;
@property (strong, nonatomic) NSString *exit;
@property (strong, nonatomic) NSString *display;
@property (strong, nonatomic) NSAlert *alert;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.iconify = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    [_iconify setAction:@selector(itemClicked:)];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath: @"/Library/Application Support/Iconify/iconify.png"])
    {
        _iconify.image = [[NSImage alloc] initWithContentsOfFile: @"/Library/Application Support/Iconify/iconify.png"];
    }
    
    if ([fileManager fileExistsAtPath: @"/Library/Application Support/Iconify/settings.plist"])
    {
        _settings = [[NSDictionary alloc] initWithContentsOfFile: @"/Library/Application Support/Iconify/settings.plist"];
        _iconify.toolTip = [_settings objectForKey:@"Tooltip"];
        _text = [_settings objectForKey:@"Text"];
        _subText = [_settings objectForKey:@"Subtext"];
        _display = [_settings objectForKey:@"Display"];
        _exit = [_settings objectForKey:@"Exit"];;
    }
    
    [_iconify.image setTemplate:YES];
    
    _iconify.highlightMode = NO;
    
    _alert = [[NSAlert alloc] init];
    [_alert setMessageText: _text];
    [_alert setInformativeText: _subText];
    [_alert addButtonWithTitle: @"Ok"];
    
    if ([fileManager fileExistsAtPath: @"/Library/Application Support/Iconify/iconify_large.png"])
    {
        [_alert setIcon: [[NSImage alloc] initWithContentsOfFile: @"/Library/Application Support/Iconify/iconify_large.png"]];
    }
    
}

- (void)itemClicked:(id)sender
{
    NSEvent *event = [NSApp currentEvent];
    if([event modifierFlags] & NSEventModifierFlagControl)
    {
        if([_exit  isEqual: @"TRUE"])
        {
            [[NSApplication sharedApplication] terminate:self];
            return;
        }
    }
    
    if([_display  isEqual: @"TRUE"])
        [_alert runModal];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
}


@end
