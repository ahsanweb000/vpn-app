String formatBytes(int bytes) {
  if (bytes <= 0) return '0 B';
  const List<String> units = ['B', 'KB', 'MB', 'GB', 'TB'];
  double value = bytes.toDouble();
  int unitIndex = 0;
  while (value >= 1024 && unitIndex < units.length - 1) {
    value /= 1024;
    unitIndex++;
  }
  if (unitIndex == 0) {
    return '$bytes B';
  }
  return '${value.toStringAsFixed(1)} ${units[unitIndex]}';
}

String formatSpeed(num bytesPerSecond) {
  if (bytesPerSecond <= 0) return '0.0 Mbps';
  // Bits per second
  final double bitsPerSec = bytesPerSecond * 8.0;
  if (bitsPerSec >= 1000000) {
    final double mbps = bitsPerSec / 1000000;
    return '${mbps.toStringAsFixed(1)} Mbps';
  } else {
    final double kbps = bitsPerSec / 1000;
    return '${kbps.toStringAsFixed(0)} Kbps';
  }
}

String formatDuration(Duration duration) {
  final int hours = duration.inHours;
  final int minutes = duration.inMinutes.remainder(60);
  final int seconds = duration.inSeconds.remainder(60);
  final String h = hours.toString().padLeft(2, '0');
  final String m = minutes.toString().padLeft(2, '0');
  final String s = seconds.toString().padLeft(2, '0');
  return '$h:$m:$s';
}
