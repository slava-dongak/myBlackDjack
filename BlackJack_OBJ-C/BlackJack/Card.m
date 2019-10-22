//
//  Card.m
//  BlackJack
//
//  Created by User on 15/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import "Card.h"

@implementation Card

- (instancetype)init{
    self = [super init];
    if (self) {
        _type = arc4random_uniform(13);
        _suit = arc4random_uniform(4);
    }
    return self;
}
- (instancetype)initWithType: (int)t suit:(int)s{
    self = [super init];
    if (self) {
        _type = t;
        _suit = s;
    }
    return self;
}
-(NSString *) suit{
    switch (_suit) {
        case CardSuitHeart:
            return @"Hearth";
        case CardSuitDiamond:
            return @"Diamond";
        case CardSuitClub:
            return @"Club";
        case CardSuitSpade:
            return @"Spade";
        default:
            return @"error";
    }

}
- (NSString *) name {
    switch (_type) {
        case CardType2:
            return @"Two";
        case CardType3:
            return @"Three";
        case CardType4:
            return @"Four";
        case CardType5:
            return @"Five";
        case CardType6:
            return @"Six";
        case CardType7:
            return @"Seven";
        case CardType8:
            return @"Eigth";
        case CardType9:
            return @"Nine";
        case CardType10:
            return @"Ten";
        case CardTypeJack:
            return @"Jack";
        case CardTypeQueen:
            return @"Queen";
        case CardTypeKing:
            return @"King";
        case CardTypeAce:
            return @"Ace";
        default:
            return @"Error";
    }
}
- (NSInteger) score {
    switch (_type) {
        case CardType2:
            return 2;
        case CardType3:
            return 3;
        case CardType4:
            return 4;
        case CardType5:
            return 5;
        case CardType6:
            return 6;
        case CardType7:
            return 7;
        case CardType8:
            return 8;
        case CardType9:
            return 9;
        case CardType10:
            return 10;
        case CardTypeJack:
            return 10;
        case CardTypeQueen:
            return 10;
        case CardTypeKing:
            return 10;
        case CardTypeAce:
            return 11;
            
        default:
            break;
    }
}
- (BOOL) isAce {
    if (_type == CardTypeAce){
        return YES;
    } else return NO;
}
@end


