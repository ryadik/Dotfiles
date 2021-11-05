lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`

 override = {
  c = {
         icon = "",
         color = "#599eff",
         name = "c",
      },
      css = {
         icon = "",
         color = "#563d7c",
         name = "css",
      },
      deb = {
         icon = "",
         color = "#A91930",
         name = "deb",
      },
      Dockerfile = {
         icon = "",
         color = "#4b9fdb",
         name = "Dockerfile",
      },
      html = {
         icon = "",
         color = "#e34c26",
         name = "html",
      },
      jpeg = {
         icon = "",
         color = "#a074c4",
         name = "jpeg",
      },
      jpg = {
         icon = "",
         color = "#a074c4",
         name = "jpg",
      },
      js = {
         icon = "",
         color = "#cbcb41",
         name = "js",
      },
      kt = {
         icon = "󱈙",
         color = "#F88A02",
         name = "kt",
      },
      lock = {
         icon = "",
         color = "#e34c26",
         name = "lock",
      },
      lua = {
         icon = "",
         color = "#51a0cf",
         name = "lua",
      },
      mp3 = {
         icon = "",
         color = "#efefef",
         name = "mp3",
      },
      mp4 = {
         icon = "",
         color = "#efefef",
         name = "mp4",
      },
      out = {
         icon = "",
         color = "#efefef",
         name = "out",
      },
      png = {
         icon = "",
         color = "#a074c4",
         name = "png",
      },
      py = {
         icon = "",
         color = "#3572A5",
         name = "py",
      },
      ["robots.txt"] = {
         icon = "ﮧ",
         color = "#e34c26",
         name = "robots",
      },
      toml = {
         icon = "",
         color = "#6d8086",
         name = "toml",
      },
      ts = {
         icon = "ﯤ",
         color = "#519aba",
         name = "ts",
      },
      ttf = {
         icon = "",
         color = "#efefef",
         name = "TrueTypeFont",
      },
      rb = {
         icon = "",
         color = "#701516",
         name = "rb",
      },
      rpm = {
         icon = "",
         color = "#F88A02",
         name = "rpm",
      },
      vue = {
         icon = "﵂",
         color = "#8dc149",
         name = "vue",
      },
      woff = {
         icon = "",
         color = "#efefef",
         name = "WebOpenFontFormat",
      },
      woff2 = {
         icon = "",
         color = "#efefef",
         name = "WebOpenFontFormat2",
      },
      xz = {
         icon = "",
         color = "#cbcb41",
         name = "xz",
      },
      zip = {
         icon = "",
         color = "#cbcb41",
         name = "zip",
      },
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = false;
}
EOF
