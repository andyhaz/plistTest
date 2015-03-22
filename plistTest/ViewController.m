//
//  ViewController.m
//  plistTest
//
//  Created by andy hazlett on 10/24/14.
//  Copyright (c) 2014 andy hazlett. All rights reserved.
//

#import "ViewController.h"
#import "plistManager.h"
@interface ViewController (){
   // NSDictionary *levelData;
}

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //set up
    NSString *plistPath = @"gamelevels.plist";
    plistManager *plistData = [[plistManager alloc]init];
    //place data
    NSString *path = [plistData intPlist:plistPath];
    NSDictionary *levelData = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
 //load data for server download
    NSString *URLplistPath = @"http://gamerocketstudio.com/pufferlevels/downloadTest2.plist";
    NSURL *url = [NSURL URLWithString:URLplistPath];
    NSMutableDictionary  *profileArray = [[NSMutableDictionary alloc] initWithContentsOfURL:url];
    NSLog(@"url %@",profileArray);
    BOOL test = [plistData checkUpdate:levelData :profileArray];
    NSLog(@"test %hhd",test);
    if (test) {
        NSLog(@"update files");
        //save data
        [plistData savePlist:plistPath :profileArray];
    }//
    //save data
 //   [self savePlist:levelData];
//load plist
    NSDictionary *levelDir = [[NSDictionary alloc]init];
    levelDir =  [plistData loadPlist:plistPath :@"levelID:0001"];
    NSLog(@"loadID: %@",levelDir);
    //goet one item
    NSString *item = [levelDir valueForKey:@"healthAmount"];
    NSLog(@"item %@",item);
  
 //   NSString *treasureAmount = [lavelDataStr valueForKey:@"treasureAmount"];
  //  NSLog(@"TrasherAmout:%@",TrasherAmout);
    
//    [self updatePlist:@"levelID:0001" :@"1000" :@"treasureAmount"]; 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
