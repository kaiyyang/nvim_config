local function setup_rust_tools()
    local tools = {
        autoSetHints = true,
        runnables = {use_telescope = true},
        inlay_hints = {show_parameter_hints = true},
        hover_actions = {auto_focus = true}
    }
    require('rust-tools').setup({
        tools = tools,
        server = {
            on_attach = lsp_on_attach,
            capabilities = capabilities,
            flags = {debounce_text_changes = 150}
        }
    })
    require('rust-tools-debug').setup()
end

pcall(setup_rust_tools)
