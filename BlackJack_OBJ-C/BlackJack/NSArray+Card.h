//
//  NSArray+Card.h
//  BlackJack
//
//  Created by User on 17/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Card)
-(NSString *) getCardsName;
-(NSInteger) calcScoreFor;
@end

NS_ASSUME_NONNULL_END
