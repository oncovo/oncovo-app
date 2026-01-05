# 🚀 Configuração Expo - Bare Workflow

## ✅ Status: Projeto preparado para Expo Bare Workflow

O projeto foi configurado para usar **Expo no modo Bare Workflow**, o que significa:

- ✅ Mantém acesso completo ao código nativo (Android/iOS)
- ✅ Pode usar EAS Build para builds na nuvem
- ✅ Pode usar Expo Go para desenvolvimento (com algumas limitações)
- ✅ Compatível com todas as bibliotecas nativas
- ✅ Mantém a estrutura Clean Architecture

## 📦 Instalação do Expo

Para usar Expo, você precisa instalar as dependências:

```bash
npm install expo
npm install --save-dev @expo/config-plugins
```

## 🎯 Opções de Desenvolvimento

### Opção 1: Desenvolvimento Tradicional (Recomendado para este projeto)
```bash
# Usa React Native CLI diretamente
npm start
npm run android
npm run ios
```

### Opção 2: Usar Expo CLI
```bash
# Inicia o Metro bundler com Expo
npm run start:expo

# Executa no dispositivo/emulador
npm run expo:run:android
npm run expo:run:ios
```

### Opção 3: Expo Go (Desenvolvimento Rápido)
```bash
# Inicia o servidor Expo
npm run start:expo

# Escaneie o QR code com Expo Go app
# ⚠️ Limitação: Algumas bibliotecas nativas não funcionam no Expo Go
```

## 🏗️ EAS Build (Builds na Nuvem)

Para usar EAS Build (recomendado para produção):

1. **Instalar EAS CLI:**
```bash
npm install -g eas-cli
```

2. **Login no Expo:**
```bash
eas login
```

3. **Configurar projeto:**
```bash
eas build:configure
```

4. **Criar build:**
```bash
# Android
eas build --platform android

# iOS
eas build --platform ios

# Ambos
eas build --platform all
```

## 📝 Configurações Importantes

### app.json
O arquivo `app.json` foi configurado com:
- ✅ Bundle identifiers (Android e iOS)
- ✅ Versionamento
- ✅ Configurações básicas do Expo

### Compatibilidade
- ✅ React Native 0.83.1
- ✅ TypeScript
- ✅ Clean Architecture mantida
- ✅ Todas as estruturas preservadas

## ⚠️ Limitações do Expo Go

Se você usar **Expo Go** para desenvolvimento:
- ❌ Bibliotecas nativas customizadas podem não funcionar
- ❌ Supabase pode precisar de configuração adicional
- ❌ Google Sign-In pode precisar de configuração nativa
- ❌ Notificações push precisam de configuração nativa

**Recomendação:** Use desenvolvimento tradicional (`npm run android/ios`) ou EAS Build para desenvolvimento completo.

## 🔧 Próximos Passos

1. **Instalar Expo (quando necessário):**
```bash
npm install expo @expo/config-plugins
```

2. **Configurar EAS (opcional, para builds na nuvem):**
```bash
npm install -g eas-cli
eas login
eas build:configure
```

3. **Desenvolver normalmente:**
   - A estrutura do projeto permanece a mesma
   - Clean Architecture mantida
   - Todas as funcionalidades nativas disponíveis

## 📚 Recursos

- [Expo Bare Workflow Docs](https://docs.expo.dev/bare/overview/)
- [EAS Build Docs](https://docs.expo.dev/build/introduction/)
- [Expo Config Plugins](https://docs.expo.dev/config-plugins/introduction/)

---

**Nota:** O projeto está **100% compatível** com Expo Bare Workflow. Você pode usar Expo quando quiser, mas não é obrigatório. O desenvolvimento tradicional continua funcionando normalmente.
