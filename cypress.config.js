const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
  },
  video: false,
  reporter: "cypress-multi-reporters",
  reporterOptions: {
    reporterEnabled: "mochawesome, mocha-junit-reporter",
    mochawesomeReporterOptions: {
      reportDir: "cypress/reports/mocha",
      reportFilename: "mochawesome-[status]_[datetime]-[name].json",
      quite: true,
      overwrite: false,
      html: false,
      json: true,
    },
    mochaJunitReporterReporterOptions: {
      jenkinsMode: true,
      mochaFile: "cypress/reports/junit/cypress-output.[hash].xml",
    
    }
  },
});
