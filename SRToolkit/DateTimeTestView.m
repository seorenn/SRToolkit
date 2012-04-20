//
//  DateTimeTestView.m
//  SRToolkit
//
//  Created by Heeseung Seo on 12. 4. 20..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "DateTimeTestView.h"

@interface DateTimeTestView ()

@end

@implementation DateTimeTestView

- (void)runTest
{
    
}

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
    
    self.title = @"SRDateTime Test";
    
    [self runTest];
}

- (void)viewDidUnload
{
    [_textView release];
    _textView = nil;
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
    [_textView release];
    [super dealloc];
}
@end
