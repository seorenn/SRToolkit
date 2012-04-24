//
//  SRAlert.m
//  SRToolkit
//
//  Created by Heeseung Seo on 12. 4. 24..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "SRAlertView.h"

@implementation SRAlertView

- (id)initWithProgressTitle:(NSString *)title cancelText:(NSString *)cancelText delegate:(id<UIAlertViewDelegate>)delegate
{
    self = [super init];
    if (self) {
        CGFloat indy = 40;
        
        if (title) {
            self.title = title;
        }
        
        if (cancelText) {
            [self addButtonWithTitle:cancelText];
        } else {
            indy = 60;
        }
        
        if (delegate) {
            self.delegate = delegate;
        }
        
        self.message = @"\n\n";    // make space for activity indicator
        
        UIActivityIndicatorView *ind = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        ind.frame = CGRectMake(120, indy, 50, 50);
        [ind startAnimating];
        
        [self addSubview:ind];
        [ind release];
    }
    
    return self;
}

- (void)dismiss
{
    [self dismissWithClickedButtonIndex:0 animated:YES];
}

@end
