// Testacular configuration
// Generated on Wed Feb 27 2013 10:37:05 GMT+1100 (AUS Eastern Daylight Time)


// base path, that will be used to resolve files and exclude
basePath = '';


// list of files / patterns to load in the browser
files = [
  JASMINE,
  JASMINE_ADAPTER,
  'lib/angular/angular.js',
  'lib/angular/angular-*.js',
  'test/lib/angular/angular-mocks.js',
  'js/**/*.js',
  'test/unit/*.js'
];


// list of files to exclude
exclude = [
  'js/jquery-ui-1.10.1.custom.min.js',
  'js/bootstrap.min.js',
  'js/jquery.flot.js',
  'js/jquery.flot.stack.js',
  'js/jquery.flot.time.js'
];


// test results reporter to use
// possible values: 'dots', 'progress', 'junit'
reporters = ['dots','junit'];


// web server port
port = 9876;


// cli runner port
runnerPort = 9100;


// enable / disable colors in the output (reporters and logs)
colors = true;


// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_ERROR;


// enable / disable watching file and executing tests whenever any file changes
autoWatch = false;


// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari (only Mac)
// - PhantomJS
// - IE (only Windows)
browsers = ['PhantomJS', 'Chrome', 'Firefox'];


// If browser does not capture in given timeout [ms], kill it
captureTimeout = 60000;


// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = true;

junitReporter: {
  // will be resolved to basePath (in the same way as files/exclude patterns)
  outputFile: 'test-results.xml'
};