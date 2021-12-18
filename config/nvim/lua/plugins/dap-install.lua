local dap_install = require("dap-install")

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

dap_install.config(
	"python",
    {
        adapters = {
            type = "executable",
            command = "python",
            args = {"-m", "debugpy.adapter"}
        },
        configurations = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = function()
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. "/usr/bin/python") == 1 then
                        return cwd .. "/usr/bin/python"
                    elseif vim.fn.executable(cwd .. "/usr/bin/python") == 1 then
                        return cwd .. "/usr/bin/python"
                    else
                        return "/usr/bin/python"
                    end
                end
            }
        }
    }
)
