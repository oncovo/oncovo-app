# OncovoApp

Aplicativo mobile desenvolvido com React Native seguindo as melhores práticas de desenvolvimento, Clean Architecture e padrões de código sênior.

## 🚀 Tecnologias

- **React Native** 0.83.1
- **TypeScript**
- **Clean Architecture**
- **Expo** (Bare Workflow - opcional, para EAS Build)
- **Supabase** (Backend)
- **Google Authentication**
- **Push Notifications**

## 📁 Estrutura do Projeto

```
src/
├── core/              # Configurações, constantes, utilitários e tipos
│   ├── config/        # Configurações da aplicação
│   ├── constants/     # Constantes (versão, etc)
│   ├── utils/         # Funções utilitárias
│   └── types/         # Tipos TypeScript compartilhados
├── domain/            # Camada de domínio (Clean Architecture)
│   ├── entities/      # Entidades de negócio
│   ├── repositories/  # Interfaces de repositórios
│   └── usecases/      # Casos de uso
├── data/              # Camada de dados
│   ├── datasources/   # Fontes de dados (API, Local Storage)
│   ├── models/        # Modelos de dados
│   └── repositories/  # Implementação dos repositórios
├── presentation/      # Camada de apresentação
│   ├── components/    # Componentes reutilizáveis
│   ├── screens/       # Telas da aplicação
│   └── hooks/         # Custom hooks
└── infrastructure/    # Infraestrutura
    ├── api/           # Clientes de API
    ├── storage/       # Armazenamento local
    └── services/      # Serviços externos
```

## 📚 Documentação

Toda a documentação técnica está na pasta [`docs/`](./docs/):
- [Índice da Documentação](./docs/README.md)
- [Setup do Projeto](./docs/PROJECT_SETUP.md)
- [Configuração Expo](./docs/EXPO_SETUP.md)
- [Configuração GitHub](./docs/GITHUB_SETUP.md)
- [Dependências](./docs/DEPENDENCIES.md)
- [npm vs Yarn](./docs/NPM_VS_YARN.md)

## 🛠️ Configuração do Ambiente

### Pré-requisitos

- Node.js >= 20
- React Native CLI
- Android Studio (para Android)
- Xcode (para iOS - apenas macOS)

### Instalação

1. Clone o repositório
2. Instale as dependências:
```bash
npm install
```

3. Para iOS, instale os pods:
```bash
cd ios && pod install && cd ..
```

4. Configure as variáveis de ambiente:
```bash
cp .env.example .env
```

Edite o arquivo `.env` com suas credenciais:
- Supabase URL e Key
- Google OAuth Client IDs

## 📱 Executando o Projeto

### Android
```bash
npm run android
```

### iOS
```bash
npm run ios
```

### Metro Bundler
```bash
npm start
```

### Com Expo (Opcional)
```bash
# Inicia com Expo CLI
npm run start:expo

# Executa com Expo
npm run expo:run:android
npm run expo:run:ios
```

> **Nota:** O projeto está preparado para usar Expo no modo Bare Workflow. Veja [docs/EXPO_SETUP.md](./docs/EXPO_SETUP.md) para mais detalhes.

## 🧪 Testes

### Executar todos os testes
```bash
npm test
```

### Executar testes em modo watch
```bash
npm run test:watch
```

### Gerar relatório de cobertura
```bash
npm run test:coverage
```

## 📦 Versionamento

O versionamento é gerenciado centralmente em `src/core/constants/version.ts`.

Para sincronizar as versões entre Android e iOS:
```bash
npm run version:sync
```

### Estrutura de Versão

- **versionName**: `major.minor.patch` (ex: 1.0.0)
- **versionCode/build**: Número incremental (ex: 1)

Atualize os valores em `src/core/constants/version.ts` e execute `npm run version:sync`.

## 🏗️ Arquitetura

O projeto segue os princípios de **Clean Architecture**, separando as responsabilidades em camadas:

1. **Domain**: Regras de negócio puras, independentes de frameworks
2. **Data**: Implementação de repositórios e fontes de dados
3. **Presentation**: Interface do usuário e lógica de apresentação
4. **Infrastructure**: Serviços externos e configurações

## 📝 Convenções de Código

- **Clean Code**: Código limpo, legível e manutenível
- **TypeScript**: Tipagem forte para maior segurança
- **ESLint**: Linting automático
- **Prettier**: Formatação consistente
- **Testes Unitários**: Cobertura de código crítico

## 🔐 Segurança

- Nunca commite arquivos `.env` ou credenciais
- Use variáveis de ambiente para configurações sensíveis
- Valide todas as entradas do usuário
- Implemente autenticação adequada

## 📄 Licença

Este projeto é privado e confidencial.

## 👥 Desenvolvimento

Este projeto foi desenvolvido seguindo as melhores práticas de aplicativos como Nubank, iFood, Inter e Uber, focando em:

- Performance otimizada
- Experiência do usuário excepcional
- Código escalável e manutenível
- Testes abrangentes
- Arquitetura robusta

---

**Desenvolvido com ❤️ seguindo padrões de código sênior**
