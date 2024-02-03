local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
  }
})
-- local prettier = require("prettier")
-- prettier.setup({
--   ["null-ls"] = {
--     condition = function()
--       return prettier.config_exists({
--         -- if `false`, skips checking `package.json` for `"prettier"` key
--         check_package_json = true,
--       })
--     end,
--     runtime_condition = function(params)
--       -- return false to skip running prettier
--       return true
--     end,
--     timeout = 5000,
--   }
-- })
--
-- prettier.setup {
--   bin = 'prettierd',
--   filetypes = {
--     "css",
--     "javascript",
--     "javascriptreact",
--     "typescript",
--     "typescriptreact",
--     "json",
--     "scss",
--     "less"
--   }
-- }
--
--
-- vim.keymap.set('n', '<leader>sp', ':Prettier<CR>', {})
