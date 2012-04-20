//
//  DateTimeTestView.m
//  SRToolkit
//
//  Created by Heeseung Seo on 12. 4. 20..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "DateTimeTestView.h"
#import "SRDateTime.h"

@interface DateTimeTestView ()

@end

@implementation DateTimeTestView

- (void)runTest
{
    NSString *result = @"";
    
    NSDate *now = [NSDate date];
    result = [result stringByAppendingFormat:@"[NSDate date] = %@\n\n", now];
    
    SRDateTime *dt = [SRDateTime dateTimeFromNSDate:now];
    result = [result stringByAppendingFormat:@"SRDateTime.year = %d\n", dt.year];
    result = [result stringByAppendingFormat:@"SRDateTime.month = %d\n", dt.month];
    result = [result stringByAppendingFormat:@"SRDateTime.day = %d\n", dt.day];
    result = [result stringByAppendingFormat:@"SRDateTime.hour = %d\n", dt.hour];
    result = [result stringByAppendingFormat:@"SRDateTime.minute = %d\n", dt.minute];
    result = [result stringByAppendingFormat:@"SRDateTime.second = %d\n\n", dt.second];
    
    NSDate *convdt = [dt nsDate];
    result = [result stringByAppendingFormat:@"Convert SRDateTime to NSDate = %@\n\n", convdt];
    
    if ([now isEqualToDate:now]) {
        result = [result stringByAppendingString:@"Converted NSDate object value is same with original"];
    }
    else {
        result = [result stringByAppendingString:@"Converted NSDate object value is not same with original"];
    }
    
    _textView.text = result;
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
