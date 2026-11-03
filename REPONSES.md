REPONSE AU QUESTION DE REFLEXION:

### Question 1 : 

La commande `chmod 644` donne au propriétaire le droit de lire et modifier le fichier (read and write), 
et aux autres utilisateurs seulement le droit de lecture (read only). Le fichier n'est pas exécutable par son p
ropriétaire parce qu'on n'a pas ajouté le droit `execute (x)`.

### Question 2 : 

On utilise les guillemets pour protéger la variable et éviter les problèmes si elle contient une valeur vide ou 
des caractères spéciaux. C'est une bonne pratique en Bash pour que le script fonctionne correctement et soit plus sécurisé.

### Question 3 : 

Oui, le script peut continuer même si la commande `tar` échoue, parce qu'il ne détecte pas automatiquement 
toutes les erreurs. Il peut donc afficher un message de succès alors que la backup n'a pas été créée correctement. 
Avec `set -Eeuo pipefail`, on peut mieux détecter les erreurs et arrêter le script en cas de problème.

### Question 4 : 

Dans le terminal, on travaille généralement depuis un dossier précis, donc les chemins relatifs fonctionnent. 
Mais avec cron, le script s'exécute automatiquement en arrière-plan, sans forcément utiliser le même dossier de travail. 
C'est pour cela qu'on utilise les chemins absolus pour indiquer exactement où se trouvent les fichiers et éviter les erreurs.
Pour avoir un vrai pipeline CI, je pense qu'on doit ajouter plusieurs étapes comme 
l'installation des dependencies, les tests automatiques (unit tests), la vérification du
code et la création d'un rapport pour voir si tout fonctionne correctement. On peut aussi 
utiliser GitHub Actions pour lancer automatiquement le pipeline chaque fois qu'on fait un 
changement dans le projet.

### Question 5 :

Pour avoir un vrai pipeline CI, je pense qu'on doit ajouter plusieurs étapes comme l'installation des dependencies, 
les tests automatiques (unit tests), la vérification du code et la création d'un rapport pour voir si tout fonctionne correctement. 
On peut aussi utiliser GitHub Actions pour lancer automatiquement le pipeline chaque fois qu'on fait un changement dans le projet.

Les problèmes qui peuvent arriver sont par exemple un problème pendant le clone du repository,
une erreur dans l'installation des dependencies, des tests qui ne passent pas ou 
un problème de connexion. Pour cela, il faut vérifier les erreurs avec les exit codes 
(0 si tout va bien et 1 si une erreur se produit), pour que le script puisse s'arrêter 
en cas de problème et ne pas afficher que le pipeline est réussi alors qu'il y a 





































une erreur.
