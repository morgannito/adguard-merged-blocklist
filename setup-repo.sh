#!/bin/bash

# Script pour configurer le dépôt AdGuard Merged Blocklist
# Usage: ./setup-repo.sh

set -e

echo "🚀 Configuration du dépôt AdGuard Merged Blocklist..."

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages colorés
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Vérifier si nous sommes dans le bon répertoire
if [ ! -f "README.md" ] || [ ! -d ".github" ]; then
    print_error "Ce script doit être exécuté depuis le répertoire racine du projet blocklist"
    exit 1
fi

# Initialiser Git si nécessaire
if [ ! -d ".git" ]; then
    print_status "Initialisation du dépôt Git..."
    git init
    print_success "Dépôt Git initialisé"
else
    print_status "Dépôt Git déjà initialisé"
fi

# Configurer Git
print_status "Configuration de Git..."
git config --local user.name "AdGuard Blocklist Bot"
git config --local user.email "action@github.com"

# Ajouter tous les fichiers
print_status "Ajout des fichiers au dépôt..."
git add .

# Créer le commit initial
if git diff --staged --quiet; then
    print_warning "Aucun changement à commiter"
else
    print_status "Création du commit initial..."
    git commit -m "🎉 Initial commit: AdGuard Merged Blocklist Repository

📋 Fonctionnalités:
- ✅ Mise à jour automatique quotidienne via GitHub Actions
- ✅ Fusion de 10 sources de listes de blocage fiables
- ✅ Compatible AdGuard Home, Pi-hole, uBlock Origin
- ✅ Déduplication automatique des règles
- ✅ Statistiques et monitoring intégrés
- ✅ Documentation complète d'utilisation

🔄 Automatisation:
- Exécution quotidienne à 06:00 UTC
- Génération automatique de statistiques
- Releases hebdomadaires automatiques
- Gestion d'erreurs et notifications

🛡️ Sources incluses:
- AdGuard Base Filter (adware, antiadblock, elemhide, extensions, url)
- AdGuard Mobile Filter
- StevenBlack Hosts
- Someone Who Cares Hosts
- EasyList & EasyPrivacy

📊 Le fichier merged-blocklist.txt sera généré automatiquement lors de la première exécution."
    
    print_success "Commit initial créé"
fi

# Instructions pour la suite
echo ""
echo "🎯 Prochaines étapes:"
echo ""
echo "1. Créez un nouveau dépôt sur GitHub:"
echo "   - Nom: adguard-merged-blocklist"
echo "   - Description: Liste de blocage AdGuard fusionnée automatiquement - Mise à jour quotidienne"
echo "   - Visibilité: Public"
echo "   - NE PAS initialiser avec README (nous avons déjà les fichiers)"
echo ""
echo "2. Ajoutez l'origine GitHub et poussez:"
echo "   git remote add origin https://github.com/morgannito/adguard-merged-blocklist.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. Activez GitHub Actions:"
echo "   - Allez dans l'onglet 'Actions' de votre dépôt"
echo "   - Cliquez sur 'I understand my workflows, go ahead and enable them'"
echo ""
echo "4. Testez la première exécution:"
echo "   - Allez dans Actions → Update AdGuard Blocklist"
echo "   - Cliquez sur 'Run workflow' → 'Run workflow'"
echo ""
echo "5. Votre liste sera disponible à:"
echo "   https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt"
echo ""
print_success "Configuration terminée! 🎉"
echo ""
echo "📖 Consultez USAGE.md pour les instructions d'intégration avec AdGuard Home, Pi-hole, etc."