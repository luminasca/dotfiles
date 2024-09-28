vim.fn["ddc#custom#patch_global"]({
	ui = 'pum',
	autoCompleteEvents = { 'InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged', 'CmdlineEnter', 'TextChangedT' },
	sources = {
		'lsp',
		'around',
        'file',
	},
	backspaceCompletion = true,
	sourceOptions = {
		_ = {
			matchers = {'matcher_head'},
			sorters = {'sorter_rank'},
			converters = { 'converter_remove_overlap'},
			minAutoCompleteLength = 3,
		},
		["nvim-lsp"] = {
			mark = 'LSP',
			forceCompletionPattern = { [['\.\w*|:\w*|->\w*']] },
			minAutoCompleteLength = 1,
		},
		["input"] = {
			mark = 'input',
			matchers = {},
			minAutoCompleteLength = 0,
			forceCompletionPattern = { [['\S/\S*|\.\w*']] },
			isVolatile = true,
		},
		around = { mark = 'around' },
	},
	sourceParams = {
		["nvim-lsp"] = {
			snippetEngine = vim.fn["denops#callback#register"](function(body) vim.fn["vsnip#anonymous"](body) end),
			enableResolveItem = true,
			enableAdditionalTextEdit = true,
		},
		around = { maxSize = 100 },
	},
})
vim.api.nvim_create_autocmd('InsertEnter', {
	callback = function(ev)
		local opt = { noremap = true }
		vim.keymap.set({ 'i' }, '<C-n>',
			[[(pum#visible() ? '' : ddc#map#manual_complete()) . pum#map#select_relative(+1)]],
			{ expr = true, noremap = false })
		vim.keymap.set({ 'i' }, '<C-p>',
			[[(pum#visible() ? '' : ddc#map#manual_complete()) . pum#map#select_relative(-1)]],
			{ expr = true, noremap = false })
		vim.keymap.set({ 'i' }, '<C-y>', [[<Cmd>call pum#map#confirm()<CR>]], opt)
		vim.keymap.set({ 'i' }, '<C-e>', [[<Cmd>call pum#map#cancel()<CR>]], opt)
		vim.keymap.set({ 'i' }, '<PageDown>', [[<Cmd>call pum#map#insert_relative_page(+1)<CR>]], opt)
		vim.keymap.set({ 'i' }, '<PageUp>', [[<Cmd>call pum#map#insert_relative_page(-1)<CR>]], opt)
		vim.keymap.set({ 'i' }, '<CR>',
			function()
				if vim.fn['pum#entered']() then
					return '<Cmd>call pum#map#confirm()<CR>' or '<CR>'
				else
					return
					'<CR>'
				end
			end, { expr = true, noremap = false })
		vim.keymap.set({ 'i' }, '<C-m>',
			function()
				if vim.fn['pum#visible']() then
					return '<Cmd>call ddc#map#manual_complete()<CR>'
				else
					return
					'<C-m>'
				end
			end, { expr = true, noremap = false })
	end,
})
vim.fn["ddc#enable_terminal_completion"]()
vim.fn["ddc#enable"]()

local capabilities = require("ddc_source_lsp").make_client_capabilities()
require("lspconfig").denols.setup({
  capabilities = capabilities,
})

local set = vim.keymap.set
set("i", "<Tab>", "<Cmd>call pum#map#insert_relative(+1)<CR>", { noremap = true, silent = false })
set("i", "<S-Tab>", "<Cmd>call pum#map#insert_relative(-1)<CR>", { noremap = true, silent = false })
