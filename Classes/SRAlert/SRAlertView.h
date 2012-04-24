//
//  SRAlert.h
//  SRToolkit
//
//  Created by Heeseung Seo on 12. 4. 24..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRAlertView : UIAlertView

- (id)initWithProgressTitle:(NSString *)title cancelText:(NSString *)cancelText delegate:(id<UIAlertViewDelegate>)delegate;

- (void)dismiss;

@end
