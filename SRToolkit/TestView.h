//
//  TestView.h
//  SRToolkit
//
//  Created by Seorenn <hirenn@gmail.com>
//

#import <UIKit/UIKit.h>

@interface TestView : UIViewController {
    NSTimer *_timer;
}

- (IBAction)pressedSRFullProgressHud:(id)sender;
- (IBAction)pressedDismissAllButton:(id)sender;


@end
