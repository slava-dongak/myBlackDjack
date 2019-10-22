//
//  main.m
//  BlackJack
//
//  Created by User on 15/10/2019.
//  Copyright © 2019 User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Game.h"

NSString * getInput(){
    NSFileHandle * input = NSFileHandle.fileHandleWithStandardInput;
    NSData * data = input.availableData;
    return [[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]
            stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString * question;
        NSLog(@"Welcome to BlackJack");

        while (YES)
        {
            
            Game * game  = [Game new];
            [game startGame];
            if ([game iHaveBlackJack]){
                NSLog(@"You have BlackJack");
                NSLog(@"Do you want to play again? y/n");
                question = getInput();
                if([question isEqualToString:@"y"]){
                    continue;
                }
                return 0;
            }
            BOOL result = YES;
            while (result) {
                NSLog(@"Deal new card? y/n");
                NSString * str = getInput();
                
                if ([str isEqualToString:@"y"])
                {
                    [game hitMe];
                    [game printMy];

                    if ([game iHaveMore]){
                        NSLog(@"You have more");
                        NSLog(@"Do you want to play again? y/n");
                        question = getInput();
                        if([question isEqualToString:@"y"]){
                            break;
                        }
                        return 0;
                    }
                }
                if ([str isEqualToString:@"n"]) {
                    BOOL dealerTookCard = [game hitDealer];
                    while (dealerTookCard == YES) {
                        [game printDealer];
                        dealerTookCard = [game hitDealer];
                    }
                    if ([game dealerHasBlackJack]){
                        NSLog(@"Dealer has BlackJack");
                        NSLog(@"Do you want to play again? y/n");
                        question = getInput();
                        if([question isEqualToString:@"y"]){
                            break;
                        }
                        return 0;
                    }
                    if ([game dealerHasMore]){
                        NSLog(@"you won! DealerHasMore");
                        NSLog(@"Do you want to play again? y/n");
                        question = getInput();
                        if([question isEqualToString:@"y"]){
                            break;
                        }
                        return 0;
                    }
                    if ([game scoreEqual]){
                        NSLog(@"Same score");
                        NSLog(@"Do you want to play again? y/n");
                        question = getInput();
                        if([question isEqualToString:@"y"]){
                            break;
                        }
                        return 0;
                    }
                    if ([game iHaveHigherScore]){
                        NSLog(@"You won!");
                        NSLog(@"Do you want to play again? y/n");
                        question = getInput();
                        if([question isEqualToString:@"y"]){
                            break;
                        }
                        return 0;
                    } else {
                        NSLog(@"You busted!");
                        NSLog(@"Do you want to play again? y/n");
                        question = getInput();
                        if([question isEqualToString:@"y"]){
                            break;
                        }
                        return 0;
                    }
                }
            }
        }
    }
    return 0;
}
//dobavit masti
//dobavit pereigrovku
//dobavit ogranichenie kolody
