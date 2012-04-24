//
//  TestView.h
//  SRToolkit
//
//  Created by Seorenn <hirenn@gmail.com>
//

#import <UIKit/UIKit.h>
#import "SRAlertView.h"

@interface TestView : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *_items;
    NSTimer *_timer;
    NSTimer *_timerForAlert;
    IBOutlet UITableView *_tableView;
    SRAlertView *_alert;
}

@end
