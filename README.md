# E-Commerce App with Riverpod

Une application mobile d'e-commerce moderne construite avec **Flutter** et **Riverpod 3.0**, illustrant les meilleures pratiques de gestion d'état, une architecture en couches et une couverture de tests robuste.

## 🚀 Fonctionnalités Principales

- **Catalogue Dynamique** : Liste complète des produits avec recherche en temps réel, filtrage par catégorie et **tri avancé** (Prix croissant/décroissant, Nom).
- **Gestion du Panier** : Ajout/suppression de produits, mise à jour des quantités et calcul automatique du total via `CartNotifier`.
- **Système de Favoris Persistant** : Les favoris sont sauvegardés localement via `SharedPreferences`. La logique de chargement est synchronisée dès le démarrage de l'application via un override de provider.
- **Profil Utilisateur** : Écran dédié affichant les informations de l'utilisateur et permettant de basculer entre le mode sombre et clair.
- **Thème Personnalisable** : Support du mode sombre et clair avec persistance du choix utilisateur.
- **Gestion d'État Avancée** : Utilisation de `NotifierProvider`, `FutureProvider` et `AsyncValue` pour une réactivité optimale (plus de 8 providers distincts).
- **Gestion Robuste des Erreurs** : Utilisation d'un widget générique `AsyncValueWidget` pour uniformiser le traitement des états de chargement et d'erreur.

## 🛠️ Architecture & Stack Technique

Le projet suit une architecture structurée pour séparer les responsabilités :

- **Couche Données (Data)** : `ProductRepository` gère la récupération brute des données.
- **Couche Service (Domain/Business)** : `ProductService` contient la logique métier pure (filtrage, tri) indépendamment du framework UI.
- **Couche État (State/Providers)** : Les providers Riverpod (`Notifier`, `FutureProvider`) exposent l'état à l'UI.
- **Couche Présentation (UI)** : Widgets Flutter réactifs utilisant `ConsumerWidget` ou `ConsumerStatefulWidget`.

### Liste des Providers Clés :
- `productsProvider` : Récupère la liste des produits (Future).
- `filteredProductsProvider` : Combine recherche, catégorie et tri pour fournir la liste finale.
- `cartProvider` : Gère l'état du panier d'achat.
- `favoritesProvider` : Gère les favoris avec persistance locale.
- `themeProvider` : Gère le mode d'affichage.
- `userProvider` : Gère les données du profil utilisateur.
- `productSortProvider` : Gère l'ordre de tri sélectionné.
- `searchQueryProvider` : Gère la chaîne de recherche actuelle.

## 🧪 Tests

La qualité du code est assurée par une suite de tests complète :
- **Tests Unitaires** : 
  - `cart_notifier_test.dart`
  - `favorites_notifier_test.dart`
  - `product_service_test.dart`
  - `sort_notifier_test.dart`
- **Tests de Widgets** :
  - `widget_test.dart` (Validation du flux principal et de l'initialisation).

## 📂 Structure du Dossier `lib`

```text
lib/
├── main.dart
└── src/
    ├── models/       # Entités de données
    ├── providers/    # Gestion de l'état (Riverpod)
    ├── repositories/ # Accès aux données
    ├── services/     # Logique métier
    ├── screens/      # Écrans de l'application
    └── widgets/      # Composants UI réutilisables
```

## ⚙️ Installation

1.  **Prérequis** : Flutter SDK `^3.12.2`.
2.  **Installation** : `flutter pub get`
3.  **Lancement** : `flutter run`
4.  **Exécuter les tests** : `flutter test`

---
Développé avec ❤️ pour illustrer la puissance de Riverpod dans Flutter.
