//
//  plistManager.h
//  plistTest
//
//  Created by andy hazlett on 11/2/14.
//  Copyright (c) 2014 andy hazlett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface plistManager : NSObject

-(NSString *)intPlist:(NSString*)plistPath;
-(BOOL)checkUpdate:(NSDictionary*)dirA :(NSDictionary*)dirB;
-(void)savePlist:(NSString*)plistPath :(NSDictionary*)Leveldata;
-(void)updatePlist:(NSString*)plistPath :(NSString*)directory :(NSString*)newData :(NSString*)key;
-(NSDictionary*)loadPlist:(NSString*)plistPath :(NSString*)directory;

@end
