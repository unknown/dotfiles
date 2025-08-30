return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "*",
	opts = {
		keymap = { preset = "enter" },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			menu = {
				auto_show = true,
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 100,
				},
			},
		},
		signature = {
			enabled = true,
		},
	},
	opts_extend = { "sources.default" },
}
