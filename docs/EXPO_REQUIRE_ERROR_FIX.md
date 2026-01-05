# 🔧 Erro "require doesn't exist" - Solução Definitiva

## ⚠️ Problema Persistente

Mesmo após o downgrade para React Native 0.81.5, o erro `Property 'require' doesn't exist` ainda aparece no Expo Go.

## 🔍 Possíveis Causas

1. **Cache do Expo Go no iPhone** - App pode estar usando cache antigo
2. **Configuração do Metro** - Pode não estar usando configuração do Expo corretamente
3. **Babel Preset** - Pode precisar usar `babel-preset-expo` ao invés de `@react-native/babel-preset`
4. **Cache do Metro** - Cache corrompido no servidor

## ✅ Soluções Aplicadas

### 1. Metro Config Atualizado
- Agora usa exclusivamente `expo/metro-config`
- Configuração simplificada para Expo

### 2. Babel Config Atualizado
- Usa `babel-preset-expo` quando disponível
- Fallback para React Native preset se necessário

### 3. Script de Limpeza Completa
- `scripts/clean-all.ps1` criado
- Limpa tudo: node_modules, caches, builds

## 🚀 Passos para Resolver

### Passo 1: Limpeza Completa

```powershell
# Execute o script de limpeza
.\scripts\clean-all.ps1

# Ou manualmente:
Remove-Item -Recurse -Force node_modules
Remove-Item package-lock.json
npm cache clean --force
```

### Passo 2: Reinstalar Dependências

```powershell
npm install
```

### Passo 3: Limpar Cache do Expo Go no iPhone

**No iPhone:**
1. Feche completamente o Expo Go (swipe up e feche)
2. Abra novamente o Expo Go
3. Ou desinstale e reinstale o Expo Go

### Passo 4: Iniciar com Cache Limpo

```powershell
# Limpar cache e iniciar
npx expo start --clear

# Ou
npm run start:expo -- --clear
```

### Passo 5: Escanear QR Code Novamente

1. Certifique-se que iPhone e PC estão na **mesma rede Wi-Fi**
2. Escaneie o QR code novamente
3. Se não funcionar, tente usar `--tunnel`:
   ```powershell
   npx expo start --tunnel --clear
   ```

## 🔄 Se Ainda Não Funcionar

### Opção A: Usar EAS Build (Mais Confiável)

```bash
npm install -g eas-cli
eas login
eas build:configure
eas build --platform ios
```

### Opção B: Verificar Logs

```bash
# Ver logs detalhados
npx expo start --clear --verbose
```

### Opção C: Testar no Android Primeiro

```bash
# Verificar se funciona no Android
npm run android
```

Se funcionar no Android mas não no iPhone, o problema é específico do Expo Go.

## 📝 Checklist de Verificação

- [ ] Versões corretas instaladas (RN 0.81.5, React 19.1.0)
- [ ] `babel-preset-expo` instalado
- [ ] `metro.config.js` usando `expo/metro-config`
- [ ] `babel.config.js` usando `babel-preset-expo`
- [ ] Cache limpo (`--clear`)
- [ ] Expo Go fechado e reaberto no iPhone
- [ ] iPhone e PC na mesma rede Wi-Fi
- [ ] Sem processos antigos do Metro rodando

## ⚠️ Limitação Conhecida

O Expo Go pode ter problemas com:
- Path aliases (`@/core`, etc.)
- Algumas configurações customizadas do Babel
- Module resolver customizado

**Solução:** Se o problema persistir, use **EAS Build** para gerar um app completo.

---

**Status:** Configurações atualizadas. Execute a limpeza completa e teste novamente.
