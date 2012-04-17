//
//  TestView.m
//  SRToolkit
//
//  Created by Seorenn <hirenn@gmail.com>
//

#import "TestView.h"
#import "SRFullProgressHud.h"

@interface TestView ()

@end

@implementation TestView


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc 
{
    [super dealloc];
}

- (void)timeout
{
    [SRFullProgressHud dismiss];
}

- (IBAction)pressedSRFullProgressHud:(id)sender 
{
    [SRFullProgressHud showWithStatus:@"Will be dismiss after 3 seconds"];
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeout) userInfo:nil repeats:NO];
}

- (IBAction)pressedDismissAllButton:(id)sender 
{
    [SRFullProgressHud dismiss];
}
@end
