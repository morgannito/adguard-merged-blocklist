#!/bin/bash

echo "🚀 Poussée vers GitHub..."

# Pousser vers GitHub
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ Code poussé avec succès vers GitHub!"
    echo ""
    echo "🎯 Prochaines étapes:"
    echo ""
    echo "1. Allez sur: https://github.com/morgannito/adguard-merged-blocklist"
    echo ""
    echo "2. Activez GitHub Actions:"
    echo "   - Cliquez sur l'onglet 'Actions'"
    echo "   - Cliquez sur 'I understand my workflows, go ahead and enable them'"
    echo ""
    echo "3. Lancez la première génération:"
    echo "   - Dans Actions, cliquez sur 'Update AdGuard Blocklist'"
    echo "   - Cliquez sur 'Run workflow' → 'Run workflow'"
    echo ""
    echo "4. Votre liste sera disponible à:"
    echo "   https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt"
    echo ""
    echo "🎉 Votre dépôt de listes de blocage automatisé est prêt!"
else
    echo "❌ Erreur lors de la poussée vers GitHub"
    echo "Assurez-vous d'avoir créé le dépôt 'adguard-merged-blocklist' sur GitHub"
fi