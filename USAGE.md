# 📖 Guide d'Utilisation - AdGuard Merged Blocklist

## 🚀 Intégration Rapide

### URL de la Liste
```
https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt
```

## 🛠️ Configuration par Plateforme

### AdGuard Home

#### Via l'Interface Web
1. Connectez-vous à votre interface AdGuard Home
2. Allez dans **Filtres** → **Listes de blocage DNS**
3. Cliquez sur **Ajouter une liste de blocage**
4. Remplissez les champs :
   - **Nom** : `AdGuard Merged Blocklist`
   - **URL** : `https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt`
5. Cliquez sur **Ajouter**
6. Définissez l'intervalle de mise à jour à **24 heures**

#### Via Configuration YAML
```yaml
filters:
  - enabled: true
    url: https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt
    name: AdGuard Merged Blocklist
    id: 1
```

### Pi-hole

#### Via l'Interface Web
1. Connectez-vous à votre interface Pi-hole
2. Allez dans **Group Management** → **Adlists**
3. Dans le champ **Address**, collez :
   ```
   https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt
   ```
4. **Comment** : `AdGuard Merged Blocklist - Mise à jour quotidienne`
5. Cliquez sur **Add**
6. Allez dans **Tools** → **Update Gravity** pour appliquer

#### Via Ligne de Commande
```bash
# Ajouter la liste
echo "https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt" | sudo tee -a /etc/pihole/adlists.list

# Mettre à jour
pihole -g
```

### uBlock Origin

#### Dans le Navigateur
1. Cliquez sur l'icône uBlock Origin
2. Ouvrez le **Tableau de bord**
3. Allez dans l'onglet **Listes de filtres**
4. Faites défiler jusqu'à **Personnalisé**
5. Cochez **Importer** et collez :
   ```
   https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt
   ```
6. Cliquez sur **Appliquer les changements**

### AdBlock Plus

#### Via l'Extension
1. Cliquez sur l'icône AdBlock Plus
2. Allez dans **Options**
3. Onglet **Listes de filtres**
4. Cliquez sur **Ajouter une liste de filtres**
5. Collez l'URL et validez

### DNS Personnalisé

#### Unbound
```conf
# /etc/unbound/unbound.conf.d/adguard-blocklist.conf
server:
    include: "/etc/unbound/adguard-blocklist.conf"
```

#### BIND9
```conf
# Exemple de configuration pour BIND9
# Nécessite une conversion du format
```

## 🔄 Automatisation et Mise à Jour

### Fréquence de Mise à Jour
- **Automatique** : Tous les jours à 06:00 UTC
- **Manuelle** : Possible via GitHub Actions

### Vérification des Mises à Jour
```bash
# Vérifier la dernière mise à jour
curl -s "https://api.github.com/repos/morgannito/adguard-merged-blocklist/commits/main" | jq -r '.commit.author.date'

# Télécharger la dernière version
curl -o merged-blocklist.txt "https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt"
```

## 📊 Monitoring et Statistiques

### API GitHub pour les Statistiques
```bash
# Informations sur le dépôt
curl -s "https://api.github.com/repos/morgannito/adguard-merged-blocklist"

# Dernière mise à jour
curl -s "https://api.github.com/repos/morgannito/adguard-merged-blocklist/commits/main"

# Taille du fichier
curl -s "https://api.github.com/repos/morgannito/adguard-merged-blocklist/contents/merged-blocklist.txt"
```

### Webhook pour Notifications
```json
{
  "url": "https://your-webhook-url.com/notify",
  "events": ["push"],
  "config": {
    "url": "https://your-webhook-url.com/notify",
    "content_type": "json"
  }
}
```

## 🧪 Test et Validation

### Tester la Liste
```bash
# Télécharger et vérifier
curl -s "https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt" > test-blocklist.txt

# Compter les règles
grep -v '^[[:space:]]*$' test-blocklist.txt | grep -v '^[[:space:]]*!' | wc -l

# Vérifier la syntaxe AdGuard
grep -E '^\|\|.*\^$' test-blocklist.txt | head -5
```

### Validation de Domaine
```bash
# Tester si un domaine est bloqué
domain="ads.example.com"
if grep -q "$domain" test-blocklist.txt; then
    echo "✅ $domain est bloqué"
else
    echo "❌ $domain n'est pas bloqué"
fi
```

## 🔧 Personnalisation

### Créer sa Propre Version
1. Fork le dépôt `adguard-merged-blocklist`
2. Modifiez le fichier `config.json` avec vos sources
3. Ajustez la fréquence dans `.github/workflows/update-blocklist.yml`
4. Activez GitHub Actions dans votre fork

### Sources Personnalisées
```json
{
  "urls": [
    "https://your-custom-source1.com/blocklist.txt",
    "https://your-custom-source2.com/hosts",
    "https://another-source.org/filters.txt"
  ]
}
```

## 🚨 Dépannage

### Problèmes Courants

#### La Liste ne se Met pas à Jour
1. Vérifiez l'onglet **Actions** sur GitHub
2. Consultez les logs d'erreur
3. Vérifiez que GitHub Actions est activé

#### Faux Positifs
1. Ouvrez une **Issue** sur GitHub
2. Précisez le domaine concerné
3. Expliquez pourquoi il ne devrait pas être bloqué

#### Performance Dégradée
1. La liste est optimisée mais peut être volumineuse
2. Considérez utiliser des sous-ensembles
3. Ajustez la fréquence de mise à jour

### Logs et Debugging
```bash
# Vérifier les logs GitHub Actions
# Allez sur : https://github.com/morgannito/adguard-merged-blocklist/actions

# Tester localement
git clone https://github.com/morgannito/adguard-merged-blocklist.git
cd adguard-merged-blocklist
# Examiner les fichiers de log
```

## 📞 Support

### Canaux de Support
- **Issues GitHub** : [Ouvrir une issue](https://github.com/morgannito/adguard-merged-blocklist/issues)
- **Discussions** : [GitHub Discussions](https://github.com/morgannito/adguard-merged-blocklist/discussions)
- **Documentation** : [Wiki du projet](https://github.com/morgannito/adguard-merged-blocklist/wiki)

### Informations à Fournir
Lors d'un rapport de problème, incluez :
- Version de votre logiciel de blocage
- URL ou domaine concerné
- Comportement attendu vs observé
- Logs d'erreur si disponibles

## 🤝 Contribution

### Signaler des Problèmes
1. Vérifiez les issues existantes
2. Créez une nouvelle issue avec un titre descriptif
3. Fournissez un maximum de détails

### Suggérer des Améliorations
1. Ouvrez une discussion GitHub
2. Expliquez votre suggestion
3. Proposez une implémentation si possible

---

**📅 Dernière mise à jour de ce guide** : 13 août 2024  
**🔗 Dépôt principal** : [AdGuard Blocklist Merger](https://github.com/morgannito/adguard-blocklist-merger)