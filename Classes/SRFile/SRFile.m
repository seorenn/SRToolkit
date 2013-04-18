//
//  SRFile.m
//  SRToolkit
//
//  Created by Seorenn
//

#import "SRFile.h"

@implementation SRFile

- (id)initWithPath:(NSString *)path
{
    self = [super init];
    if (self) {
        _sharedFM = [NSFileManager defaultManager];
        self.originalPath = path;
        self.path = path;
    }
    return self;
}

- (NSString *)name
{
    if (!self.path) return nil;
    
    return [self.path lastPathComponent];
}

- (NSString *)containerPath
{
    if (!self.path) return nil;
    
    return [self.path stringByDeletingLastPathComponent];
}

- (BOOL)hasExtensionName:(NSString *)extName
{
    if (!self.name) return NO;
    
    NSString *ext = [[self name] pathExtension];
    if ([ext length] <= 0) return NO;
    
    if ([ext isEqualToString:extName]) return YES;
    return NO;
}

- (BOOL)hasExtensionFromNames:(NSArray *)extNames
{
    for (NSString *extName in extNames) {
        if ([self hasExtensionName:extName]) return YES;
    }
    return NO;
}

- (void)remove
{
    if (!self.path || !self.originalPath) return;
    
    NSError *error = nil;
    [_sharedFM removeItemAtPath:self.path error:&error];
    
    if (error) {
        NSLog(@"[SRFile remove] Error: %@", error);
    } else {
        self.path = nil;
        self.originalPath = nil;
    }
}

- (void)renameTo:(NSString *)name
{
    if (!self.path || !self.originalPath) return;

    NSString *path = [[self containerPath] stringByAppendingPathComponent:name];
    [self moveTo:path];
}

- (void)moveTo:(NSString *)path
{
    if (!self.path || !self.originalPath) return;
    
    NSError *error = nil;
    [_sharedFM moveItemAtPath:self.path toPath:path error:&error];

    if (error) {
        NSLog(@"[SRFile moveTo] Error: %@", error);
    }
}

- (BOOL)isDirectory
{
    BOOL isDirectory = NO;
    [_sharedFM fileExistsAtPath:self.path isDirectory:&isDirectory];
    return isDirectory;
}

- (BOOL)isFile
{
    return ![self isDirectory];
}

- (BOOL)isHidden
{
    return [[self name] hasPrefix:@"."];
}

@end
