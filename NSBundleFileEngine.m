//
//  NSBundleFileEngine.m
//  NSBundleFileEngine
//
//  Created by Prem Kumar on 29/05/12.
//  Copyright (c) 2012 futur.talk@me.com. All rights reserved.
//

#import "NSBundleFileEngine.h"

@implementation NSBundleFileEngine

@synthesize callbackID;

- (void) readPlistFile:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
    self.callbackID = [arguments pop];
    NSString *stringObtainedFromJavascript = [arguments objectAtIndex:0];
//    NSMutableString *strReturnableData = [NSMutableString stringWithString:@""];
    NSString *strReadData = [self getPlistValueForKey:stringObtainedFromJavascript];
    CDVPluginResult* pluginResult;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                     messageAsString:strReadData];
    if (strReadData)
    {
        [self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackID]];
    }
    else
    {
        [self writeJavascript: [pluginResult toErrorCallbackString:self.callbackID]];
    }
}

-(void)writeToPlistFileWithValues:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options{
    NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *strResult;
    CDVPluginResult *pluginResult;
    self.callbackID = [arguments pop];
    @try {
        [infoDict setValue:[options valueForKey:@"value"] forKey:[options valueForKey:@"key"]];
        strResult = [NSString stringWithFormat:@"Value updated for : %@",[options valueForKey:@"key"]];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:strResult];
        [self writeJavascript:[pluginResult toSuccessCallbackString:self.callbackID]];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception writing : %@", exception);
        strResult = @"failed to update";
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:strResult];
        [self writeJavascript:[pluginResult toErrorCallbackString:self.callbackID]];
    }
}

-(NSString*)getPlistValueForKey:(NSString*)strKey{
    NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString* version = [infoDict objectForKey:strKey];
    return (version?version:NULL);
}

@end
