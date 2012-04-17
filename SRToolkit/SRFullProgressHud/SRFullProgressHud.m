//
//  SRFullProgressHud.m
//  SRToolkit
//
//  Created by Seorenn <hirenn@gmail.com>
//

#import "SRFullProgressHud.h"

#define SRFullProgressHudDefaultFontSize    16
#define SRFullProgressHudAnimationDuration  0.3
#define SRFullProgressHudBackgroundColor    [UIColor colorWithWhite:0.0 alpha:0.8]
#define SRFullProgressHudStatusColor        [UIColor whiteColor]
#define SRFullProgressHudGap                4
#define SRFullProgressHudAIWidth            50
#define SRFullProgressHudAIHeight           50

SRFullProgressHud *g_srFullProgressHudInstance = nil;

@implementation SRFullProgressHud

#pragma mark - Life Cycle

- (id)init 
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc
{
    [_view release];
    
    [super dealloc];
}

#pragma mark - Private APIs

+ (SRFullProgressHud *)instance
{
    if (g_srFullProgressHudInstance == nil) {
        g_srFullProgressHudInstance = [[SRFullProgressHud alloc] init];
    }
    return g_srFullProgressHudInstance;
}

- (UIWindow *)appWindow
{
    return [UIApplication sharedApplication].keyWindow;
}

- (void)createProgressViewWithStatus:(NSString *)status
{
    if (_view != nil) return;
    
    _view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _view.backgroundColor = SRFullProgressHudBackgroundColor;
    
    CGFloat hudHeight = SRFullProgressHudAIHeight + SRFullProgressHudGap + SRFullProgressHudDefaultFontSize + SRFullProgressHudGap;
    
    // create activity indicator
    CGRect aiframe = CGRectMake((_view.frame.size.width/2) - (SRFullProgressHudAIWidth/2),
                                (_view.frame.size.height/2) - (hudHeight/2),
                                SRFullProgressHudAIWidth, SRFullProgressHudAIHeight);
    UIActivityIndicatorView *ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    ai.frame = aiframe;
    [ai startAnimating];
    [_view addSubview:ai];
    [ai release];

    // create label
    CGRect lframe = CGRectMake(0, aiframe.origin.y + aiframe.size.height + SRFullProgressHudGap, _view.frame.size.width, SRFullProgressHudGap + SRFullProgressHudDefaultFontSize + SRFullProgressHudGap);
    UILabel *label = [[UILabel alloc] initWithFrame:lframe];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:SRFullProgressHudDefaultFontSize];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = SRFullProgressHudStatusColor;
    label.text = status;
    [_view addSubview:label];
    [label release];
}

- (void)showWithStatus:(NSString *)status
{
    [self createProgressViewWithStatus:status];
    
    _view.alpha = 0.0;
    
    UIWindow *window = [self appWindow];
    [window addSubview:_view];

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:SRFullProgressHudAnimationDuration];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    _view.alpha = 1.0;
    
    [UIView commitAnimations];
}

- (void)hudDismissed
{
    [_view removeFromSuperview];
    [_view release];
    _view = nil;
}

- (void)dismiss
{
    if (_view == nil) return;

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:SRFullProgressHudAnimationDuration];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(hudDismissed)];
    
    _view.alpha = 0.0;
    
    [UIView commitAnimations];
}

#pragma mark - Public APIs

+ (void)showWithStatus:(NSString *)status
{
    [[SRFullProgressHud instance] showWithStatus:status];
}

+ (void)dismiss
{
    [[SRFullProgressHud instance] dismiss];
}


@end
