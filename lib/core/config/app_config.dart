class AppConfig {
  AppConfig._();

  // Owner inputs - TEMP - replace before release
  static const String appName = 'VPN'; // TEMP - replace before release
  static const String applicationId = 'com.devbuild.vpn'; // TEMP - replace before release
  static const String supportEmail = 'ahsanweb000@gmail.com'; // TEMP - replace before release
  static const String privacyPolicyUrl =
      'https://ahsanweb000.github.io/vpn-site/privacy.html'; // TEMP - replace before release
  static const String termsUrl =
      'https://ahsanweb000.github.io/vpn-site/terms.html'; // TEMP - replace before release
  static const String serversJsonUrl =
      'https://ahsanweb000.github.io/vpn-site/servers.json'; // TEMP - replace before release
  static const String sourceCodeUrl =
      'https://github.com/ahsanweb000/vpn-app'; // TEMP - replace before release

  // Play Store URL
  static const String playStoreUrl =
      'https://play.google.com/store/apps/details?id=$applicationId';

  // Free external endpoints (Master spec §7)
  static const String cloudflareTraceUrl =
      'https://www.cloudflare.com/cdn-cgi/trace';
  static const String ipWhoIsUrl = 'https://ipwho.is/';
  static const String freeIpApiUrl = 'https://free.freeipapi.com/api/json/';
  static const String speedDownloadBaseUrl =
      'https://speed.cloudflare.com/__down?bytes=';
  static const String speedUploadUrl = 'https://speed.cloudflare.com/__up';
  static const String speedPingUrl =
      'https://speed.cloudflare.com/__down?bytes=0';

  // Timings
  static const Duration splashMinDuration = Duration(seconds: 2);
  static const Duration serversFetchTimeout = Duration(seconds: 10);
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration latencyTimeout = Duration(seconds: 2);
  static const Duration latencyRefreshInterval = Duration(seconds: 60);
  static const Duration rewardedPassDuration = Duration(minutes: 30);
  static const Duration ipCacheDuration = Duration(minutes: 10);

  // Speed test parameters
  static const Duration downloadTestDuration = Duration(seconds: 10);
  static const Duration uploadTestDuration = Duration(seconds: 8);
  static const int pingSamples = 8;

  // In-app purchase product IDs (Phase 07)
  static const String weeklyProductId = 'premium_weekly';
  static const String lifetimeProductId = 'premium_lifetime';
}
