# 🚀 Guide de Configuration - AdGuard Merged Blocklist

Ce guide vous accompagne dans la création d'un dépôt GitHub qui hébergera votre liste de blocage AdGuard fusionnée avec mise à jour automatique quotidienne.

## 📋 Prérequis

- ✅ Compte GitHub
- ✅ Git installé localement
- ✅ Accès au terminal/ligne de commande

## 🎯 Étape 1 : Créer le Dépôt GitHub

### Via l'Interface Web GitHub

1. **Allez sur [GitHub.com](https://github.com)**
2. **Cliquez sur "New"** (ou le "+" → "New repository")
3. **Configurez le dépôt :**
   - **Repository name** : `adguard-merged-blocklist`
   - **Description** : `Liste de blocage AdGuard fusionnée automatiquement depuis plusieurs sources - Mise à jour quotidienne`
   - **Visibilité** : ✅ **Public**
   - **⚠️ IMPORTANT** : **NE COCHEZ RIEN** dans "Initialize this repository with:"
     - ❌ Add a README file
     - ❌ Add .gitignore
     - ❌ Choose a license
4. **Cliquez sur "Create repository"**

### Via GitHub CLI (Alternatif)
```bash
# Si vous avez GitHub CLI installé
gh repo create adguard-merged-blocklist --public --description "Liste de blocage AdGuard fusionnée automatiquement depuis plusieurs sources - Mise à jour quotidienne"
```

## 🚀 Étape 2 : Pousser le Code

Une fois le dépôt créé sur GitHub, exécutez :

```bash
./push-to-github.sh
```

Ou manuellement :
```bash
git push -u origin main
```

## ⚙️ Étape 3 : Activer GitHub Actions

1. **Allez sur votre dépôt** : `https://github.com/morgannito/adguard-merged-blocklist`
2. **Cliquez sur l'onglet "Actions"**
3. **Activez les workflows** : Cliquez sur "I understand my workflows, go ahead and enable them"

## 🎮 Étape 4 : Première Exécution

### Lancement Manuel
1. **Dans l'onglet Actions**, cliquez sur **"Update AdGuard Blocklist"**
2. **Cliquez sur "Run workflow"** → **"Run workflow"**
3. **Attendez l'exécution** (environ 2-5 minutes)

### Vérification
- ✅ Le fichier `merged-blocklist.txt` doit être généré
- ✅ Le fichier `stats.json` doit être mis à jour
- ✅ Un commit automatique doit apparaître

## 📊 Étape 5 : Vérification du Résultat

### URL de Votre Liste
```
https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt
```

### Test de la Liste
```bash
# Télécharger et vérifier
curl -s "https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt" | head -20

# Compter les règles
curl -s "https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt" | grep -v '^[[:space:]]*$' | grep -v '^[[:space:]]*!' | wc -l
```

## 🔄 Automatisation Configurée

### Planification
- **Fréquence** : Quotidienne à 06:00 UTC
- **Déclencheurs** :
  - Cron quotidien
  - Push sur `main`
  - Exécution manuelle

### Processus Automatique
1. **Installation** du générateur AdGuard Blocklist Merger
2. **Récupération** des sources depuis 10 URLs
3. **Fusion et déduplication** des règles
4. **Génération** du fichier `merged-blocklist.txt`
5. **Mise à jour** des statistiques
6. **Commit et push** automatiques
7. **Release hebdomadaire** (dimanche)

## 🛠️ Personnalisation

### Modifier les Sources
Éditez le fichier `config.json` :
```json
{
  "urls": [
    "https://votre-source-personnalisee.com/blocklist.txt",
    "https://autre-source.org/hosts"
  ]
}
```

### Changer la Fréquence
Modifiez `.github/workflows/update-blocklist.yml` :
```yaml
schedule:
  # Toutes les 12 heures
  - cron: '0 */12 * * *'
  # Ou tous les lundis à 08:00
  - cron: '0 8 * * 1'
```

## 📈 Monitoring

### Vérifier l'État
- **Actions GitHub** : `https://github.com/morgannito/adguard-merged-blocklist/actions`
- **Dernière mise à jour** : Visible dans le README
- **Statistiques** : Fichier `stats.json`

### Notifications d'Erreur
Le workflow créera automatiquement un fichier `error-log.txt` en cas d'échec.

## 🎯 Utilisation de Votre Liste

### AdGuard Home
```
https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt
```

### Pi-hole
```bash
echo "https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt" | sudo tee -a /etc/pihole/adlists.list
pihole -g
```

### uBlock Origin
Ajoutez l'URL dans les filtres personnalisés.

## 🚨 Dépannage

### Le Workflow Échoue
1. **Vérifiez les logs** dans l'onglet Actions
2. **Consultez** le fichier `error-log.txt` s'il existe
3. **Relancez** manuellement le workflow

### Sources Inaccessibles
- Le workflow continue même si certaines sources échouent
- Les statistiques montrent le nombre de sources réussies/échouées

### Permissions GitHub
- Assurez-vous que GitHub Actions est activé
- Vérifiez que le token `GITHUB_TOKEN` a les permissions nécessaires

## 📞 Support

### Problèmes avec ce Setup
- **Issues** : [Ouvrir une issue](https://github.com/morgannito/adguard-merged-blocklist/issues)
- **Discussions** : [GitHub Discussions](https://github.com/morgannito/adguard-merged-blocklist/discussions)

### Problèmes avec le Générateur
- **Dépôt principal** : [AdGuard Blocklist Merger](https://github.com/morgannito/adguard-blocklist-merger)

## ✅ Checklist de Validation

- [ ] Dépôt GitHub créé et public
- [ ] Code poussé vers GitHub
- [ ] GitHub Actions activé
- [ ] Première exécution réussie
- [ ] Fichier `merged-blocklist.txt` généré
- [ ] URL accessible publiquement
- [ ] Statistiques mises à jour
- [ ] Planification quotidienne active

## 🎉 Félicitations !

Votre dépôt de listes de blocage automatisé est maintenant opérationnel ! 

**URL de votre liste** : `https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt`

La liste sera automatiquement mise à jour chaque jour avec les dernières règles de blocage depuis toutes les sources configurées.

---

**📅 Dernière mise à jour** : 13 août 2024  
**🔗 Générateur** : [AdGuard Blocklist Merger](https://github.com/morgannito/adguard-blocklist-merger)