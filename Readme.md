Dataset : Fish

On charge les données
On enlève les lignes avec des valeurs vides
On sépare le dataset original en deux datasets, un de training(80%) et un de test(20%)

On commence la phase de pre-processing
Avant toute manipulation sur le dataset, on entame une phase d'analyse poussée afin d'appliquer les opérations de manière intelligente et non pas de manière aléatoire

Pour cela, on commence par regarder et comprendre le dataset dont on dispose
On commence par analyser les types de variables à notre disposition.
Nous disposons de trois variables de prédictions : Weight, Height et Width.
Ces trois variables sont numériques continues
Nous disposons également d'une variable résultat : Species
Cette variable est quant à elle binaire, soit à valeur dans {0,1}

Au vu de ces informations, nous décidons d'écarter la régression linéaire car elle n'est pas adaptée pour déterminer une variable résultat binaire.
Nous décidons donc de partir sur une régression logistique, plus adapté à la situation.

Après cela, nous déterminons les coefficients de corrélation entre les variables de prediction et la variable résultat.
On observe très clairement que la p-value de la variable Width est grande. On en conclut donc qu'elle n'est pas significative. On ne l'incluera donc pas dans l'apprentissage de notre modèle, cela pourrait être nefaste sur la prédiction.

Suite à cela, on récupère et analyse certaines mesures comme l'écart-type et la moyenne de nos colonnes
À ce moment-là, on observe une grande disparité entre la variable Weight et la variable Height. Cela peut tromper notre modèle, en accordant un poids plus important à la variable Weight car elle dispose de valeurs plus importantes.
Pour faire face à ce problème, nous décidons de standardiser ces deux variables de sorte à ce qu'elles aient toutes deux une moyenne de 0 et une variance de 1.

Ensuite, nous regardons si notre dataset de training suffisament équilibré. C'est à dire, si il y a une assez bonne répartitions entre les données sur l'espèce de poissons considéré et les autres. Si ce n'est pas le cas, cela peut potentiellement impacter le modèle, d'autant plus que le dataset à notre disposition n'est pas forcément de grande taille. Cependant, nous constatons que la répartition de notre dataset est bien équilibrée, il n'y a donc pas d'opération à faire de ce coté-là.

La phase de pre-processing est à présent terminée.
Nous pouvons donc lancer l'apprentissage du modèle sur le dataset de training grâce à la fonction glm de R.

Une fois cela effectué, nous appliquons alors le model au dataset de test.
La prédiciton obtenue correspond à une probabilité, sur laquelle nous appliquons un threshold afin de transformer en 0 ou 1, pour correpondre à notre variable résultat.
Puis, nous observons les prédicitons.
Nous obtenons une précision de 81%, ce qui est satisfaisant.

Néanmoins, en enlevant la standardisation, nous obtenons un score plus élevé, aux alentours des 90%. De plus, si nous modifions la valeur du threshold pour la mettre à 0.7. Nous atteignons un score de plus de 95%.
Cependant, le test n'étant réalisé que sur une jeu de 22 données, il se peut que ce résultat soit biaisé. C'est pourquoi nous n'appliquerons pas ces modifications et resteront sur les paramètres détaillés plus-haut, car appliqués suite à des considérations réfléchies.
