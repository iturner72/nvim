-- Load snippets from ~/.config/nvim/luasnip/
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/luasnip/"})

require("luasnip").config.set_config({ -- Setting LuaSnip config
    -- Enable autotriggered snippets
    enable_autosnippets = true,

    -- Use Tab to trigger visual selection
    store_selection_keys = "<Tab>",
})

