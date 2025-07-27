// ignore_for_file: avoid_print
import 'dart:io';

void main() {
  incrementPubspecVersion();
}

int incrementPubspecVersion() {
  final pubspecFile = File('pubspec.yaml');
  final lines = pubspecFile.readAsLinesSync();

  // find version line
  final versionIndex = lines.indexWhere((line) => line.startsWith('version:'));

  if (versionIndex == -1) {
    print('No version found in pubspec.yaml');
    return 1;
  }

  final versionLine = lines[versionIndex];
  final version = versionLine.split(' ').last.trim();

  // verson + buildNumber
  final parts = version.split('+');
  final versionNumber = parts[0];
  int versionNumberLast = 0;
  int buildNumber = 0;
  var versionNumbers = versionNumber.split(".");
  try {
    versionNumberLast = int.parse(versionNumbers.last);
    buildNumber = int.parse(parts[1]);
  } catch (ignored) {
    print('Invalid version or build numbe. set to 0');
  }
  // new version string
  final newVersion =
      '${versionNumbers.first}.${versionNumbers[1]}.${versionNumberLast + 1}+${buildNumber + 1}';

  lines[versionIndex] = 'version: $newVersion';

  // update pubspec.yaml file
  pubspecFile.writeAsStringSync(lines.join('\n'));

  print('pubspec version: $newVersion');
  return buildNumber + 1;
}

