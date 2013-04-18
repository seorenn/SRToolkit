//
//  SRFile.h
//  SRToolkit
//
//  Created by Seorenn
//

#import <Foundation/Foundation.h>

@interface SRFile : NSObject {
    NSFileManager *_sharedFM;
}

@property (copy) NSString *originalPath;
@property (copy) NSString *path;

- (id)initWithPath:(NSString *)path;

- (NSString *)name;
- (NSString *)containerPath;

- (BOOL)hasExtensionName:(NSString *)extName;
- (BOOL)hasExtensionFromNames:(NSArray *)extNames;
- (void)remove;
- (void)renameTo:(NSString *)name;
- (void)moveTo:(NSString *)path;
- (BOOL)isDirectory;
- (BOOL)isFile;
- (BOOL)isHidden;

@end
