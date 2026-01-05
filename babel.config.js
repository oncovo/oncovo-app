module.exports = {
  presets: ['module:@react-native/babel-preset'],
  plugins: [
    [
      'module-resolver',
      {
        root: ['./src'],
        extensions: ['.ios.js', '.android.js', '.js', '.ts', '.tsx', '.json'],
        alias: {
          '@': './src',
          '@/core': './src/core',
          '@/domain': './src/domain',
          '@/data': './src/data',
          '@/presentation': './src/presentation',
          '@/infrastructure': './src/infrastructure',
        },
      },
    ],
  ],
};
