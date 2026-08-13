# E-Commerce App with Riverpod

Une application mobile d'e-commerce moderne construite avec **Flutter** et **Riverpod 3.0**, illustrant les meilleures pratiques de gestion d'état et une architecture propre.

## 🚀 Fonctionnalités Principales

- **Catalogue Dynamique** : Liste complète des produits avec recherche en temps réel et filtrage par catégorie.
- **Gestion du Panier** : Ajout/suppression de produits, mise à jour des quantités et calcul automatique du total.
- **Système de Favoris Persistant** : Les utilisateurs peuvent marquer des produits comme favoris. Ces choix sont sauvegardés localement via `shared_preferences` et persistent après le redémarrage de l'application.
- **Thème Personnalisable** : Support du mode sombre et clair, avec persistance du choix de l'utilisateur.
- **Gestion d'État Avancée** : Utilisation de `NotifierProvider`, `FutureProvider` et `AsyncValue` pour une réactivité optimale (plus de 6 providers distincts).
- **Gestion Robuste des Erreurs** : Utilisation de widgets dédiés (`AsyncValueWidget`) pour gérer les états de chargement et d'erreur de manière élégante et uniforme.

## 🛠️ Architecture & Stack Technique

Le projet suit une architecture structurée pour une meilleure séparation des préoccupations :

- **Models** : Définition des entités de données (`Product`, `CartItem`).
- **Services** : Couche de logique métier intermédiaire.
- **Providers** : Gestion de l'état avec Riverpod (Notifier, FutureProvider).
- **Repositories** : Accès aux données (Mocké pour cette démo).
- **Screens & Widgets** : Interfaces utilisateur réactives et composants réutilisables.

## 🧪 Tests et Qualité du Code

Le projet met l'accent sur la fiabilité avec une couverture de tests accrue :
- **Tests Unitaires** : Validation de la logique du panier (`CartNotifier`) et du filtrage (`ProductService`).
- **Architecture en Couches** : Séparation stricte entre UI, logique métier et données.

## ⚙️ Installation

1.  **Cloner le projet** :
    ```bash
    git clone https://github.com/alionel76/E_Commerce_App_with_Riverpod.git
    ```
2.  **Installer les dépendances** :
    ```bash
    flutter pub get
    ```
3.  **Lancer l'application** :
    ```bash
    flutter run
    ```

## 📝 Configuration requise

- Flutter SDK : `^3.12.2` ou supérieur.
- Dart SDK : `^3.0.0`.

---
Développé avec ❤️ pour illustrer la puissance de Riverpod dans Flutter.
