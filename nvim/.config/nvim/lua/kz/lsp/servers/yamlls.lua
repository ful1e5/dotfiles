local jsonls = {}

jsonls.setup = function(opts)
  opts.settings = {
    yaml = {
      -- Schemas https://www.schemastore.org
      schemas = {
        ['http://json.schemastore.org/gitlab-ci.json'] = { '.gitlab-ci.yml' },
        ['https://json.schemastore.org/bamboo-spec.json'] = {
          'bamboo-specs/*.{yml,yaml}',
        },
        ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = {
          'docker-compose*.{yml,yaml}',
        },
        ['http://json.schemastore.org/github-workflow.json'] = '.github/workflows/*.{yml,yaml}',
        ['http://json.schemastore.org/github-action.json'] = '.github/action.{yml,yaml}',
        ['http://json.schemastore.org/prettierrc.json'] = '.prettierrc.{yml,yaml}',
        ['http://json.schemastore.org/stylelintrc.json'] = '.stylelintrc.{yml,yaml}',
        ['http://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}',
      },
    },
  }
end

return jsonls
