function fn() {
  var env = karate.env;
  var os = karate.os;

  if (!env) {
    env = 'sit'
  }

  karate.configure('ssl', { trustAll: true });
  karate.configure('logPrettyRequest', false);
  karate.configure('logPrettyResponse', true);
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  karate.configure('retry', { count: 3, interval: 2000 });

  var config = {
    env: env,
    weatherUrl: 'https://openweathermap.org',
    headless: karate.properties['karate.headless'] === 'true' || false,
    webPage: 'classpath:demo/pages/web/',
    mobileConfig: 'classpath:demo/resources/mobile/config/',
    mobilePage: 'classpath:demo/pages/mobile/',
    dataPath: 'classpath:demo/resources/data/',
    featurePath: 'classpath:demo/features/',
    mobileDriverUrl: karate.properties['karate.mobileDriverUrl'] || 'http://127.0.0.1:4723',
    desiredCapabilities: karate.properties['karate.desiredCapabilities'] || 'android',
    personalToken: karate.properties['karate.gitToken'] || null
  }

  var driverConfig = karate.call('classpath:karate-config-driver.js', { config: config });
  config = karate.merge(config, driverConfig);

  var envConfig = karate.call('classpath:karate-config-env.js', { env: config.env });
  config = karate.merge(config, envConfig);

  karate.configure('driver', config.driverConfig)
  config.utils = karate.callSingle('classpath:demo/features/Utils.feature', { 'dataPath': config.dataPath })
  config.appPath = karate.properties['karate.appPath'] || 'C:\\Users\\Admin\\Downloads\\app-staging-release.apk'

  karate.log('Done config !')
  return config;
}
