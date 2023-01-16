lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 
    "bash",
    "css",
    "dockerfile", 
    "dot",
    "hjson",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "latex",
    "lua", 
    "nix",
    "php", 
    "python",
    "scss",
    "tsx",
    "typescript",
    "vim", 
    "vue",
    "yaml"
    },
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
