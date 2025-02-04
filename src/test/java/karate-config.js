function fn() {
  var env = karate.env;
  var os = karate.os;

  karate.configure('ssl', { trustAll: true });
  karate.configure('logPrettyRequest', false);
  karate.configure('logPrettyResponse', true);
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  var config = {
    env: env,
    weatherUrl: 'https://openweathermap.org',
    headless: karate.properties['karate.headless'] === true || false,
    webPage: 'classpath:demo/pages/web/',
    mobileConfig: 'classpath:demo/resources/mobile/config/',
    mobilePage: 'classpath:demo/pages/mobile/',
    dataPath: 'classpath:demo/resources/data/',
    mobileDriverUrl: karate.properties['karate.mobileDriverUrl'] || 'http://127.0.0.1:4723',
    desiredCapabilities: karate.properties['karate.desiredCapabilities'] || 'android'
  }

  var driverConfig = karate.call('classpath:driver-config.js', { config: config });
  config = karate.merge(config, driverConfig);

  karate.configure('driver', config.driverConfig)
  config.utils = karate.callSingle('classpath:demo/features/Utils.feature', { 'dataPath': config.dataPath })
  config.appPath = karate.properties['karate.appPath'] || config.utils.path.PROJECT_RESOURCE + 'mobile/app/app-staging-release.apk'

  karate.log('Done config !')
  return config;
}
