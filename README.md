# E-Commerce App with Riverpod

Une application mobile d'e-commerce moderne construite avec **Flutter** et **Riverpod 3.0**, illustrant les meilleures pratiques de gestion d'état, une **architecture en couches (Layered Architecture)** et une couverture de tests exhaustive.

## 🚀 Fonctionnalités Principales

- **Catalogue Dynamique** : Liste de produits avec recherche textuelle, filtrage par catégorie et **système de tri** (Prix, Nom).
- **Gestion du Panier** : Ajout, suppression et modification des quantités avec calcul automatique du total en temps réel.
- **Favoris Persistants** : Marquage des produits favoris avec sauvegarde locale via `SharedPreferences`. Les données sont synchronisées dès le démarrage.
- **Profil Utilisateur & Thème** : Écran de profil (mock) et gestion du thème (Sombre/Clair) avec persistance du choix de l'utilisateur.
- **Gestion d'État Avancée** : Utilisation intensive de Riverpod (Notifier, FutureProvider, AsyncValue) avec plus de 10 providers distincts.
- **UI UX Résiliente** : Gestion centralisée des états de chargement et d'erreur via le composant réutilisable `AsyncValueWidget`.

## 🛠️ Architecture & Stack Technique

Le projet suit une **Architecture en Couches (Clean-like)** pour une séparation stricte des préoccupations :

### 📂 Structure des Dossiers (`lib/src/`)

- **`data/`** : Couche d'accès aux données.
  - `repositories/` : Implémentation de la récupération des données (Mock Product Repository).
- **`domain/`** : Couche métier (indépendante du framework UI).
  - `models/` : Entités pures (`Product`, `CartItem`, `UserProfile`).
  - `services/` : Logique métier pure (logique de filtrage et de recherche).
- **`presentation/`** : Couche interface utilisateur et état.
  - `providers/` : Notifiers Riverpod gérant l'état de l'application.
  - `screens/` : Écrans principaux (Catalog, Cart, Favorites, Profile, Details).
  - `widgets/` : Composants UI réutilisables (ProductCard, AsyncValueWidget).

## 🧪 Qualité du Code & Tests

Le projet inclut une suite de tests complète couvrant la logique métier et l'interface :

- **Tests Unitaires** (`test/unit/`) :
  - `cart_notifier_test.dart` : Logique du panier.
  - `favorites_notifier_test.dart` : Persistance et état des favoris.
  - `product_service_test.dart` : Logique de filtrage et recherche.
  - `sort_notifier_test.dart` : Logique de tri.
- **Tests de Widgets** (`test/`) :
  - `widget_test.dart` : Validation de l'initialisation de l'app et du flux principal.

## ⚙️ Installation et Utilisation

1.  **Prérequis** : Flutter SDK `^3.12.2`.
2.  **Installation** : 
    ```bash
    flutter pub get
    ```
3.  **Lancement** : 
    ```bash
    flutter run
    ```
4.  **Exécuter les tests** : 
    ```bash
    flutter test
    ```

---
Développé par **Lionel Adandokpossi**.
