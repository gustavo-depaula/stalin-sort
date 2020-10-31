// To compile and run:
// > clang -framework Foundation StalinSort.m -o StalinSort
// > ./StalinSort

#import <Foundation/Foundation.h>

#pragma mark - NSArray Category interface

@interface NSArray<Element> (StalinSort)

-(NSArray<Element> *)stalinSort;

@end

#pragma mark - NSArray Category implementation

@implementation NSArray (Sort)

- (NSArray *)stalinSort {
    NSMutableArray *sortedArray = [NSMutableArray new];
    id max = nil;
    
    for (id element in self) {
        if ([max compare:element] != NSOrderedDescending) {
            max = element;
            [sortedArray addObject:element];
        }
    }
    
    return sortedArray;
}

@end

#pragma mark - Example usage

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray<NSArray *> *inputs = @[
                                       @[],
                                       @[@1, @2, @5, @3, @5, @7],
                                       @[@1.1, @2.2, @5.5, @3.3, @5.5, @7.7],
                                       @[@"a", @"c", @"b", @"f", @"a", @"g"]
                                       ];
        
        for (id input in inputs) {
            NSLog(@"input: %@", input);
            id sorted = [input stalinSort];
            NSLog(@"sorted: %@", sorted);
        }
    }
    return 0;
}
