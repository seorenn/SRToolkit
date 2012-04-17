//
//  AppDelegate.h
//  SRToolkit
//
//  Created by Seorenn <hirenn@gmail.com>
//

#import <UIKit/UIKit.h>
#import "TestView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    TestView *_testView;
}

@property (strong, nonatomic) UIWindow *window;

@end
