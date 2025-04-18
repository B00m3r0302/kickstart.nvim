require("config.lazy")
require("lazy").setup({{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "asm", "bash", "c", "c_sharp", "comment", "cpp", "disassembly", "dockerfile", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "go", "html", "http", "java", "javadoc", "javascript", "jq", "jsdoc", "json", "lua", "luadoc", "lua_patterns", "markdown", "markdown_inline", "nginx", "nim", "nim_format_string", "pem", "perl", "php", "phpdoc", "powershell", "printf", "python", "pip_requirements", "ruby", "rust", "sql", "ssh_config", "superhtml", "svelte", "toml", "tsv", "typescript", "vim", "vimdoc", "xml", "yaml" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}})
