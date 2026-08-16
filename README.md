# E-Commerce App with Riverpod 3.0

Bienvenue dans le projet **E-Commerce App**, une démonstration technique avancée de l'écosystème **Flutter** utilisant **Riverpod 3.0**. Ce projet a été conçu pour illustrer une architecture "Enterprise-ready", mettant l'accent sur la scalabilité, la testabilité et une séparation stricte des préoccupations via une **Architecture orientée fonctionnalités (Feature-First Architecture)**.

## 🚀 Vision du Projet

L'objectif principal est de fournir une base solide pour une application de commerce électronique, en exploitant les dernières fonctionnalités de **Riverpod** pour une gestion d'état réactive et performante. L'application gère un catalogue de produits, un panier d'achat persistant, des favoris et un profil utilisateur personnalisable, le tout dans un environnement robuste et testé.

## 🛠️ Stack Technique & Architecture

### Architecture par Fonctionnalités (Feature-First)
Le projet organise le code par domaine métier (Features). Chaque fonctionnalité (`products`, `cart`, `favorites`, `profile`) suit le pattern **Data-Domain-Presentation** :

-   **`core/`** : Composants transversaux (ex: `AsyncValueWidget` utilisé pour la gestion unifiée des états de chargement et d'erreur).
-   **`features/`** : Cœur de l'application organisé par domaine.
    -   **`domain/`** : Entités (`Product`), interfaces et services métier.
    -   **`data/`** : Implémentations des dépôts (Repositories).
    -   **`presentation/`** : Gestion de l'état (Providers) et UI (Screens, Widgets).

### Gestion d'État avec Riverpod 3.0
L'application utilise une architecture granulaire avec plus de 11 providers pour une réactivité optimale :

1.  **`productListProvider`** (`lib/features/products/presentation/providers/product_list_provider.dart`) : Gère la liste globale des produits.
2.  **`filteredProductsProvider`** : Gère la logique de filtrage et de tri combinée.
3.  **`productDetailProvider`** (`lib/features/products/presentation/providers/product_detail_provider.dart`) : Fournit les détails d'un produit spécifique.
4.  **`productFilterProvider`** (`lib/features/products/presentation/providers/product_filter_provider.dart`) : Gère l'état des filtres par catégorie.
5.  **`productSortProvider`** (`lib/features/products/presentation/providers/product_sort_provider.dart`) : Gère l'ordre de tri (Prix, Nom).
6.  **`searchQueryProvider`** : Gère la recherche textuelle en temps réel.
7.  **`cartProvider`** (`lib/features/cart/presentation/providers/cart_provider.dart`) : Logique du panier (ajout, suppression, quantités, prix total).
8.  **`favoritesProvider`** (`lib/features/favorites/presentation/providers/favorites_provider.dart`) : **Persistance locale** des favoris via `SharedPreferences`.
9.  **`userProfileProvider`** (`lib/features/profile/presentation/providers/user_profile_provider.dart`) : Gestion des informations utilisateur.
10. **`themeProvider`** : Gestion du mode sombre/clair.
11. **`sharedPreferencesProvider`** : Injection de dépendance pour le stockage local.

## 🧪 Qualité du Code & Tests

Le projet inclut une couverture de tests complète (31 tests) pour valider chaque couche :

-   **Tests Unitaires des Providers** :
    *   `product_list_provider_test.dart`
    *   `product_detail_provider_test.dart`
    *   `cart_provider_test.dart`
    *   `favorites_provider_test.dart` (incluant le test de persistance locale)
    *   `user_profile_provider_test.dart`
    *   `product_sort_provider_test.dart`
    *   `theme_provider_test.dart`
-   **Tests de Logique Métier** : `product_service_test.dart` (validation des algorithmes de filtrage et tri).
-   **Tests de UI/Widgets** : `async_value_widget_test.dart` (validation de la gestion des états Loading/Error).
-   **Tests d'Intégration (Smoke Tests)** : `test/smoke_test.dart` valide le flux utilisateur complet.

## 📂 Structure du Projet

```text
lib/
├── core/widgets/      # AsyncValueWidget (Gestion erreurs/chargement)
├── features/
│   ├── products/      # product_list_screen.dart, product_detail_screen.dart
│   ├── cart/          # cart_screen.dart, cart_provider.dart
│   ├── favorites/     # favorites_screen.dart, favorites_provider.dart (Persistance)
│   ├── profile/       # profile_screen.dart, user_profile_provider.dart
│   └── settings/      # theme_provider.dart
└── shared/providers/  # storage_providers.dart (Injection DI)
```

## ⚙️ Installation & Lancement

1.  `flutter pub get`
2.  `flutter test`
3.  `flutter run`
