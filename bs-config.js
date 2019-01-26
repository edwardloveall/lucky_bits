// Docs: http://www.browsersync.io/docs/options/

module.exports = {
  browser: "default",
  files: ["public/css/**/*.css", "public/js/**/*.js"],
  ghostMode: false,
  open: false,
  snippetOptions: {
    rule: {
      match: /<\/head>/i,
      fn: function(snippet, match) {
        return snippet + match;
      }
    }
  },
};
