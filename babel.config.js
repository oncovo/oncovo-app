// Use Expo preset if available, otherwise use React Native preset
let presets = [];
let plugins = [];

try {
  // Try to use Expo preset
  require.resolve('babel-preset-expo');
  presets = ['babel-preset-expo'];
} catch (e) {
  // Fallback to React Native preset
  presets = ['module:@react-native/babel-preset'];
}

plugins = [
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
];

module.exports = {
  presets,
  plugins,
};
