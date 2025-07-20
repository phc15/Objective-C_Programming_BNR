//
//  Document.h
//  TahDoodle
//
//  Created by Pei-Han Chao on 9/22/21.
//

#import <Cocoa/Cocoa.h>

@interface Document : NSDocument
<NSTableViewDataSource>

@property (nonatomic) IBOutlet NSTableView *taskTable;

// store task to an array
@property (nonatomic) NSMutableArray *tasks;

// by performing add task method
- (IBAction)addTask:(id)sender;

@end

