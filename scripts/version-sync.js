/**
 * Script to synchronize version numbers across Android and iOS
 * Run: node scripts/version-sync.js
 */

const fs = require('fs');
const path = require('path');

// Read version from centralized file
const versionFile = path.join(__dirname, '../src/core/constants/version.ts');
const versionContent = fs.readFileSync(versionFile, 'utf8');

// Extract version numbers
const majorMatch = versionContent.match(/major:\s*(\d+)/);
const minorMatch = versionContent.match(/minor:\s*(\d+)/);
const patchMatch = versionContent.match(/patch:\s*(\d+)/);
const buildMatch = versionContent.match(/build:\s*(\d+)/);

if (!majorMatch || !minorMatch || !patchMatch || !buildMatch) {
  console.error('Error: Could not parse version from version.ts');
  process.exit(1);
}

const major = majorMatch[1];
const minor = minorMatch[1];
const patch = patchMatch[1];
const build = buildMatch[1];

const versionName = `${major}.${minor}.${patch}`;
const versionCode = build;

console.log(`Syncing version: ${versionName} (build ${versionCode})`);

// Update Android build.gradle
const androidBuildGradle = path.join(__dirname, '../android/app/build.gradle');
let androidContent = fs.readFileSync(androidBuildGradle, 'utf8');
androidContent = androidContent.replace(
  /versionCode\s+\d+/,
  `versionCode ${versionCode}`
);
androidContent = androidContent.replace(
  /versionName\s+"[^"]+"/,
  `versionName "${versionName}"`
);
fs.writeFileSync(androidBuildGradle, androidContent);
console.log('✓ Updated Android build.gradle');

// Update iOS project.pbxproj
const iosProject = path.join(__dirname, '../ios/OncovoApp.xcodeproj/project.pbxproj');
let iosContent = fs.readFileSync(iosProject, 'utf8');
iosContent = iosContent.replace(
  /CURRENT_PROJECT_VERSION\s*=\s*\d+;/g,
  `CURRENT_PROJECT_VERSION = ${versionCode};`
);
iosContent = iosContent.replace(
  /MARKETING_VERSION\s*=\s*[^;]+;/g,
  `MARKETING_VERSION = ${versionName};`
);
fs.writeFileSync(iosProject, iosContent);
console.log('✓ Updated iOS project.pbxproj');

// Update package.json
const packageJson = path.join(__dirname, '../package.json');
const packageContent = JSON.parse(fs.readFileSync(packageJson, 'utf8'));
packageContent.version = versionName;
fs.writeFileSync(packageJson, JSON.stringify(packageContent, null, 2) + '\n');
console.log('✓ Updated package.json');

console.log('\nVersion sync completed successfully!');
