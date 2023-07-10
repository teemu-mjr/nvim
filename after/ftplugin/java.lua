vim.opt_local.shiftwidth = 4

local bundles = {
    vim.fn.glob("~/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar", true),
};
vim.list_extend(bundles, vim.split(vim.fn.glob("~/.local/share/nvim/mason/share/java-test/*.jar", true), "\n"))

local config = {
    cmd = { "jdtls" },

    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

    settings = {
        java = {
        }
    },

    init_options = {
        bundles = bundles,
    }

}
require('jdtls').setup_dap({ hotcodereplace = 'auto' })
require("jdtls").start_or_attach(config)
