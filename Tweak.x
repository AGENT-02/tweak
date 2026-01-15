#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KittyMemory/KittyMemory.hpp"
#import "KittyMemory/MemoryPatch.hpp"

// --- OFFSETS FROM YOUR ANALYSIS ---
#define OFFSET_RADAR        0x101400004 //
#define OFFSET_VISIBILITY   0x101667c08 //
#define OFFSET_REPORT_GATE  0x1086d8ad0 //

// --- UDID LOGIC ---
void copyNewUDID() {
    NSString *chars = @"abcdef0123456789";
    NSMutableString *res = [NSMutableString stringWithCapacity:40];
    for (int i=0; i<40; i++) {
        [res appendFormat: @"%C", [chars characterAtIndex: arc4random_uniform(16)]];
    }
    [UIPasteboard generalPasteboard].string = res;
}

// --- STEALTH PATCHER ---
void ApplyPatches() {
    // Kill the report gate (733 triggers)
    MemoryPatch::createWithHex(OFFSET_REPORT_GATE, "C0035FD6").Modify();
    
    // Mini-map Radar Bypass
    MemoryPatch::createWithHex(OFFSET_RADAR, "C0035FD6").Modify();
    
    // Visibility/Wall-check Bypass
    MemoryPatch::createWithHex(OFFSET_VISIBILITY, "1F2003D5").Modify();
}

%ctor {
    // Wait for game security to stabilize
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        ApplyPatches();
    });
}