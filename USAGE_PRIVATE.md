# 🔒 Utilisation Privée - AdGuard Merged Blocklist

## 📋 Fichiers Générés Automatiquement

Votre dépôt privé génère automatiquement ces fichiers chaque jour :

### 📁 Fichiers Disponibles
- `merged-blocklist.txt` - Liste complète (2.3M+ règles, ~53MB)
- `merged-blocklist.txt.gz` - Version compressée (~15MB)
- `adguard-official.txt` - Filtres AdGuard officiels uniquement
- `security-threats.txt` - Protection sécurité (malware, phishing, etc.)
- `comprehensive.txt` - Listes communautaires (OISD, Hagezi)
- `gaming.txt` - Protection gaming spécialisée
- `stats.json` - Statistiques détaillées

## 🔧 Utilisation Locale

### Option 1 : Téléchargement Direct (Recommandé)
```bash
# Cloner le dépôt privé
git clone https://github.com/morgannito/adguard-merged-blocklist.git
cd adguard-merged-blocklist

# Utiliser le fichier directement
cp merged-blocklist.txt /path/to/your/adguard/
```

### Option 2 : Synchronisation Automatique
```bash
# Script de synchronisation
#!/bin/bash
cd /path/to/adguard-merged-blocklist
git pull origin main
cp merged-blocklist.txt /etc/adguard/blocklists/
systemctl restart adguard
```

### Option 3 : Serveur HTTP Local
```bash
# Servir les fichiers localement
cd adguard-merged-blocklist
python3 -m http.server 8080

# Utiliser dans AdGuard Home:
# http://localhost:8080/merged-blocklist.txt
```

## 🛡️ Configuration AdGuard Home

### Fichier Local
1. Copiez `merged-blocklist.txt` dans votre dossier AdGuard
2. Dans AdGuard Home : **Filtres → Listes de blocage DNS**
3. **Ajouter une liste de blocage**
4. **Chemin local** : `/path/to/merged-blocklist.txt`

### Serveur Local
1. Lancez un serveur HTTP local (voir Option 3)
2. URL : `http://localhost:8080/merged-blocklist.txt`
3. Intervalle de mise à jour : **24 heures**

## 📊 Monitoring Privé

### Vérifier les Mises à Jour
```bash
# Voir les derniers commits
git log --oneline -5

# Voir les statistiques
cat stats.json | jq '.'

# Vérifier la taille des fichiers
ls -lh *.txt *.gz
```

### Automatiser les Vérifications
```bash
# Crontab pour synchronisation quotidienne
0 7 * * * cd /path/to/adguard-merged-blocklist && git pull && cp merged-blocklist.txt /etc/adguard/
```

## 🔐 Sécurité et Confidentialité

### Avantages du Dépôt Privé
- ✅ **Confidentialité totale** - Aucun accès public
- ✅ **Contrôle complet** - Vous gérez l'accès
- ✅ **Historique privé** - Tous les commits sont privés
- ✅ **Pas d'exposition** - Aucune URL publique

### Accès Sécurisé
```bash
# Utiliser SSH pour plus de sécurité
git remote set-url origin git@github.com:morgannito/adguard-merged-blocklist.git

# Ou avec token personnel
git remote set-url origin https://YOUR_TOKEN@github.com/morgannito/adguard-merged-blocklist.git
```

## 📈 Statistiques Actuelles

Le workflow génère automatiquement des statistiques dans `stats.json` :

```json
{
  "lastUpdate": "2025-08-13T04:23:22.650Z",
  "totalLines": 2318844,
  "ruleLines": 2318824,
  "fileSize": "53084KB",
  "compressedSize": "14981KB",
  "sources": 31,
  "compressionRatio": "72%"
}
```

## 🔄 Automatisation

### Workflow Actuel
- **Fréquence** : Quotidienne à 06:00 UTC
- **Sources** : 32 listes premium
- **Déduplication** : Automatique
- **Compression** : GZIP (72% de réduction)
- **Catégorisation** : Fichiers séparés par type

### Déclenchement Manuel
```bash
# Via GitHub CLI
gh workflow run "Simple Working Update" --repo morgannito/adguard-merged-blocklist

# Via interface GitHub
# Actions → Simple Working Update → Run workflow
```

## 🛠️ Personnalisation

### Modifier les Sources
Éditez `.github/workflows/simple-working.yml` pour ajouter/supprimer des sources.

### Changer la Fréquence
```yaml
schedule:
  - cron: '0 */12 * * *'  # Toutes les 12 heures
  # ou
  - cron: '0 8 * * 1'     # Tous les lundis à 08:00
```

## 🎯 Recommandations

### Pour Usage Personnel
- Utilisez `merged-blocklist.txt` pour une protection maximale
- Utilisez `security-threats.txt` pour la sécurité essentielle
- Utilisez `adguard-official.txt` pour une approche conservatrice

### Pour Performance
- Utilisez la version compressée si votre système le supporte
- Synchronisez une fois par jour maximum
- Surveillez l'utilisation mémoire avec 2.3M règles

---

**🔒 Votre système de blocage privé et automatisé est opérationnel !**  
**📊 2.3 millions de règles mises à jour quotidiennement en toute confidentialité**