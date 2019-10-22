//
//  Game.m
//  BlackJack
//
//  Created by User on 15/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import "Game.h"
#import "Card.h"
#import "NSArray+Card.h"


@interface Game ()

-(NSString *) getCardName: (NSArray *) cards;
-(NSInteger) calcScorFor: (NSArray *) cards;

@end

@implementation Game

- (instancetype)init {
    self = [super init];
    if (self){
        _myCards = [NSMutableArray new];
        _dealerCards = [NSMutableArray new];
        _deck = [NSMutableArray new];
        _drop_cards = 3;
    }
    return self;
}

-(void) startGame{
    for(int i = 0; i < 13; i++){
        for(int j = 0; j<4; j++){
            Card * card1 = [[Card alloc] initWithType:i suit:j];
            [_deck addObject:card1];
        }
    }
    for (int i = 0; i < _deck.count; i++) {
        int random1 = arc4random() % [_deck count];
        int random2 = arc4random() % [_deck count];
        [_deck exchangeObjectAtIndex:random1 withObjectAtIndex:random2];
    }
    Card * card1 = _deck[_deck.count - 1];
    Card * card2 = _deck[_deck.count - 2];
    Card * card3 = _deck[_deck.count - 3];
    [_myCards addObjectsFromArray:@[card1, card2]];
    [_dealerCards addObject:card3];
    [self printMy];
    [self printDealer];
}

-(void) hitMe{
    _drop_cards++;
    Card * newCard = _deck[_deck.count - _drop_cards];
    [self.myCards addObject:newCard];
    //[self.dropedCards addObject:newCard];
}

-(BOOL) hitDealer{
    NSInteger dealerScore = [self calcScoreFor:self.dealerCards];
    if(dealerScore > 17){
        return NO;
    }
    _drop_cards++;
    Card * newCard = _deck[_deck.count - _drop_cards];
    [self.dealerCards addObject:newCard];
    return YES;
}

-(BOOL) dealerHasMore {
    NSInteger dealerScore = [self calcScoreFor:self.dealerCards];
    if (dealerScore > 21){
        return YES;
    }
    return NO;
}

-(BOOL) iHaveMore {
    NSInteger myScore = [self calcScoreFor:self.myCards];{
        if (myScore > 21){
            return YES;
        }
        return NO;
    }
}

-(BOOL) iHaveBlackJack {
    NSInteger myScore = [self calcScoreFor:self.myCards];
    if(myScore == 21){
        return YES;
    }
    return NO;
}

-(BOOL) dealerHasBlackJack{
    NSInteger dealerScore = [self calcScoreFor:self.myCards];
    if(dealerScore == 21){
        return YES;
    }
    return NO;
}


-(BOOL) iHaveHigherScore {
    NSInteger dealerScore = [self calcScoreFor:self.dealerCards];
    NSInteger myScore = [self calcScoreFor:self.myCards];
    if (dealerScore < myScore) {
        return YES;
    }
    return NO;
}

-(BOOL)scoreEqual{
    NSInteger dealerScore = [self calcScoreFor:self.dealerCards];
    NSInteger myScore = [self calcScoreFor:self.myCards];
    if(dealerScore==myScore){
        return YES;
    }
    return NO;
}
-(void) printMy{
    NSLog(@"You have %@", [self getCardName:self.myCards]);
}

-(void) printDealer{
    NSLog(@"dealer has %@", [self getCardName:self.dealerCards]);
}

-(NSString *) getCardName:(NSArray *) cards{
    return [cards getCardsName];
}

-(NSInteger) calcScoreFor:(NSArray *) cards{
    return [cards calcScoreFor];
}
/*
-(NSString *) getCardNames:(NSArray *)cards {
//    NSMutableArray
    
    [self enumerateObjectsUsingBlock:^(id _Nonull obj, NSUInteger idx, BOOL * _Nonull stop){
        Card * card = obj;
        [cardNames appendString:[card Name]];
        [cardNames appendString:@""];
    }]
    return cardNames;
}
-(NSInteger) calcScoreFor {
    __block NSInteger score = 0;
    __block NSInteger aceCount = 0;
    
    [self enumerateObjectsUsingBlock:^(id _Nonull obj, NSUInteger idx, BOOL * _Nonull stop){
        Card * card = obj;
        [cardNames appendString:[card Name]];
        [cardNames appendString:@""];
    }]
    
    
    for (Card * card in self) {
        score += [card score];
        if ([card isAce]){
            aceCount++;
        }
    }
}
*/
@end
