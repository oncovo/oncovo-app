# 🔐 Instruções para Push no GitHub

## ⚠️ Problema de Autenticação

O repositório foi configurado, mas é necessário autenticar para fazer push.

## 🔑 Opções de Autenticação

### Opção 1: Personal Access Token (HTTPS) - Recomendado

1. **Criar um Personal Access Token:**
   - Acesse: https://github.com/settings/tokens
   - Clique em "Generate new token" > "Generate new token (classic)"
   - Dê um nome (ex: "oncovo-app-dev")
   - Selecione o escopo: `repo` (acesso completo aos repositórios)
   - Clique em "Generate token"
   - **⚠️ COPIE O TOKEN** (você não verá novamente!)

2. **Fazer push usando o token:**
   ```bash
   git push -u origin main
   ```
   - Username: seu usuário do GitHub
   - Password: **cole o token** (não sua senha!)

### Opção 2: SSH (Mais Seguro)

1. **Verificar se já tem chave SSH:**
   ```bash
   ls ~/.ssh
   ```

2. **Criar chave SSH (se não tiver):**
   ```bash
   ssh-keygen -t ed25519 -C "seu-email@exemplo.com"
   ```

3. **Copiar chave pública:**
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```

4. **Adicionar ao GitHub:**
   - Acesse: https://github.com/settings/keys
   - Clique em "New SSH key"
   - Cole a chave pública
   - Salve

5. **Alterar remote para SSH:**
   ```bash
   git remote set-url origin git@github.com:oncovo/oncovo-app.git
   git push -u origin main
   ```

### Opção 3: GitHub CLI (Mais Fácil)

1. **Instalar GitHub CLI:**
   ```bash
   winget install GitHub.cli
   # ou baixe de: https://cli.github.com/
   ```

2. **Fazer login:**
   ```bash
   gh auth login
   ```

3. **Fazer push:**
   ```bash
   git push -u origin main
   ```

## ✅ Verificar se funcionou

Após fazer push, verifique em:
https://github.com/oncovo/oncovo-app

Você deve ver:
- ✅ README.md
- ✅ Estrutura completa do projeto
- ✅ 2 commits

## 🆘 Problemas Comuns

### "Repository not found"
- Verifique se você tem acesso à organização `oncovo`
- Verifique se o repositório existe: https://github.com/oncovo/oncovo-app
- Verifique se está autenticado

### "Permission denied"
- Use Personal Access Token ao invés de senha
- Verifique se o token tem permissão `repo`
- Tente usar SSH

### "Authentication failed"
- Token pode ter expirado
- Verifique se copiou o token completo
- Tente criar um novo token
