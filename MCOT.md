# Gestion de l'équilibrage du jeu abalone à l'aide de l'intelligence artificielle.

## Motivation
Cela peut devenir frustrant de perdre des parties de jeux de sociétés dû à un facteur que l'on ne peut pas contrôler comme par exemple l'ordre dans lequel les joueurs jouent qui est souvent choisi aléatoirement.
Bien sûr on pourrait choisir de jouer deux parties où l'on intervertit les rôles, mais ici on supposera que les joueurs sont pressés.
Mon TIPE consistera donc à trouver la configuration de départ la plus équilibrée pour le jeu Abalone.

## Positionnement thématique (par ordre de priorité décroissante)

- MATHEMATIQUES (Mathématiques Appliquées)
- INFORMATIQUE (Informatique Théorique)


## Mots-clés (par ordre de priorité décroissante)

Le choix de 5 mots-clés incite le candidat à **isoler les éléments les plus significatifs de son travail**. Ils doivent être en **cohérence** avec la bibliographie, la problématique et les objectifs choisis par le candidat. Les mots-clés doivent être renseignés dans un ordre décroissant d'importance et permettre de bien cerner le périmètre des recherches.

1. Min max
2. elagage alpha-beta
5.
6.


## Bibliographie commentée (max 650 mots)

Abalone est un jeu de société à deux joueurs disposant de grande variété de règles et de positions initiales. C'est au niveau des positions initiales que mon TIPE porte son intérêt [1].
En effet dans certains jeu, avoir le premier tour et un avantage majeur dans le déroulement de la partie comme avec le Puissance 4 ou le premier joueur peut s'assurer une victoire s'il joue les bons coups.
Mais dans Abalone la multiplicité des positions initiales permet de modifier l'impact de cet ordre donné arbitrairement.
Pour résoudre ce problème on utilisera l'algorithme min_max avec l'élagage alpha-bêta et différentes heuristiques.
Pour évaluer l'équilibrage d'une position initiale nous comparerons le nombre de coups nécessaire pour arriver à une position gagnante en utilisant le même algorithme pour représenter chaque joueur qui seront donc de niveau égale [2] [3].
Mais nous pouvons élargir le problème en considérant différent niveau de joueur symbolisé par la profondeur prise en compte lors de l'exécution de min_max et observer des changements aux niveaux des positions initiales
qui seraient équilibrées pour des joueurs de niveau novice mais avantageuses pour un joueurs de niveau intermédiaire.
(Si il me reste du temps, trouver des positions initiales qui rendraient une partie "serré" entre deux joueurs de niveaux différents)


## Problématique retenue (max 50 mots)

Comment équilibrer le jeu Abalone pour une partie de joueur de niveau équivalent.


## Objectifs du TIPE (max 100 mots)

L'objectif consiste à déterminer s' il existe des positions initiales limitant l'impact de l'ordre du jeu et l'impact de la différence de niveau des joueurs.

## Références bibliographiques (2 à 10 références)

[1] Wikipesia abalone ; https://fr.wikipedia.org/wiki/Abalone_(jeu) 
[2] https://marmelab.com/blog/2022/09/02/coder-une-ia-imbattable-a-abalone.html 
[3] Cours MPI
