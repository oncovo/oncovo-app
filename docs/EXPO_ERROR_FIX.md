# 🔧 Erro "require doesn't exist" no Expo Go - Solução

## ⚠️ Problema Identificado

O erro `ReferenceError: Property 'require' doesn't exist` no iPhone via Expo Go é causado por **incompatibilidade entre React Native 0.83.1 e Expo SDK 54**.

## 🎯 Soluções Disponíveis

### Solução 1: Usar EAS Build (Recomendado) ⭐

**EAS Build compila na nuvem e gera um app completo que funciona no iPhone.**

#### Passo a Passo:

1. **Instalar EAS CLI:**
   ```bash
   npm install -g eas-cli
   ```

2. **Login:**
   ```bash
   eas login
   # Crie uma conta gratuita se não tiver
   ```

3. **Configurar projeto:**
   ```bash
   eas build:configure
   ```

4. **Build para iOS:**
   ```bash
   eas build --platform ios
   ```

5. **Aguardar build** (15-30 minutos)

6. **Instalar no iPhone:**
   - Você receberá um link
   - Abra no iPhone
   - Instale o app (pode precisar de perfil de desenvolvedor)

**✅ Vantagem:** App completo, sem limitações do Expo Go!

---

### Solução 2: Ajustar Configuração do Metro (Tentativa)

Pode funcionar em alguns casos:

1. **Criar `metro.config.js` compatível com Expo:**
   ```javascript
   const { getDefaultConfig } = require('expo/metro-config');
   const { mergeConfig } = require('@react-native/metro-config');

   const config = getDefaultConfig(__dirname);

   module.exports = mergeConfig(config, {
     // suas configurações aqui
   });
   ```

2. **Limpar cache:**
   ```bash
   npx expo start --clear
   ```

3. **Tentar novamente**

**⚠️ Nota:** Pode não funcionar devido à incompatibilidade fundamental.

---

### Solução 3: Desenvolver no Android (Recomendado para Agora)

**Estratégia prática:**

1. ✅ **Desenvolva no Android** (já está funcionando!)
2. ✅ **Teste lógica e UI** no Android
3. ✅ **Use EAS Build** quando precisar testar no iPhone
4. ✅ **Para produção**, use EAS Build ou Mac na nuvem

---

### Solução 4: Usar React Native Web (Teste UI)

Para testar a UI sem iPhone:

```bash
# Instalar React Native Web
npm install react-native-web

# Executar no navegador
npx expo start --web
```

---

## 🔍 Por Que Isso Acontece?

- **React Native 0.83.1** é muito novo
- **Expo SDK 54** ainda não tem suporte completo
- **Expo Go** usa uma versão específica do runtime que não suporta todas as features do RN 0.83.1

## ✅ Recomendação Final

**Para testar no iPhone AGORA:**

1. **Use EAS Build** - É a forma mais confiável
2. **Desenvolva no Android** - Para desenvolvimento diário
3. **Use EAS Build** - Quando precisar testar no iPhone

**Para desenvolvimento contínuo:**

- Desenvolva no Android (já funciona)
- Use EAS Build para builds iOS quando necessário
- Quando Expo SDK atualizar, poderá usar Expo Go novamente

---

## 📝 Comandos Rápidos

```bash
# EAS Build (Recomendado)
npm install -g eas-cli
eas login
eas build:configure
eas build --platform ios

# Limpar cache Expo
npx expo start --clear

# Testar no navegador
npx expo start --web
```

---

**Conclusão:** O erro é esperado devido à incompatibilidade. Use EAS Build para gerar um app completo que funciona no iPhone, ou continue desenvolvendo no Android que já está funcionando perfeitamente.
