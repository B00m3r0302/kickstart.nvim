-- ~/.config/nvim/lua/plugins/lint.lua
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Map filetypes ↓ to their linters ↑
    lint.linters_by_ft = {
      asm             = { "nasm"                }, -- NASM assembler syntax check
      bash            = { "shellcheck"          }, -- POSIX shell scripts :contentReference[oaicite:0]{index=0}
      c               = { "clang-tidy"          }, -- Clang static analyzer
      c_sharp         = { "csharpier"           }, -- C# code style checker
      comment         = { "commentlint"         }, -- Markdown‑style comment linter
      cpp             = { "clang-tidy"          }, -- C++ static analysis
      disassembly     = { "llvm-objdump"        }, -- Disassembly format checker
      dockerfile      = { "hadolint"            }, -- Dockerfile best practices
      git_config      = { "gitlint"             }, -- Git config syntax
      git_rebase      = { "gitlint"             }, -- rebase instruction linter
      gitattributes   = { "gitlint"             },
      gitcommit       = { "commitlint"          }, -- Conventional commit linter
      gitignore       = { "gitignore-lint"      },
      go              = { "golangci-lint"       }, -- Go mega‑linter :contentReference[oaicite:1]{index=1}
      html            = { "htmlhint"            }, -- HTML validator :contentReference[oaicite:2]{index=2}
      http            = { "httpie"              }, -- HTTP request syntax
      java            = { "checkstyle"          }, -- Java style checks
      javadoc         = { "javadoc-lint"        },
      javascript      = { "eslint_d"            }, -- Fast ESLint daemon
      jsdoc           = { "eslint-plugin-jsdoc" },
      jq              = { "jq"                  }, -- JSON query syntax
      json            = { "jsonlint"            },
      lua             = { "luacheck"            }, -- Lua diagnostics
      luadoc          = { "luacheck"            },
      lua_patterns    = { "luacheck"            },
      markdown        = { "markdownlint"        },
      markdown_inline = { "vale"                }, -- Prose style linter
      nginx           = { "nginx-lint"          },
      nim             = { "nimble lint"         }, -- Nim compiler checks
      nim_format_string = { "nimble lint"       },
      pem             = { "pemlint"             },
      perl            = { "perlcritic"          },
      php             = { "phpcs"               },
      phpdoc          = { "phpmd"               },
      powershell      = { "pwsh -Command PSScriptAnalyzer" },
      printf          = { "format-printf"       },
      python          = { "pylint"              }, -- Python static checker
      pip_requirements = { "pip-check-reqs"     },
      ruby            = { "rubocop"             },
      rust            = { "cargo clippy"        }, -- Rust linter
      sql             = { "sqlfluff"            },
      ssh_config      = { "ssh-lint"            },
      superhtml       = { "htmlhint"            },
      svelte          = { "eslint_d"            },
      toml            = { "taplo"               },
      tsv             = { "csvlint"             },
      typescript      = { "eslint_d"            },
      vim             = { "vimlint"             },
      vimdoc          = { "vint"                },
      xml             = { "xmllint"             },
      yaml            = { "yamllint"            },
    }

    -- Auto‑run on common events
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function() require("lint").try_lint() end,
    })
  end,
}

