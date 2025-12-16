# SSH Instalation

Create ssh folder at $HOME
```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
```

Unzip ssh-keys backup
```bash
cd ~/.ssh
unzip ssh_keys_backup.zip
chmod 600 ~/.ssh/id_ed25519_domain
rm ssh_keys_backup.zip
```

Test ssh connection

```bash
ssh -T git@domain.com
```

Add keys to ssh-agent

```bash
ssh-add id_ed25519_domain
```

Generate public keys if you needed
```bash
ssk-keygen -t ed25519 -C "email"
```

For create backup
```bash
zip -e ssh_keys_backup.zip file file 
```
