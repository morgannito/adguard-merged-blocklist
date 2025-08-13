#!/bin/bash

# Script pour activer GitHub Actions et lancer le premier workflow
# Usage: ./enable-actions.sh

set -e

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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

echo "🚀 Activation des GitHub Actions..."

# Vérifier si GitHub CLI est installé
if ! command -v gh &> /dev/null; then
    print_warning "GitHub CLI (gh) n'est pas installé"
    echo ""
    echo "📥 Installation de GitHub CLI:"
    echo ""
    echo "macOS (avec Homebrew):"
    echo "  brew install gh"
    echo ""
    echo "Ou téléchargez depuis: https://cli.github.com/"
    echo ""
    echo "Une fois installé, relancez ce script."
    echo ""
    print_status "Méthode alternative manuelle:"
    echo "1. Allez sur: https://github.com/morgannito/adguard-merged-blocklist"
    echo "2. Cliquez sur l'onglet 'Actions'"
    echo "3. Cliquez sur 'I understand my workflows, go ahead and enable them'"
    echo "4. Cliquez sur 'Update AdGuard Blocklist'"
    echo "5. Cliquez sur 'Run workflow' → 'Run workflow'"
    exit 1
fi

# Vérifier l'authentification GitHub
print_status "Vérification de l'authentification GitHub..."
if ! gh auth status &> /dev/null; then
    print_warning "Vous n'êtes pas authentifié avec GitHub CLI"
    echo ""
    print_status "Authentification en cours..."
    gh auth login
    
    if [ $? -ne 0 ]; then
        print_error "Échec de l'authentification"
        exit 1
    fi
fi

print_success "Authentifié avec GitHub CLI"

# Obtenir le nom du dépôt
REPO_NAME=$(git remote get-url origin | sed 's/.*github\.com[:/]\([^/]*\/[^/]*\)\.git/\1/' | sed 's/\.git$//')

if [ -z "$REPO_NAME" ]; then
    print_error "Impossible de déterminer le nom du dépôt"
    print_status "Assurez-vous d'être dans le bon répertoire et d'avoir configuré l'origine GitHub"
    exit 1
fi

print_status "Dépôt détecté: $REPO_NAME"

# Vérifier que le dépôt existe sur GitHub
print_status "Vérification de l'existence du dépôt sur GitHub..."
if ! gh repo view "$REPO_NAME" &> /dev/null; then
    print_error "Le dépôt $REPO_NAME n'existe pas ou n'est pas accessible"
    echo ""
    echo "Assurez-vous que:"
    echo "1. Le dépôt existe sur GitHub"
    echo "2. Vous avez les permissions d'accès"
    echo "3. Le code a été poussé vers GitHub"
    exit 1
fi

print_success "Dépôt accessible sur GitHub"

# Activer GitHub Actions (si pas déjà activé)
print_status "Activation de GitHub Actions..."

# Créer un commit vide pour déclencher les actions si nécessaire
git commit --allow-empty -m "🔄 Trigger GitHub Actions activation"
git push origin main

print_success "Commit de déclenchement poussé"

# Attendre un peu pour que GitHub traite le push
print_status "Attente de la synchronisation GitHub (10 secondes)..."
sleep 10

# Lister les workflows disponibles
print_status "Vérification des workflows disponibles..."
WORKFLOWS=$(gh workflow list --repo "$REPO_NAME" 2>/dev/null || echo "")

if [ -z "$WORKFLOWS" ]; then
    print_warning "Aucun workflow détecté ou Actions pas encore activées"
    echo ""
    print_status "Activation manuelle requise:"
    echo "1. Allez sur: https://github.com/$REPO_NAME"
    echo "2. Cliquez sur l'onglet 'Actions'"
    echo "3. Cliquez sur 'I understand my workflows, go ahead and enable them'"
    echo ""
    echo "Puis relancez ce script pour déclencher le premier workflow."
    exit 0
fi

print_success "Workflows détectés:"
echo "$WORKFLOWS"

# Déclencher le workflow de mise à jour
print_status "Déclenchement du workflow 'Update AdGuard Blocklist'..."

# Essayer de déclencher le workflow
if gh workflow run "update-blocklist.yml" --repo "$REPO_NAME" 2>/dev/null; then
    print_success "Workflow déclenché avec succès!"
    echo ""
    print_status "Suivi de l'exécution:"
    echo "1. Allez sur: https://github.com/$REPO_NAME/actions"
    echo "2. Ou utilisez: gh run list --repo $REPO_NAME"
    echo ""
    
    # Attendre et afficher le statut
    print_status "Attente du démarrage du workflow (15 secondes)..."
    sleep 15
    
    print_status "Dernières exécutions:"
    gh run list --repo "$REPO_NAME" --limit 3
    
elif gh workflow run "Update AdGuard Blocklist" --repo "$REPO_NAME" 2>/dev/null; then
    print_success "Workflow déclenché avec succès!"
    echo ""
    print_status "Suivi de l'exécution:"
    echo "1. Allez sur: https://github.com/$REPO_NAME/actions"
    echo "2. Ou utilisez: gh run list --repo $REPO_NAME"
    
else
    print_warning "Impossible de déclencher automatiquement le workflow"
    echo ""
    print_status "Déclenchement manuel:"
    echo "1. Allez sur: https://github.com/$REPO_NAME/actions"
    echo "2. Cliquez sur 'Update AdGuard Blocklist'"
    echo "3. Cliquez sur 'Run workflow' → 'Run workflow'"
fi

echo ""
print_success "Configuration terminée!"
echo ""
echo "🔗 Liens utiles:"
echo "📊 Actions: https://github.com/$REPO_NAME/actions"
echo "📁 Dépôt: https://github.com/$REPO_NAME"
echo "📋 Liste (une fois générée): https://raw.githubusercontent.com/$REPO_NAME/main/merged-blocklist.txt"
echo ""
echo "⏰ La liste sera mise à jour automatiquement chaque jour à 06:00 UTC"