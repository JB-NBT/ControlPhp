# Partie 5 : Commandes de capture réseau

## Capture avec tcpdump

### Capture du trafic vers le système d'authentification
```bash
sudo tcpdump -i any -w auth_capture.pcap port 80 and host 192.168.56.111
```

### Capture des requêtes POST (connexions)
```bash
sudo tcpdump -i any -A -s 0 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)' | grep -E "POST|username|password"
```

### Capture spécifique login.php
```bash
sudo tcpdump -i any -A port 80 | grep -E "login.php|username|password"
```

## Analyse dans Wireshark

### Filtres utiles
- Requêtes POST : `http.request.method == POST`
- Vers login.php : `http.request.uri contains "login.php"`
- Vers register.php : `http.request.uri contains "register.php"`
- Trafic HTTP : `http`
- IP du serveur : `ip.addr == 192.168.56.111`

### Étapes d'analyse
1. Ouvrir le fichier .pcap dans Wireshark
2. Appliquer le filtre `http.request.method == POST`
3. Clic droit sur un paquet → Follow → HTTP Stream
4. Analyser les headers et payloads
5. File → Export Specified Packets pour sauvegarder
