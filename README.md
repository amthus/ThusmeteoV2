### Création d'une Application Météo avec Flutter

**Description** : Cette application météo utilise une API publique (OpenWeatherMap) pour afficher les prévisions météorologiques actuelles et à venir. L'application présente des informations comme la température, les conditions climatiques, et d'autres détails utiles, tout en mettant en œuvre les bonnes pratiques de développement avec Flutter, telles que l'intégration d'une API, la gestion d'état avec GetX, et une organisation claire du code.

#### Objectifs du projet :
1. **Installation de Flutter et des dépendances** : Créer un projet Flutter et ajouter les dépendances nécessaires comme `GetX` et `http` pour pouvoir intégrer l'API et gérer l'état de l'application.
2. **Intégration avec l'API OpenWeatherMap** : Récupérer les données météorologiques actuelles et les prévisions pour afficher les informations nécessaires.
3. **Traitement des données JSON et gestion des erreurs** : Analyser les données JSON renvoyées par l'API et gérer les erreurs pour garantir une application stable.
4. **Utilisation de GetX pour la gestion d'état et l'injection de dépendances** : Organiser la logique métier et l'état de l'application à l'aide de GetX, un package puissant pour simplifier le développement.
5. **Structure du projet** : Organiser le projet de manière modulaire, en séparant clairement les responsabilités de chaque fonctionnalité pour rendre le code facile à maintenir et étendre.
6. **Création de l'interface utilisateur** : Développer une interface simple avec des écrans de présentation des prévisions actuelles, des recherches de villes, et une page "À propos".
7. **Navigation entre les écrans avec GetX** : Utiliser la navigation de GetX pour passer d'un écran à un autre de manière fluide.

#### Mongroupes :
1. **AMETEPE C . A Malthus** 
2. **DINGBOE Roméo**
3. **THON Charbel**
4. **GBAGUIDI Hillary**
5. **HOUNTONDJI Jephté**

#### Prérequis :
- Connaissances de base du langage Dart.
- Flutter SDK installé sur votre machine et un éditeur de code comme Android Studio ou VS Code.
- La bibliothèque GetX intégrée au projet Flutter.

#### Configuration du projet :
1. **Création du projet Flutter** : Créez un projet avec la commande `flutter create weather_app`.
2. **Ajout des dépendances** : Modifiez le fichier `pubspec.yaml` pour inclure `get` et `http` :
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     get: ^4.3.8
     http: ^0.13.3
   ```
   Exécutez `flutter pub get` pour télécharger ces dépendances.

#### Architecture de l'application :
L'application sera organisée en plusieurs modules et services pour une meilleure gestion du code :
- **Modules** : 
  - `home` : pour afficher les informations météo.
  - `location_search` : pour rechercher des villes.
  - `about` : pour une page d'informations générales.
- **Services** : Pour gérer les appels API et récupérer les données météorologiques.
- **Controllers** : Gestion de l'état global de l'application avec GetX.
- **Modèles** : Pour définir les données météorologiques nécessaires dans chaque module.
- **Routes** : Gestion de la navigation entre les différents écrans.

#### Intégration de l'API Météo :
1. **Obtenez une clé API** sur OpenWeatherMap en vous inscrivant sur leur site.
2. **Création d'un service API** : Créez un fichier `api_service.dart` pour gérer les requêtes HTTP vers l'API OpenWeatherMap et récupérer les données météorologiques actuelles et futures.

### Conclusion
Cette application météo simple permet d'afficher les prévisions météorologiques en utilisant une API publique. Grâce à Flutter et GetX, nous avons construit une structure de projet modulaire, avec une gestion d'état claire et une interface utilisateur fluide, ce qui constitue une excellente base pour une application de météo robuste.
