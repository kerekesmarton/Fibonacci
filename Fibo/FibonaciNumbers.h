//
//  FibonaciNumber.h
//  Fibo
//
//  Created by Kerekes Jozsef-Marton on 19/09/16.
//  Copyright © 2016 mkerekes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FibonaciNumbers : NSObject

///
/// \brief Calculates fibonacci numbers from first to a given \c number.
/// \param number The number to calculate the sequence to.
/// \param block Executed when value is computed.
///
+ (void)fibonaciNumber:(NSUInteger)number completion:(void(^)(NSInteger))block;

@end
