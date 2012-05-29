//
//  NSBundleFileEngine.h
//  NSBundleFileEngine
//
//  Created by Prem Kumar on 29/05/12.
//  Copyright (c) 2012 futur.talk@me.com. All rights reserved.
//

#import <Cordova/CDVPlugin.h>

@interface NSBundleFileEngine : CDVPlugin
{
    NSString* callbackID;  
}

@property (nonatomic, copy) NSString* callbackID;

- (void) readPlistFile:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
-(NSString*)getPlistValueForKey:(NSString*)strKey;

@end
