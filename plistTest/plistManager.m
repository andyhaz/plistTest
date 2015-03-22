//
//  plistManager.m
//  plistTest
//
//  Created by andy hazlett on 11/2/14.
//  Copyright (c) 2014 andy hazlett. All rights reserved.
//

#import "plistManager.h"

@implementation plistManager
//init plist
-(NSString *)intPlist:(NSString*)plistPath {
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:plistPath]; //3
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //check for nil if so place Def plist
    if (![fileManager fileExistsAtPath: path]) //4
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:plistPath ofType:@"plist"]; //5
        
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
     //   NSLog(@"place plist");
    }
    return path;
}
//check dir for update
-(BOOL)checkUpdate:(NSDictionary*)dirA :(NSDictionary*)dirB{
    NSUInteger dirNumA = dirA.count;
    NSUInteger dirNumB = dirB.count;
    if(dirNumA < dirNumB){
        //  NSLog(@"update");
        return true;
    } else {
        return false;
    }
}
//save to info
-(void)savePlist:(NSString*)plistPath :(NSDictionary*)Leveldata {
    NSString *pathComp = [NSString stringWithFormat:@"%@.plist",plistPath];
    // NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:pathComp]; //3
    
    //[data setObject:Leveldata];
    [Leveldata writeToFile:path atomically:YES];
  //  NSLog(@"path:%@ Leveldata %@",path,Leveldata);
    
}

-(void)updatePlist:(NSString*)plistPath :(NSString*)directory :(NSString*)newData :(NSString*)key{
    NSString *pathComp = [NSString stringWithFormat:@"%@.plist",plistPath];

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:pathComp]; //3
    //   NSLog(@"path %@",path);
    
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    
    NSString *levelID = [data valueForKey:directory];
    //replace itme
    [levelID setValue:newData forKey:key];
    //  NSLog(@"levelID %@ newData:%@,Key:%@",levelID,newData,key);
    
    // [path setValue:data forKey:levelID];
    //   NSLog(@"new path %@",path);
    //  NSLog(@"data %@",data);
    
    //[data setObject:leveldata];
    [data writeToFile:path atomically:YES];
}//
//load plstData
-(NSDictionary*)loadPlist:(NSString*)plistPath :(NSString*)directory{
    NSString *pathComp = [NSString stringWithFormat:@"%@.plist",plistPath];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:pathComp]; //3
    //   NSLog(@"path %@",path);
    
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    
    NSDictionary *levelID = [data valueForKey:directory];
    
    return levelID;
    // NSLog(@"loadData %@",levelID);
}

@end
