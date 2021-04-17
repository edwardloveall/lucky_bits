// Docs: https://github.com/JeffreyWay/laravel-mix/tree/master/docs#readme

const mix = require("laravel-mix");
const plugins = [];

if (mix.inProduction()) {
  let CompressionWepackPlugin = require("compression-webpack-plugin");
  let gzipCompression = new CompressionWepackPlugin({
    compressionOptions: { level: 9 },
    test: /\.js$|\.css$|\.html$|\.svg$/,
  });
  plugins.push(gzipCompression);
}

mix
  .setPublicPath("public")
  .js("src/js/app.js", "js")
  .sass("src/css/app.scss", "css")
  .options({
    imgLoaderOptions: { enabled: false },
    clearConsole: false,
  })
  .version(["public/assets"])
  .webpackConfig({ stats: "errors-only", plugins: plugins })
  .disableNotifications();
