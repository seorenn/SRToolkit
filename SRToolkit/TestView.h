//
//  TestView.h
//  SRToolkit
//
//  Created by Seorenn <hirenn@gmail.com>
//

#import <UIKit/UIKit.h>

@interface TestView : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *_items;
    NSTimer *_timer;
    IBOutlet UITableView *_tableView;
}

@end
