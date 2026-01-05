# 🔧 Solução de Problemas

## Erro: "Property 'require' doesn't exist"

Este erro geralmente ocorre quando há problemas com o Metro bundler ou conflitos entre React Native CLI e Expo.

### Solução 1: Limpar Cache do Metro

```bash
# Parar o Metro bundler (Ctrl+C)
# Limpar cache e reiniciar
npx react-native start --reset-cache
```

### Solução 2: Limpar Todos os Caches

```bash
# Limpar cache do npm
npm start -- --reset-cache

# Limpar node_modules e reinstalar
rm -rf node_modules
npm install

# Para iOS, limpar pods
cd ios
rm -rf Pods Podfile.lock
pod install
cd ..

# Limpar cache do watchman (se instalado)
watchman watch-del-all

# Limpar cache do Metro
rm -rf /tmp/metro-*
rm -rf /tmp/haste-*

# Reiniciar Metro
npm start -- --reset-cache
```

### Solução 3: Verificar Configuração do Metro

Certifique-se de que o `metro.config.js` está correto:

```javascript
const { getDefaultConfig, mergeConfig } = require('@react-native/metro-config');

const config = {};

module.exports = mergeConfig(getDefaultConfig(__dirname), config);
```

### Solução 4: Verificar Babel Config

O `babel.config.js` deve ter o preset correto:

```javascript
module.exports = {
  presets: ['module:@react-native/babel-preset'],
  plugins: [
    // seus plugins aqui
  ],
};
```

### Solução 5: Rebuild do App

```bash
# Android
cd android
./gradlew clean
cd ..
npm run android

# iOS
cd ios
xcodebuild clean
cd ..
npm run ios
```

### Solução 6: Se Usando Expo

Se você instalou Expo mas não está usando, pode haver conflito:

```bash
# Opção A: Remover Expo (se não for usar)
npm uninstall expo @expo/config-plugins

# Opção B: Usar Expo corretamente
npm run start:expo
```

### Solução 7: Verificar Versões

Certifique-se de que as versões são compatíveis:

```bash
node --version  # Deve ser >= 20
npm --version
npx react-native --version
```

## Outros Erros Comuns

### Erro: "Unable to resolve module"

```bash
# Limpar cache e reinstalar
rm -rf node_modules
npm install
npm start -- --reset-cache
```

### Erro: "Metro bundler has encountered an error"

```bash
# Limpar todos os caches
watchman watch-del-all
rm -rf node_modules
npm install
npm start -- --reset-cache
```

### Erro no iOS: "Pod install failed"

```bash
cd ios
rm -rf Pods Podfile.lock
pod deintegrate
pod install
cd ..
```

### Erro no Android: "Build failed"

```bash
cd android
./gradlew clean
./gradlew --stop
cd ..
npm run android
```

## Comandos Úteis

```bash
# Verificar se há processos do Metro rodando
lsof -ti:8081 | xargs kill -9  # macOS/Linux
netstat -ano | findstr :8081    # Windows

# Limpar tudo e começar do zero
rm -rf node_modules
rm -rf ios/Pods ios/Podfile.lock
rm -rf android/.gradle android/app/build
npm install
cd ios && pod install && cd ..
npm start -- --reset-cache
```
