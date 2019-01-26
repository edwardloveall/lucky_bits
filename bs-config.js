// Docs: http://www.browsersync.io/docs/options/

module.exports = {
  snippetOptions: {
    rule: {
      match: /<\/head>/i,
      fn: function(snippet, match) {
        return snippet + match;
      }
    }
  },
  files: ["public/css/**/*.css", "public/js/**/*.js"],
  watchEvents: ["change"],
  open: "local",
  browser: "default"
};
