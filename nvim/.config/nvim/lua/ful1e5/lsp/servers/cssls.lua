local cssls = {}

cssls.setup = function()
  return {
    settings = {
      css = { validate = true, lint = {
        unknownAtRules = 'ignore',
      } },
      scss = { validate = true, lint = {
        unknownAtRules = 'ignore',
      } },
      less = { validate = true, lint = {
        unknownAtRules = 'ignore',
      } },
    },
  }
end

return cssls
