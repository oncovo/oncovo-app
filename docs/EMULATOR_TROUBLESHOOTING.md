# 🔧 Solução de Problemas - Emulador Android

## Tela em Branco no Emulador

Se o app foi instalado mas mostra apenas uma tela branca, siga estes passos:

### 1. Verificar Metro Bundler

O Metro Bundler precisa estar rodando na porta 8081:

```powershell
# Verificar se está rodando
Get-NetTCPConnection -LocalPort 8081

# Se não estiver, iniciar
npm start
```

### 2. Recarregar o App

No emulador, pressione:
- **R** duas vezes (RR) para recarregar
- Ou agite o dispositivo (Ctrl+M) e selecione "Reload"

### 3. Verificar Logs

```powershell
# Ver logs do Android
npx react-native log-android

# Ou usar adb diretamente
adb logcat *:E ReactNative:V ReactNativeJS:V
```

### 4. Limpar e Reinstalar

```powershell
# Limpar build
cd android
.\gradlew clean
cd ..

# Reinstalar
npm run android
```

### 5. Verificar Erros Comuns

#### Erro: "Unable to connect to Metro"
- Certifique-se de que o Metro está rodando: `npm start`
- Verifique se a porta 8081 está livre
- Tente: `npm start -- --reset-cache`

#### Erro: "ReferenceError: Property 'require' doesn't exist"
- Limpe o cache: `npm start -- --reset-cache`
- Reinstale dependências: `rm -rf node_modules && npm install`

#### Erro: "Network request failed"
- Verifique se o emulador tem acesso à internet
- No emulador: Settings > Network > Verificar conexão

### 6. Debugging no Chrome

1. Agite o dispositivo (Ctrl+M no emulador)
2. Selecione "Debug"
3. Abra Chrome em: `http://localhost:8081/debugger-ui/`
4. Abra DevTools (F12)

### 7. Verificar Configuração do App

Certifique-se de que o `index.js` está correto:

```javascript
import { AppRegistry } from 'react-native';
import App from './src/presentation/App';
import { name as appName } from './app.json';

AppRegistry.registerComponent(appName, () => App);
```

### 8. Resetar Emulador

Se nada funcionar:

```powershell
# Fechar emulador
# No Android Studio: Tools > AVD Manager > Cold Boot Now

# Ou via adb
adb emu kill
```

## Comandos Úteis

```powershell
# Verificar dispositivos conectados
adb devices

# Reiniciar adb
adb kill-server
adb start-server

# Limpar dados do app
adb shell pm clear com.oncovoapp

# Reinstalar app
adb install -r android\app\build\outputs\apk\debug\app-debug.apk
```

## Checklist de Verificação

- [ ] Metro Bundler está rodando (`npm start`)
- [ ] Porta 8081 está livre
- [ ] Emulador está conectado (`adb devices`)
- [ ] App foi instalado corretamente
- [ ] Não há erros nos logs (`npx react-native log-android`)
- [ ] Cache foi limpo (`npm start -- --reset-cache`)

## Próximos Passos

Se o problema persistir:
1. Verifique os logs completos
2. Tente em um dispositivo físico
3. Verifique a versão do React Native
4. Consulte [TROUBLESHOOTING.md](./TROUBLESHOOTING.md) para mais soluções
