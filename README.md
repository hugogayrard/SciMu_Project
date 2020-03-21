# SciMu_Projet

# Analyse_segmentation :
	- Markov.m :
		* Parcours tous les fichiers .lab d'un album donné et à partir de la segmentation donné calcul et stocke la matrice de transition.
	- Analysematrice.m :
		* Crée la représentation en niveau de gris de la matrice de transition.

# Elongation_musicale :
(commun aux deux versions)
	- fadeIn.m / fadeInSin.m :
		* Réalise un fade in, respectivement linéairement ou sinusoïdalement, d'un segment sur une durée donné.
	- fadeOut.m / fadeOutCos.m :
		* Réalise un fade out, respectivement linéairement ou (cos)sinusoïdalement, d'un segment sur une durée donné.
	- Assemblage.m / AssemblageTrig :
		* Assemble deux segments sur lesquelles sont appliques des fade in fade out, respectivement linéairement ou circulairement, pour gérer la transition.
	- AssemblageTotal.m / AssemblageTotalTrig.m :
		* Assemble plusieurs les segments.

(Particulier à V1)
	- dureebridgeverse.m :
		* Calcule la durée des verses et des bridges
	- composition.m :
		* Calcul le nombre de bridge et de verse à ajouter pour coller au mieux à un temps voulu
	- recollement.m :
		* Etablit une séquence de segments à assembler

	- Programmeprincipal.m :
		* Fait appel à toute ces fonctions pour enregistrer un son, composé ici uniquement de verse et de bridge d'une chanson, et qui dure un temps proche du temps voulu.

(Particulier à V2)
	- AlgoChoix.m :
		* Utilise une matrice de transition pour calculer la suite de segment, en commençant par une intro. Les probabilités sont ajustées pour viser le temps voulu et éviter des "culs-de-sac" (exemple : outro apparaît prématurément).

	- Nouveauprogrammeprincipal.m :
		* Fait appel à AlgoChoix.m pour enregistrer un son, composé ici de tout les différents segements d'une chanson, et qui dure un temps proche du temps voulu.

# TestFonctions :
(Comme précédemment)
	- fadeIn.m / fadeInSin.m :
		* Réalise un fade in, respectivement linéairement ou sinusoïdalement, d'un segment sur une durée donné.
	- fadeOut.m / fadeOutCos.m :
		* Réalise un fade out, respectivement linéairement ou (cos)sinusoïdalement, d'un segment sur une durée donné.
	- Assemblage.m / AssemblageTrig :
		* Assemble deux segments sur lesquelles sont appliques des fade in fade out, respectivement linéairement ou circulairement, pour gérer la transition.
	- AssemblageTotal.m / AssemblageTotalTrig.m :
		* Assemble plusieurs segments.

(Scripts tests)
	- testAssemblage.m :
		* Assemble arbitrairement quatre segments d'un morçeau des Beatles et enregistre le son correspondant.
	- testTransition.m :
		* Représente visuellement les fade in et fade out, linéaire et circulaires.

NB:
	- Les repertoires sources seront à changer si vous voulez exécuter les codes.
	- On voit graphiquement le clipping sur les fade in fade out circulaires lorsqu'on éxécute testTransition.m.
