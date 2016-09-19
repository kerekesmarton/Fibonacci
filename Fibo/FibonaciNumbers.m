//
//  FibonaciNumber.m
//  Fibo
//
//  Created by Kerekes Jozsef-Marton on 19/09/16.
//  Copyright © 2016 mkerekes. All rights reserved.
//

#import "FibonaciNumbers.h"


@implementation FibonaciNumbers

+ (void)fibonaciNumber:(NSUInteger)number completion:(void(^)(NSInteger))block
{
    
    NSInteger first = 1;
    NSInteger second = 1;
    
    for (int count = 0; count < number; count ++) {
        
        NSInteger temp = second;
        second = first + second;
        first = temp;
    }
    
    block(second);
}
@end
