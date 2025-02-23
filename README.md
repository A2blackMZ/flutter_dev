# zikflow

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Folder Structure :
lib/
│── main.dart                # Démarre l'application et affiche l'écran de chargement
│── config/
│   ├── api_config.dart       # Configuration de l'API Laravel
│── screens/
│   ├── splash_screen.dart    # Écran de chargement (logo)
│   ├── signup_screen.dart    # Écran d'inscription
│── widgets/
│   ├── custom_button.dart    # Bouton réutilisable
│   ├── input_field.dart      # Champ de saisie réutilisable
│── services/
│   ├── auth_service.dart     # Service pour l'authentification avec Laravel
│── assets/
│   ├── image.png             # Logo de l'application
