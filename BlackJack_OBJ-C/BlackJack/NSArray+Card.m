//
//  NSArray+Card.m
//  BlackJack
//
//  Created by User on 17/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import "NSArray+Card.h"
#import "Card.h"

@implementation NSArray(Card)

-(NSString *) getCardsName{
    
    NSMutableString * cardNames = [[NSMutableString alloc] init];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Card * card = obj;
        [cardNames appendString:[card name]];
        [cardNames appendString:@"-"];
        [cardNames appendString:[card suit]];
        [cardNames appendString:@"; "];
    }];
    
    return cardNames;
}

-(NSInteger) calcScoreFor{
    __block NSInteger score = 0;
    __block NSInteger aceCount = 0;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Card * card = obj;
        score += [card score];
        if([card isAce]){
            score += [card score];
        }
    }];
    
    
    while (aceCount > 0 && score > 21){
        score -=10;
        aceCount--;
    }
    
    return score;
}

@end
