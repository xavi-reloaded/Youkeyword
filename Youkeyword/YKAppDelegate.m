//
//  YKAppDelegate.m
//  Youkeyword
//
//  Created by apium on 28/12/13.
//  Copyright (c) 2013 apium. All rights reserved.
//

#import "YKAppDelegate.h"
#import "YKNote.h"

@implementation YKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // create some notes!
    self.notes = [NSMutableArray arrayWithArray: @[
            [YKNote noteWithText:@"Luís Alves de Lima e Silva,\r Duke of Caxias (1803–80) was an army officer, politician and monarchist of the Empire of Brazil. politician and monarchist of the Empire of Brazil. He fought against Portugal during the Brazilian War for Independence, and thereafter remained loyal to the emperors Dom Pedro I and his son, Dom Pedro II (to whom he became a friend and instructor in swordsmanship and horsemanship). He commanded forces that put down uprisings from 1839 to 1845, including the Balaiada and the War of the Ragamuffins. He led the Brazilian army to victory in the Platine War against the Argentine Confederation and in the Paraguayan War against the Paraguayans. Caxias was promoted to army marshal, the army's highest rank, and was the only person made a duke during the 58-year reign of Pedro II. A member of the Reactionary Party (which became the Conservative Party), he was elected senator in 1846 and served as president (prime minister) of the Council of Ministers three times. Historians have regarded Caxias in a positive light and several have ranked him as the greatest Brazilian military officer. He has been designated as the army's protector, and is regarded as the most important figure in its tradition."],
            [YKNote noteWithText:@"Ejemplo de texto en español\rbla bla bla esto es un texto que mola mogollón hecho en español"],

    ]];

    // style the navigation bar
    UIColor* navColor = [UIColor colorWithRed:0.175f green:0.458f blue:0.831f alpha:1.0f];
    [[UINavigationBar appearance] setBarTintColor:navColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];

    // make the status bar white
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
