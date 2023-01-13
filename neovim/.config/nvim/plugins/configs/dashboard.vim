lua << EOF
  local home = os.getenv('HOME')
  local db = require('dashboard')
  -- macos
  db.preview_command = 'cat | lolcat'
  db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
  db.preview_file_height = 23
  db.preview_file_width = 70
  db.custom_center = {
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f'},
      {icon = '  ',
      desc ='File Browser                             ',
      action =  'NvimTreeOpen',
      shortcut = 'CTRL n'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f g'},
      {icon = '  ',
      desc = 'Open float terminal                   ',
      action = 'Lspsaga open_floaterm',
      shortcut = 'SPC o f t'},
    }
EOF
