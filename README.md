# E-Commerce App with Riverpod

Une application mobile d'e-commerce moderne construite avec **Flutter** et **Riverpod 3.0**, illustrant les meilleures pratiques de gestion d'état.

## 🚀 Fonctionnalités

- **Catalogue de Produits** : Affichage d'une liste de produits récupérés via un dépôt (repository).
- **Filtrage par Catégorie** : Filtrage dynamique des produits en utilisant `NotifierProvider`.
- **Panier d'Achat** : Gestion complète du panier (ajout, suppression, modification des quantités, calcul du total).
- **Favoris** : Système de favoris avec persistance locale via `SharedPreferences`.
- **Gestion d'État Moderne** : Utilisation exclusive de la nouvelle API `Notifier` et `NotifierProvider` de Riverpod 3.x.

## 🛠️ Architecture & Stack Technique

- **Flutter** : Framework UI.
- **Riverpod 3.x** : Gestion de l'état (API Notifier).
- **Shared Preferences** : Persistance des données locales (favoris).
- **Clean Architecture** : Séparation claire entre les modèles, les repositories et la logique métier (providers).

## 📂 Structure du Projet

```text
lib/src/
├── models/       # Modèles de données (Product, CartItem)
├── providers/    # Logique métier et gestion d'état (Riverpod)
├── repositories/ # Accès aux données (Mock ou API)
└── screens/      # Interfaces utilisateur (UI)
```

## ⚙️ Installation

1.  **Cloner le projet** :
    ```bash
    git clone https://github.com/votre-repo/E_Commerce_App_with_Riverpod.git
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
Développé par **Lionel Adandokpossi**.
