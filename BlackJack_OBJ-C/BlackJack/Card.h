//
//  Card.h
//  BlackJack
//
//  Created by User on 15/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CardType) {
    CardType2,
    CardType3,
    CardType4,
    CardType5,
    CardType6,
    CardType7,
    CardType8,
    CardType9,
    CardType10,
    CardTypeJack,
    CardTypeQueen,
    CardTypeKing,
    CardTypeAce,
};

typedef NS_ENUM(NSInteger, CardSuit){
    CardSuitHeart,
    CardSuitDiamond,
    CardSuitClub,
    CardSuitSpade
};

@interface Card : NSObject {
    CardType _type;
    CardSuit _suit;
}
- (instancetype)initWithType: (int)t suit:(int)s;
-(NSString *) name;
-(NSString *) suit;
-(NSInteger) score;
- (BOOL) isAce;
@end

NS_ASSUME_NONNULL_END
