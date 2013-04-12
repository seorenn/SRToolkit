//
//  SRFile.h
//  TableViewTest
//
//  Created by Heeseung Seo on 13. 3. 25..
//  Copyright (c) 2013년 Heeseung Seo. All rights reserved.
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
