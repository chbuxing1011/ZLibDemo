//
//  ZLibDemoViewController.m
//  ZLibDemo
//
//  Created by  JM on 11-1-17.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ZLibDemoViewController.h"
#import "zlib.h"
#import "ZipArchive.h"

@implementation ZLibDemoViewController
@synthesize imageView;

- (IBAction)unZip{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"demozipfile.zip" ofType:nil];
    BOOL result;
    ZipArchive *za = [[ZipArchive alloc] init];
    if ([za UnzipOpenFile:filePath]) {
        result = [za UnzipFileTo:[self dataFilePath:@"2011"] overWrite:YES];
        [za UnzipCloseFile];
    }
    [za release];
    if (result) {
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:[self dataFilePath:@"2011/nga_519887.png"]];
        imageView.image = image;
        [image release];
    }
    
}

- (NSString *)dataFilePath:(NSString *)fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
    [super dealloc];
}

@end
