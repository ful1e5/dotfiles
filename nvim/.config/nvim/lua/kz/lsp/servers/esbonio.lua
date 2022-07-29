local esbonio = {}

esbonio.setup = function(opts)
  opts.init_options = {
    server = {
      logLevel = 'debug',
    },
    sphinx = {
      confDir = '${workspaceRoot}/docs',
      srcDir = '${confDir}/source',
    },
  }
end

return esbonio
