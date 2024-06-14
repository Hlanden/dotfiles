local dap = require('dap')
-- Adding adapters to the adapter table --
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/jorgen/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
}

-- Cpp configurations --
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
    },
    {
        name = "(gdb) Attach",
        type = "cppdbg",
        request = "attach",
        processId = function()
            return vim.fn.input('Process ID: ')
        end,
        program = "/home/jorgen/.local/share/nvim/mason/packages/cpptools/extension/bin/cpptools",
        MIMode = "gdb",
        setupCommands = {
            {
                description = "Enable pretty-printing for gdb",
                text = "-enable-pretty-printing",
                ignoreFailures = true
            }
        }
    },
    -- {
    -- name = "dbg_genius_vscode",
    -- type = "cppdbg",
    -- request = "launch",
    -- -- trigger the corresponding source from tasks.json
    -- preLaunchTask = "genius_source_vscode",
    -- -- exclude the target program from the launch file and debug it here in vscode
    -- program = "${workspaceFolder}/ros_ws/devel/lib/global_planner/planner",
    -- args = [],
    -- stopAtEntry = true,
    -- cwd = "${workspaceFolder}",
    -- environment = [],
    -- externalConsole = false,
    -- MIMode = "gdb",
    -- targetArchitecture = "x64",
    -- avoidWindowsConsoleRedirection = false,
    -- -- setupCommands = [
    -- --   {
    -- --     description = "Enable pretty-printing for gdb",
    -- --     text = "-enable-pretty-printing",
    -- --     ignoreFailures = true
    -- --   }
    -- -- ]
    -- },
    {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb',
        cwd = '${workspaceFolder}',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
    },
}

-- Python
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
-- dap.adapters.python = {
--   type = 'executable';
--   command = '/home/jorgen/.virtualenvs/debugpy/bin/python';
--   args = { '-m', 'debugpy.adapter' };
-- }

-- dap.configurations.python = {
--   {
--     -- The first three options are required by nvim-dap
--     type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
--     request = 'launch';
--     name = "Launch file";

--     -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

--     program = "${file}"; -- This configuration will launch the current file if used.
--     pythonPath = function()
--       -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
--       -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
--       -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
--       local cwd = vim.fn.getcwd()
--       if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
--         return cwd .. '/venv/bin/python'
--       elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
--         return cwd .. '/.venv/bin/python'
--       else
--         return '/usr/bin/python'
--       end
--     end;
--   },
-- }
