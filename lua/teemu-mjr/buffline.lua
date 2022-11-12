require("bufferline").setup({
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		-- NOTE: this plugin is designed with this icon in mind,
		-- and so changing this is NOT recommended, this is intended
		-- as an escape hatch for people who cannot bear it for whatever reason
		indicator_style = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		-- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
		-- end,
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 18,
		diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc",
		diagnostics_update_in_insert = false,
		-- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "[" .. count .. "]"
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
			},
		},
		color_icons = true, -- true | false
		show_buffer_icons = true, -- true | false
		show_buffer_close_icons = true, -- true | false
		show_buffer_default_icon = true, -- true | false
		show_close_icon = true, -- true | false
		show_tab_indicators = true, -- true | false
		persist_buffer_sort = true,
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = true, -- false | true,
		always_show_bufferline = true, -- true | false,
		sort_by = "id", -- 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
		-- add custom logic
		-- return buffer_a.modified > buffer_b.modified
		-- end
	},
})
