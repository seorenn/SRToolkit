//
//  TestView.m
//  SRToolkit
//
//  Created by Seorenn <hirenn@gmail.com>
//

#import "TestView.h"
#import "SRFullProgressHud.h"
#import "DateTimeTestView.h"
#import "SRAlertView.h"

@interface TestView ()

@end

@implementation TestView


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _items = [[NSMutableArray alloc] init];
        [_items addObject:@"SRFullProgressHud Demo"];
        [_items addObject:@"SRDateTime Test"];
        [_items addObject:@"SRAlertView Demo 1"];
        [_items addObject:@"SRAlertView Demo 2"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"SRToolKit Demo";
}

- (void)viewDidUnload
{
    _tableView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)timeout
{
    [SRFullProgressHud dismiss];
}

- (void)timeoutForAlert
{
    if (_alert == nil) return;
    
    [_alert dismiss];
}

- (void)SRFullProgressHudDemo
{
    [SRFullProgressHud showWithStatus:@"Will be dismiss after 3 seconds"];
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeout) userInfo:nil repeats:NO];
}

- (void)SRDateTimeTest
{
    DateTimeTestView *view = [[DateTimeTestView alloc] initWithNibName:@"DateTimeTestView" bundle:nil];
    [self.navigationController pushViewController:view animated:YES];
}

- (void)SRAlertDemo1
{
    _alert = [[SRAlertView alloc] initWithProgressTitle:@"Progressing" cancelText:@"Close" delegate:nil];
    [_alert show];
}

- (void)SRAlertDemo2
{
    _alert = [[SRAlertView alloc] initWithProgressTitle:@"Progressing" cancelText:nil delegate:nil];
    [_alert show];
    _timerForAlert = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeoutForAlert) userInfo:nil repeats:NO];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self SRFullProgressHudDemo];
            break;
        case 1:
            [self SRDateTimeTest];
            break;
        case 2:
            [self SRAlertDemo1];
            break;
        case 3:
            [self SRAlertDemo2];
            break;
        default:
            break;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"testCell";
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    NSString *item = [_items objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item;
    
    return cell;
}


@end
