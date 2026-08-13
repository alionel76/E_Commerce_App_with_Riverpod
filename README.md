# E-Commerce App with Riverpod

Une application mobile d'e-commerce moderne construite avec **Flutter** et **Riverpod 3.0**, illustrant les meilleures pratiques de gestion d'état, une **architecture en couches (Layered Architecture)** rigoureuse et une couverture de tests exhaustive.

## 🚀 Fonctionnalités Principales

- **Catalogue Dynamique** : Liste de produits avec recherche textuelle, filtrage par catégorie et **système de tri** (Prix, Nom).
- **Gestion du Panier** : Ajout, suppression et modification des quantités avec calcul automatique du total en temps réel via `CartNotifier`.
- **Favoris Persistants** : Marquage des produits favoris avec sauvegarde locale via `SharedPreferences`. Les données sont synchronisées dès le démarrage grâce à l'injection de dépendances Riverpod.
- **Profil Utilisateur Interactif** : Écran de profil permettant de modifier le nom d'utilisateur et de basculer entre le mode sombre et clair.
- **Thème Personnalisable** : Support du mode sombre et clair avec persistance du choix de l'utilisateur.
- **Gestion d'État Avancée** : Utilisation intensive de Riverpod avec plus de 8 providers distincts gérant tout, de l'authentification (mock) aux préférences de stockage.
- **UI UX Résiliente** : Gestion centralisée des états de chargement et d'erreur via le composant réutilisable `AsyncValueWidget`.

## 🛠️ Architecture & Stack Technique

Le projet suit une **Architecture en Couches** stricte pour une séparation optimale des préoccupations :

### 📂 Structure des Dossiers (`lib/src/`)

- **`data/`** : Couche d'accès aux données.
  - `repositories/` : Implémentations concrètes des dépôts (ex: `MockProductRepository`).
- **`domain/`** : Cœur métier (indépendant du framework UI).
  - `models/` : Entités pures utilisant `Equatable` (`Product`, `CartProduct`).
  - `repositories/` : Définitions d'interfaces (contrats) pour les dépôts.
  - `services/` : Logique métier pure (logique de filtrage, tri et recherche).
- **`presentation/`** : Couche interface utilisateur et état.
  - `providers/` : Notifiers Riverpod gérant l'état réactif.
  - `screens/` : Écrans principaux de l'application.
  - `widgets/` : Composants UI atomiques et réutilisables.

### 🧩 Providers Riverpod Utilisés

1.  **`productsProvider` (FutureProvider)** : Gère la récupération asynchrone de la liste des produits.
2.  **`filteredProductsProvider` (Provider)** : Combine les filtres, la recherche et le tri pour fournir une liste dérivée.
3.  **`cartProvider` (NotifierProvider)** : Gère l'état complexe du panier d'achat.
4.  **`favoritesProvider` (NotifierProvider)** : Gère les favoris avec synchronisation `SharedPreferences`.
5.  **`themeProvider` (NotifierProvider)** : Gère le mode d'affichage de l'application.
6.  **`userProvider` (NotifierProvider)** : Gère les informations du profil utilisateur.
7.  **`productSortProvider` (NotifierProvider)** : Gère l'ordre de tri sélectionné.
8.  **`searchQueryProvider` (NotifierProvider)** : Gère la chaîne de recherche en temps réel.
9.  **`sharedPreferencesProvider` (Provider)** : Fournit l'instance de stockage local via injection.

## 🧪 Qualité du Code & Tests

Le projet inclut une suite de tests robuste pour garantir la stabilité :

- **Tests Unitaires** (`test/unit/`) :
  - `cart_notifier_test.dart` : Teste la logique complexe d'ajout/suppression et de calcul du total.
  - `favorites_notifier_test.dart` : Valide la persistance et le chargement initial.
  - `product_service_test.dart` : Teste les algorithmes de filtrage et de recherche.
  - `sort_notifier_test.dart` : Valide les changements d'état du tri.
- **Tests de Widgets** (`test/`) :
  - `widget_test.dart` : Validation de l'UI, de l'initialisation et du rendu des composants clés.

## ⚙️ Installation

1.  **Prérequis** : Flutter SDK `^3.12.2`.
2.  **Installation** : `flutter pub get`
3.  **Tests** : `flutter test`
4.  **Lancement** : `flutter run`

---
Développé **Lionel Adandokpossi**.
