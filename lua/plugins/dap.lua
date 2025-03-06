return {
  "mfussenegger/nvim-dap",
  optional = true,
  dependencies = {
    {
      "leoluz/nvim-dap-go",
      opts = {
        -- Delve configurations
        delve = {
          path = "dlv",
          initialize_timeout_sec = 20,
          port = "${port}",
          args = {},
        },
        -- Custom configurations for different debug scenarios
        dap = {
          configurations = {
            {
              type = "go",
              name = "Debug run",
              request = "launch",
              program = "${fileDirname}",
              args = {},
            },
            {
              type = "go",
              name = "Debug with start arg",
              request = "launch",
              program = "${file}",
              args = { "start" },
            },
            {
              type = "go",
              name = "Attach to running Delve",
              request = "attach",
              mode = "remote",
              remote = "127.0.0.1:2345",
            },
          },
        },
      },
    },
  },
}
