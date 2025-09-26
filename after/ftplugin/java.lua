require("jdtls").start_or_attach({
    name = "jdtls",
    cmd = { "jdtls" },
    root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw" }),
    settings = {
        java = {
        },
    },
    init_options = {
        bundles = {},
    }
})
