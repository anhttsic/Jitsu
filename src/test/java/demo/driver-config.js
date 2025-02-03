function fn(arg) {
  var config = {
    'driverConfig': {
      type: "chrome",
      addOptions: [
        '--remote-allow-origins=*',
        '--start-maximized',
        '--disable-notifications',
        '--no-sandbox',
        '--test-type',
        '--incognito',
        '--disable-popup-blocking',
        '--disable-gpu',
        '--disable-extensions',
        '--disable-infobars'
      ]
    }
  }

  if(arg.config.headless) { config.driverConfig.addOptions.push('--headless=new') }

  return config;
}
