// Docs: https://github.com/JeffreyWay/laravel-mix/tree/master/docs#readme

let mix = require("laravel-mix");

mix
  .js("src/js/app.js", "public/js")
  .sass("src/css/app.scss", "public/css")
  .options({
    imgLoaderOptions: { enabled: false },
    clearConsole: false
  })
  .setPublicPath("public")
  .version(["public/assets"])
  .webpackConfig({ stats: "errors-only" })
  .disableSuccessNotifications();
