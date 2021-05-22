% PROBLEM DEFINITION:
% You are a pet detective. A lovely parrot is kidnapped! The owner of the parrot hired you. 
% The only clue is the security camera recordings. You’ve analyzed camera recordings and found a
% plate number that led to an address. There are six people living in this house. You’ve arrested
% them all, they are your suspects now.
% Six bags with different colors are found in this house, you don’t know who owns which bag.
% And your suspects deny cooperating. A food item was car- ried in each bag, according to
% “criminal analysis”. However, you are not sure about food items because one of the suspects
% managed to clear them before you arrested them.
% Your goal is to find who committed this horrible crime! For that, you must learn who owns which
% bags, as well as what was the food item that bag.
% As a result of your interrogations, you’ve ended up with some clues. The suspect who
% owns the bag which carried the food item nuts is guilty!

% • Men: Gencer, Can, Rasim. Women: Beyza, Canan, Meryem.
% • Bags: BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag.
% • Food: Avocado, Onion, Nuts, Chocolate, Garlic, Cookies.

% Define The People as Man or Woman
woman(beyza). woman(canan). woman(meryem).
man(gencer). man(can). man(rasim).
% A Person is either man or woman
person(X):- man(X).
person(X):- woman(X).
% Everybody / one / thing is unique
uniqueness(A,B,C,D,E,F):- person(A), person(B), person(C), person(D), person(E), person(F),  \+A=B, \+A=C, \+A=D, \+A=E, \+A=F, \+B=C, \+B=D, \+B=E, \+B=F, \+C=D, \+C=E, \+C=F, \+D=E, \+D=F, \+E=F.

% Last Output Function 
writeanswers(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    write("BlueBag: "), write(BlueBag), nl,
    write("OrangeBag: "), write(OrangeBag), nl,
    write("RedBag: "), write(RedBag), nl,
    write("PurpleBag: "), write(PurpleBag), nl, 
    write("GreenBag: "), write(GreenBag), nl,
    write("YellowBag: "), write(YellowBag), nl, nl,

    write("Avocado: "), write(Avocado), nl,
    write("Onion: "), write(Onion), nl,
    write("Nuts: "), write(Nuts), nl, 
    write("Chocolate: "), write(Chocolate), nl,
    write("Garlic: "), write(Garlic), nl,
    write("Cookies: "), write(Cookies), nl.

% CLUE 1
% - The man who owns the RedBag did not carry Cookies, Chocolate, or Avocado. 
% - Onion was not carried by using RedBag.
clue1(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    man(RedBag),
    \+RedBag=Cookies, \+RedBag=Chocolate, \+RedBag=Avocado, \+RedBag=Onion.

% CLUE 2
% Beyza owns either the YellowBag or the BlueBag; Meryem owns the other.
clue2(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    beyza=YellowBag, meryem=BlueBag.
clue2(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    beyza=BlueBag, meryem=YellowBag.

% CLUE 3
% The person who carried the Avocado, who was not beyza nor gencer, 
% does not own BlueBag nor the OrangeBag.
clue3(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    \+beyza=Avocado, \+gencer=Avocado, 
    \+Avocado=BlueBag, \+Avocado=OrangeBag.

% CLUE 4
% The woman who carried the Cookies owns the YellowBag.
clue4(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    woman(Cookies), Cookies=YellowBag.

% CLUE 5
% The food item carried with PurpleBag belongs to either Can or Gencer.
clue5(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    PurpleBag=can.
clue5(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    PurpleBag=gencer.

% CLUE 6
% The Chocolate was not carried with OrangeBag.
clue6(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    \+Chocolate=OrangeBag.

% CLUE 7
% Meryem did not carry a food item with the YellowBag nor the GreenBag.
clue7(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    \+meryem=YellowBag, \+meryem=GreenBag.

% CLUE 8
% Onion is carried by Gencer.
clue8(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):-
    Onion=gencer.

% CLUE 9
% It was found that Nuts were carried with GreenBag. So the owner of the GreenBag is guilty.
guilty(X):-
    uniqueness(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag),
    uniqueness(Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    
    clue1(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clue2(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clue3(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clue4(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clue5(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clue6(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clue7(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    clue8(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),
    
    X = Nuts, X = GreenBag,
    
    write("Kidnapper is :"), write(X), nl, nl,
    
    writeanswers(BlueBag, OrangeBag, RedBag, PurpleBag, GreenBag, YellowBag, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies).