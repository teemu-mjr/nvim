vim.opt_local.shiftwidth = 4
local config = {
    cmd = { "jdtls" },

    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

    settings = {
        java = {
        }
    },

    init_options = {
    },
}
require("jdtls").start_or_attach(config)
