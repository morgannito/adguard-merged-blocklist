# 🛡️ AdGuard Merged Blocklist

Une liste de blocage AdGuard fusionnée automatiquement depuis plusieurs sources fiables, mise à jour quotidiennement.

## 📊 Statistiques

![Dernière mise à jour](https://img.shields.io/github/last-commit/morgannito/adguard-merged-blocklist?label=Dernière%20mise%20à%20jour)
![Taille du fichier](https://img.shields.io/github/size/morgannito/adguard-merged-blocklist/merged-blocklist.txt?label=Taille%20de%20la%20liste)
![Build Status](https://img.shields.io/github/actions/workflow/status/morgannito/adguard-merged-blocklist/update-blocklist.yml?branch=main&label=Mise%20à%20jour%20automatique)

## 🚀 Utilisation Rapide

### 📋 Options de Téléchargement

#### Version Complète (2.3M règles - 53MB)
```
https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt
```

#### Version Compressée (53MB → ~8MB)
```
https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt.gz
```

#### Versions par Catégorie (Plus petites)
- **AdGuard Officiel** : `https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/adguard-official.txt`
- **Sécurité & Menaces** : `https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/security-threats.txt`
- **Gaming** : `https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/gaming.txt`
- **Listes Complètes** : `https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/comprehensive.txt`

### AdGuard Home
Ajoutez une de ces URLs dans vos listes de blocage DNS :

### Pi-hole
```bash
# Ajouter à Pi-hole
curl -s "https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt" | sudo tee -a /etc/pihole/adlists.list
pihole -g
```

### uBlock Origin
Ajoutez cette URL dans les filtres personnalisés :
```
https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt
```

## 📋 Sources Incluses

Cette liste fusionnée combine les sources suivantes :

### 🎯 Filtres AdGuard Officiels
- **AdGuard Base Filter** - Publicités générales
- **AdGuard Anti-Adblock** - Contournement des détecteurs de bloqueurs
- **AdGuard Element Hiding** - Masquage d'éléments publicitaires
- **AdGuard Extensions** - Règles d'extension
- **AdGuard URL Filter** - Filtrage d'URLs
- **AdGuard Mobile Filter** - Publicités mobiles

### 🌐 Listes Communautaires
- **StevenBlack Hosts** - Liste hosts complète
- **Someone Who Cares** - Hosts de protection
- **EasyList** - Liste de filtres populaire
- **EasyPrivacy** - Protection de la vie privée

## 🔄 Mise à Jour Automatique

- **Fréquence** : Quotidienne à 06:00 UTC
- **Processus** : Entièrement automatisé via GitHub Actions
- **Déduplication** : Suppression automatique des doublons
- **Validation** : Vérification de la compatibilité AdGuard Home

## 📈 Statistiques de la Liste

Les statistiques sont mises à jour automatiquement à chaque génération :

- **Nombre total d'entrées** : Affiché dans le fichier
- **Sources traitées** : Nombre de sources récupérées avec succès
- **Doublons supprimés** : Nombre d'entrées dupliquées éliminées
- **Dernière mise à jour** : Horodatage de la dernière génération

## 🛠️ Configuration Recommandée

### AdGuard Home
1. Allez dans **Filtres → Listes de blocage DNS**
2. Cliquez sur **Ajouter une liste de blocage**
3. Collez l'URL : `https://raw.githubusercontent.com/morgannito/adguard-merged-blocklist/main/merged-blocklist.txt`
4. Nommez la liste : "AdGuard Merged Blocklist"
5. Définissez l'intervalle de mise à jour : **24 heures**

### Pi-hole
1. Allez dans **Group Management → Adlists**
2. Ajoutez l'URL dans le champ "Address"
3. Commentaire : "AdGuard Merged Blocklist - Daily Updates"
4. Cliquez sur **Add**
5. Mettez à jour : **Tools → Update Gravity**

## 🔍 Contenu de la Liste

La liste contient différents types de règles :

### Règles de Domaine
```
||ads.example.com^
||tracker.example.com^
||analytics.example.com^
```

### Format Hosts
```
0.0.0.0 malware.example.com
127.0.0.1 ads.example.com
```

### Règles de Masquage d'Éléments
```
##.advertisement
##.banner
example.com##.ads
```

### Règles d'Exception (Allowlist)
```
@@||trusted.example.com^
@@||allowlist.example.com^
```

## 📊 Historique des Mises à Jour

Consultez l'onglet [Actions](https://github.com/morgannito/adguard-merged-blocklist/actions) pour voir l'historique complet des mises à jour automatiques.

## 🤝 Contribution

Ce dépôt est généré automatiquement par [AdGuard Blocklist Merger](https://github.com/morgannito/adguard-blocklist-merger).

Pour suggérer des améliorations :
1. Ouvrez une issue sur ce dépôt
2. Ou contribuez directement au [projet principal](https://github.com/morgannito/adguard-blocklist-merger)

## 📄 Licence

Cette liste de blocage est fournie sous licence MIT. Voir [LICENSE](LICENSE) pour plus de détails.

## ⚠️ Avertissement

- Cette liste est fournie "en l'état" sans garantie
- Testez toujours avant de déployer en production
- Certains sites légitimes peuvent être bloqués par erreur
- Signalez les faux positifs via les issues GitHub

## 🔗 Liens Utiles

- **Générateur** : [AdGuard Blocklist Merger](https://github.com/morgannito/adguard-blocklist-merger)
- **Documentation AdGuard** : [AdGuard Home](https://adguard.com/en/adguard-home/overview.html)
- **Documentation Pi-hole** : [Pi-hole.net](https://pi-hole.net/)
- **Issues & Support** : [GitHub Issues](https://github.com/morgannito/adguard-merged-blocklist/issues)

---

**🤖 Généré automatiquement par AdGuard Blocklist Merger**  
**📅 Dernière mise à jour automatique : Quotidienne à 06:00 UTC**