// ignore_for_file: constant_identifier_names

enum Flavor {
  DEV,
  STAGE,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static final sharedMap = {
    'ipAddress': '127.0.0.1',
    'username': 'username',
    'password': 'password',
    'googleAPIKey': 'googleAPIKey',
  };

  static final devMap = {
    'title': '[DEV] Pinang Maksima Web',
    'tokenBaseURL': 'https://pinang-performa.dev.rayain.net/api-be',
    'baseURL': 'https://pinang-performa.dev.rayain.net/api-be/v/1',
    'partnershipBaseURL':
        'https://pinang-performa.dev.rayain.net/api-partnership',
    'masterBaseURL': 'https://pinang-performa.dev.rayain.net/api-master/v/1',
    'monitoringBaseURL':
        'https://pinang-performa.dev.rayain.net/api-monitoring/v/1',
    'encodedSHA256Fingerprint':
        'NjggREIgMkUgMDUgMjMgRjcgQzEgMzYgQzEgMTUgMTYgRTEgMUUgRkQgNDEgODAgOUYgNjAgNEYgMzggQjAgOTQgMTAgQjIgRUQgMTQgMDkgNkQgM0UgNjQgQ0UgMDI=',
    'maksimaURL': 'https://api-be.pinang-ritel.dev.rayain.net',
    'maksimaBasicAuth': 'maksimaBasicAuth',
    ...sharedMap,
  };

  static final stageMap = {
    'title': '[STAGE] Pinang Maksima Web',
    'tokenBaseURL': 'https://pinang-performa.staging.rayain.net/api-be',
    'baseURL': 'https://pinang-performa.staging.rayain.net/api-be/v/1',
    'partnershipBaseURL':
        'https://pinang-performa.staging.rayain.net/api-partnership',
    'masterBaseURL':
        'https://pinang-performa.staging.rayain.net/api-master/v/1',
    'monitoringBaseURL':
        'https://pinang-performa.staging.rayain.net/api-monitoring/v/1',
    'encodedSHA256Fingerprint':
        'NjcgNDcgREIgMjMgMUEgMDcgRjMgQjEgNEMgNDAgQTQgNjkgRDEgNEIgMTkgMjkgNkIgMUYgQkUgNzUgQUQgNTYgMUMgQzAgNDkgOTAgRTkgMTEgNTUgRkQgRDYgM0E=',
    'maksimaURL': 'https://api.pinang-ritel.staging.rayain.net/api',
    'maksimaBasicAuth': 'maksimaBasicAuth',
    ...sharedMap,
  };

  static final prodMap = {
    'title': 'Pinang Maksima Web',
    'tokenBaseURL': 'https://pinang-performa.bankraya.co.id/api-be',
    'baseURL': 'https://pinang-performa.bankraya.co.id/api-be/v/1',
    'partnershipBaseURL':
        'https://pinang-performa.bankraya.co.id/api-partnership',
    'masterBaseURL': 'https://pinang-performa.bankraya.co.id/api-master/v/1',
    'monitoringBaseURL':
        'https://pinang-performa.bankraya.co.id/api-monitoring/v/1',
    'encodedSHA256Fingerprint':
        'NTMgMzQgRDIgMjAgM0QgOEMgQzIgMzYgQjEgNzcgNUMgREIgNkMgQ0IgNzMgQjggMTQgNTggREUgRTEgRUYgODUgRjUgQ0UgOTEgQkQgNkUgRTMgRjEgRTggQzIgMzM=',
    'maksimaURL': 'https://api.pinang-ritel.bankraya.co.id/api',
    'maksimaBasicAuth': 'maksimaBasicAuth',
    'maksimaBasicAuthSlik': 'maksimaBasicAuthSlik',
    ...sharedMap,
  };

  static Map<String, dynamic> get variables {
    switch (appFlavor) {
      case Flavor.DEV:
        return devMap;
      case Flavor.STAGE:
        return stageMap;
      case Flavor.PROD:
        return prodMap;
      default:
        return devMap;
    }
  }
}
