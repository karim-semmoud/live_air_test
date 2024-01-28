const tailwind_config = require("../deps/moon/assets/tailwind.config.js");
const plugin = require("tailwindcss/plugin")

tailwind_config.content = [
  "./js/**/*.js",
  "../lib/live_air_web.ex",
  "../lib/live_air_web/**/*.*ex",
  "../lib/live_air_web/**/*.sface",
  "../deps/moon/lib/**/*.ex",
  "../deps/moon/lib/**/*.heex",
  "../deps/moon/lib/**/*.eex",
  "../deps/moon/assets/js/**/*.js",
];
tailwind_config.theme.screens = {
  'sm': '480px',
  'md': '768px',
  'lg': '976px',
  'xl': '1024px',
};
tailwind_config.theme.extend.screens = {
  'xs': '320px',
  'xxl': '1280px'
};
tailwind_config.plugins = [
  require("@tailwindcss/typography"),
  require("@tailwindcss/aspect-ratio"),
  plugin(({ addVariant }) => addVariant("phx-no-feedback", [".phx-no-feedback&", ".phx-no-feedback &"])),
  plugin(({ addVariant }) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
  plugin(({ addVariant }) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
  plugin(({ addVariant }) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),
].concat(tailwind_config.plugins);

module.exports = tailwind_config;