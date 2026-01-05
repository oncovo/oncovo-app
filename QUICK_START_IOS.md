# 🍎 Rodar App no iPhone - Guia Prático (Sem Mac)

## ⚠️ Limitação Importante

**Sem Mac, você NÃO pode compilar iOS nativamente.** Mas há alternativas!

## 🎯 Opções Disponíveis

### Opção 1: Expo Go (Mais Rápida) ⭐

**Funciona:** Sim, mas com limitações  
**Tempo:** 5 minutos  
**Custo:** Gratuito

#### Passo a Passo:

1. **Instalar Expo Go no iPhone:**
   - Abra App Store
   - Procure "Expo Go"
   - Instale (gratuito)

2. **Instalar Expo no projeto:**
   ```bash
   npm install expo
   ```

3. **Configurar app.json:**
   ```json
   {
     "expo": {
       "name": "Oncovo",
       "slug": "oncovo-app",
       "version": "1.0.0",
       "platforms": ["ios", "android"]
     }
   }
   ```

4. **Iniciar servidor:**
   ```bash
   npx expo start
   ```

5. **Conectar iPhone:**
   - Certifique-se que iPhone e PC estão na **mesma rede Wi-Fi**
   - Escaneie o QR code com Expo Go
   - App carrega automaticamente!

**⚠️ Problema:** React Native 0.83.1 pode não ser compatível com Expo ainda.

---

### Opção 2: EAS Build (Build na Nuvem) ⭐⭐

**Funciona:** Sim, completo  
**Tempo:** 15-30 minutos (primeira vez)  
**Custo:** Gratuito (com limites)

#### Passo a Passo:

1. **Instalar EAS CLI:**
   ```bash
   npm install -g eas-cli
   ```

2. **Login:**
   ```bash
   eas login
   # Crie conta gratuita se não tiver
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
   - Instale o app

**✅ Vantagem:** App completo, sem limitações!

---

### Opção 3: Mac na Nuvem (Pago)

**Serviços:**
- MacStadium (~$50/mês)
- AWS EC2 Mac (~$1/hora)
- MacinCloud (~$20-50/mês)

**Como usar:**
1. Alugar Mac na nuvem
2. Conectar via VNC/SSH
3. Compilar normalmente

---

### Opção 4: Desenvolver no Android (Recomendado para Agora)

**Estratégia:**
- ✅ Desenvolva no Android (já está funcionando!)
- ✅ Teste lógica e UI
- ✅ Quando precisar testar iOS, use EAS Build
- ✅ Para produção, contrate alguém com Mac ou use EAS Build

---

## 🚀 Solução Imediata Recomendada

### Para Testar AGORA no iPhone:

**Tente Expo Go primeiro:**

```bash
# 1. Instalar Expo
npm install expo

# 2. Configurar app.json (já está pronto)

# 3. Iniciar
npx expo start

# 4. Escanear QR code no Expo Go
```

**Se não funcionar** (por incompatibilidade):

```bash
# Use EAS Build
npm install -g eas-cli
eas login
eas build:configure
eas build --platform ios
```

---

## 📱 Passo a Passo Detalhado: Expo Go

### 1. Preparar o Projeto

```bash
# Instalar Expo
npm install expo

# Verificar
npx expo --version
```

### 2. Configurar app.json

Edite `app.json`:

```json
{
  "name": "OncovoApp",
  "displayName": "Oncovo",
  "expo": {
    "name": "Oncovo",
    "slug": "oncovo-app",
    "version": "1.0.0",
    "platforms": ["ios", "android"],
    "ios": {
      "bundleIdentifier": "com.oncovoapp"
    }
  }
}
```

### 3. Instalar Expo Go no iPhone

- App Store → "Expo Go" → Instalar

### 4. Executar

```bash
# Iniciar servidor
npx expo start

# Você verá:
# - QR Code no terminal
# - Link local (ex: exp://192.168.1.100:8081)
```

### 5. Conectar

**Opção A: QR Code (Recomendado)**
1. Abra Expo Go no iPhone
2. Toque em "Scan QR Code"
3. Escaneie o QR code do terminal
4. App carrega!

**Opção B: Link Direto**
1. Abra Expo Go
2. Toque em "Enter URL manually"
3. Digite o link que aparece no terminal
4. App carrega!

### 6. Se Não Conectar

**Problema: Redes diferentes**
```bash
# Use tunnel (mais lento)
npx expo start --tunnel
```

**Problema: Firewall**
- Desative temporariamente o firewall do Windows
- Ou permita a porta 8081

---

## ⚠️ Limitações do Expo Go

- ❌ Algumas bibliotecas nativas não funcionam
- ❌ Performance pode ser diferente
- ❌ Não testa código nativo customizado

**Mas funciona para:**
- ✅ Testar UI
- ✅ Testar lógica de negócio
- ✅ Ver como fica no iPhone
- ✅ Desenvolvimento rápido

---

## 💡 Estratégia Recomendada

1. **Desenvolvimento Principal:** Android (você já tem)
2. **Testes Rápidos iOS:** Expo Go (quando possível)
3. **Builds Finais iOS:** EAS Build (quando necessário)
4. **Produção:** EAS Build ou Mac na nuvem

---

## 📚 Documentação Completa

Veja `docs/IOS_WITHOUT_MAC.md` para guia completo com todas as opções.

---

**Dica:** Comece testando com Expo Go. Se funcionar, ótimo! Se não, use EAS Build para builds completos.
