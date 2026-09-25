return {
    "3rd/image.nvim",
    build = false,
    ---@module "image"
    ---@type Options
    opts = {
        backend = "sixel",
        processor = "magick_cli",
        integrations = {
            markdown = {
                enabled = true,
                clear_in_insert_mode = false,
                download_remote_images = true,
                only_render_image_at_cursor = true,
                only_render_image_at_cursor_mode = "inline",
                floating_windows = false,
                resolve_image_path = function(document_path, image_path, fallback)
                    local working_dir = vim.fn.getcwd()
                    if (working_dir:find("Documents/vault",1,true)) then
                        return working_dir .. "/attachments/" .. image_path
                    end

                    return fallback(document_path, image_path)
                end,
                filetypes = { "markdown" },
            },
            asciidoc = {
                enabled = false,
            },
            neorg = {
                enabled = false,
            },
            rst = {
                enabled = false,
            },
            typst = {
                enabled = false,
            },
            html = {
                enabled = false,
            },
            css = {
                enabled = false,
            },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        scale_factor = 1.0,
        kitty_method = "normal",
        kitty_direct_chunk_size = 4096,
        window_overlap_clear_enabled = false,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
        editor_only_render_when_focused = false,
        tmux_show_only_in_active_window = false,
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    }
}
