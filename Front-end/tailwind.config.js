const colors = require("tailwindcss/colors");
module.exports = {
  mode: "jit",
  purge: ["./src/**/*.html", "./*.html", "./*.js"],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        rose: colors.rose,
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [require("@tailwindcss/forms")],
};
