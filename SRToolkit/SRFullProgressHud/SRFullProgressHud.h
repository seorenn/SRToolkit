//
//  SRFullProgressHud.h
//  SRToolkit
//
//  Created by Seorenn <hirenn@gmail.com>
//

#import <Foundation/Foundation.h>

@interface SRFullProgressHud : NSObject {
    UIView *_view;
}

+ (void)showWithStatus:(NSString *)status;
+ (void)dismiss;

@end
