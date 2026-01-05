# 🚀 Configuração do GitHub

## ✅ Status Atual

- ✅ Repositório Git inicializado
- ✅ Commit inicial realizado
- ✅ Branch principal: `main`
- ⏳ Aguardando criação do repositório no GitHub

## 📋 Passos para fazer push do projeto

### 1. Criar o repositório no GitHub

**Opção A: Via Interface Web (Recomendado)**
1. Acesse: https://github.com/organizations/oncovo/repositories/new
2. Preencha:
   - **Nome do repositório:** `oncovo-app` (ou outro nome de sua preferência)
   - **Visibilidade:** Público ou Privado (conforme necessário)
   - **⚠️ IMPORTANTE:** NÃO marque "Add a README file", "Add .gitignore" ou "Choose a license" (já temos esses arquivos)
3. Clique em "Create repository"

**Opção B: Via GitHub CLI**
```bash
gh repo create oncovo/oncovo-app --public --source=. --remote=origin --push
```

**Configurações recomendadas:**
- **Nome do repositório:** `oncovo-app` (ou outro nome de sua preferência)
- **Visibilidade:** Público ou Privado (conforme necessário)
- **NÃO** inicialize com README, .gitignore ou licença (já temos)

### 2. Configurar o remote e fazer push

**Opção A: Usando o script PowerShell (Windows)**
```powershell
# Substitua "oncovo-app" pelo nome do repositório que você criou
.\scripts\setup-github.ps1 -RepositoryName "oncovo-app"

# Depois faça o push
git push -u origin main
```

**Opção B: Comandos manuais**
```bash
# Adicionar remote (substitua SEU_REPOSITORIO pelo nome real)
git remote add origin https://github.com/oncovo/SEU_REPOSITORIO.git

# Ou se usar SSH:
# git remote add origin git@github.com:oncovo/SEU_REPOSITORIO.git

# Fazer push (branch main já está configurada)
git push -u origin main
```

**Nota:** O commit inicial já foi feito! Você só precisa configurar o remote e fazer push.

### 3. Verificar

Após o push, verifique em: https://github.com/oncovo/SEU_REPOSITORIO

## 🔐 Autenticação

### Opção 1: Personal Access Token (HTTPS)
1. Vá em: GitHub Settings > Developer settings > Personal access tokens > Tokens (classic)
2. Crie um token com permissões `repo`
3. Use o token como senha ao fazer push

### Opção 2: SSH (Recomendado)
1. Gere uma chave SSH: `ssh-keygen -t ed25519 -C "seu-email@exemplo.com"`
2. Adicione ao GitHub: Settings > SSH and GPG keys
3. Use a URL SSH ao adicionar o remote

## 📝 Estrutura do Commit

O projeto segue Conventional Commits:
- `feat:` - Nova funcionalidade
- `fix:` - Correção de bug
- `docs:` - Documentação
- `style:` - Formatação
- `refactor:` - Refatoração
- `test:` - Testes
- `chore:` - Tarefas de manutenção

## 🎯 Próximos Passos

Após fazer o push inicial:
1. Configurar GitHub Actions (CI/CD) - opcional
2. Configurar branch protection rules
3. Adicionar colaboradores
4. Configurar issues e projetos
