vim.opt_local.shiftwidth = 4

local root_markers = { ".git", "mvnw", "gradlew" }
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv('HOME')
local workspace_folder = home .. "/.local/share/nvim/mason/share/jdtls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local bundles = {
    vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar", true),
};
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-test/*.jar", true), "\n"))

local config = {
    cmd = {
        "jdtls",
        "-data", workspace_folder
    },
    root_dir = root_dir,
    settings = {
        java = {
        }
    },

    init_options = {
        bundles = bundles,
    }

}
require("jdtls").start_or_attach(config)
