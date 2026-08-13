# E-Commerce App with Riverpod 3.0

Bienvenue dans le projet **E-Commerce App**, une démonstration technique avancée de l'écosystème **Flutter** utilisant **Riverpod 3.0**. Ce projet a été conçu pour illustrer une architecture "Enterprise-ready", mettant l'accent sur la scalabilité, la testabilité et une séparation stricte des préoccupations via une **Architecture orientée fonctionnalités (Feature-First Architecture)**.

## 🚀 Vision du Projet

L'objectif principal est de fournir une base solide pour une application de commerce électronique, en exploitant les dernières fonctionnalités de **Riverpod** pour une gestion d'état réactive et performante. L'application gère un catalogue de produits, un panier d'achat persistant, des favoris et un profil utilisateur personnalisable, le tout dans un environnement robuste et testé.

## 🛠️ Stack Technique & Architecture

### Architecture par Fonctionnalités (Feature-First)
Contrairement à une structure "plate", ce projet organise le code par domaine métier (Features). Chaque fonctionnalité (`products`, `cart`, `favorites`, `profile`) possède sa propre logique interne, suivant le pattern **Data-Domain-Presentation** :

-   **`core/`** : Contient les composants transversaux partagés par toutes les fonctionnalités (ex: `AsyncValueWidget` pour la gestion des erreurs).
-   **`src/features/`** : Cœur de l'application organisé par domaine.
    -   **`domain/`** : Contient les entités pures (`Product`), les interfaces (contrats) et les services de logique métier.
    -   **`data/`** : Implémentations concrètes de l'accès aux données (Dépôts, APIs).
    -   **`presentation/`** : Gestion de l'état (Providers Riverpod) et composants UI (Screens, Widgets).

### Gestion d'État avec Riverpod 3.0
L'application utilise plus de **11 providers distincts** pour couvrir tous les aspects de la logique :

1.  **`productsProvider` (FutureProvider)** : Gestion de la récupération asynchrone des données produits.
2.  **`filteredProductsProvider` (Provider)** : Calcul dérivé combinant recherche, filtres et tri.
3.  **`cartProvider` (NotifierProvider)** : Logique complexe du panier (incrémentation, calcul du total).
4.  **`favoritesProvider` (NotifierProvider)** : Gestion des favoris avec synchronisation locale.
5.  **`themeProvider` (NotifierProvider)** : Préférences d'affichage globales.
6.  **`userProvider` (NotifierProvider)** : Informations de profil utilisateur.
7.  **`productSortProvider`** & **`categoryFilterProvider`** : Gestion des préférences de navigation utilisateur.
8.  **`searchQueryProvider`** : Gestion de la recherche textuelle en temps réel.
9.  **`productServiceProvider`** : Injection de la couche de service métier.
10. **`sharedPreferencesProvider`** : Injection de dépendance pour le stockage local.

## 🧪 Qualité du Code & Tests

Le projet impose des standards de qualité élevés :

-   **Tests Unitaires** : Validation exhaustive de la logique métier (calculs de prix, algorithmes de filtrage, persistance).
-   **Tests de Widgets** : Validation du rendu UI et de l'initialisation de l'application.
-   **CI/CD (GitHub Actions)** : Intégration continue configurée pour exécuter les tests, l'analyse statique (`flutter analyze`) et la vérification du formatage à chaque commit.
-   **Immuabilité** : Utilisation de `Equatable` pour garantir des comparaisons d'état fiables et éviter les reconstructions UI inutiles.

## 📂 Structure du Projet

```text
lib/
├── main.dart
└── src/
    ├── core/              # Code partagé global (widgets)
    ├── features/          # Organisation par fonctionnalités
    │   ├── products/      # Catalogue, tri, filtrage
    │   ├── cart/          # Panier et checkout
    │   ├── favorites/     # Logique de favoris
    │   └── profile/       # Gestion utilisateur
    └── shared/            # Providers transversaux (stockage)
```

## ⚙️ Installation & Lancement

1.  **Prérequis** : Flutter SDK `^3.12.2`.
2.  **Installation** : `flutter pub get`
3.  **Exécuter les tests** : `flutter test`
4.  **Lancement** : `flutter run`

---
Développé avec ❤️ par **Lionel Adandokpossi**.
