local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format()

require("luasnip.loaders.from_snipmate").lazy_load()

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  },
  --- (Optional) Show source name in completion menu
  formatting = cmp_format,
})

