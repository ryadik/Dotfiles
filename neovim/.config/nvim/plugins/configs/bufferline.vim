lua << EOF
require("bufferline").setup{
options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
        if context.buffer:current() then
            return ''
        end
        return ''
    end,
    offsets = {
        {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
        }
    }
  }
}
EOF
