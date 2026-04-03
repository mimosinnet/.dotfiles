-- https://github.com/NeuralNine/config-files/blob/master/arch_config/.config/nvim/lua/plugins/nvim-dap.lua
-- https://youtu.be/tfC1i32eW3A?si=Ofvzj6dth39YZ8DD

return {
  {
    "mfussenegger/nvim-dap",
	  ft = "python", -- filetype

    dependencies = {
	    "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
    },

    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
		  dap_python = require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

      require("dapui").setup({})
      require("nvim-dap-virtual-text").setup({
        commented = true, -- Show virtual text alongside comment
      })

      -- dap_python.setup("python3")

      vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "", -- or "❌"
        texthl = "DiagnosticSignError",
        linehl = "",
        numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
        text = "", -- or "→"
        texthl = "DiagnosticSignWarn",
        linehl = "Visual",
        numhl = "DiagnosticSignWarn",
      })

      -- Automatically open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      local opts = { noremap = true, silent = true }

      -- Mappings {{{
      local mappings = {
        { "<leader>D",group = "Debugging" },
        { "<leader>Db", function() dap.toggle_breakpoint() end,desc = "Toggle Breakpoint", mode = "n",  },
        { "<leader>Dc", function() dap.continue()          end,desc = "Continue",          mode = "n",  },
        { "<leader>Do", function() dap.step_over()         end,desc = "Step Over",         mode = "n",  },
        { "<leader>Di", function() dap.step_into()         end,desc = "Step Into",         mode = "n",  },
        { "<leader>DO", function() dap.step_out()          end,desc = "Step Out",          mode = "n",  },
        { "<leader>Dq", function() dap.terminate()         end,desc = "Quit Debugging",    mode = "n",  },
        { "<leader>Du", function() dapui.toggle()          end,desc = "Toggle DAP UI",     mode = "n",  },
      }
      local wk = require("which-key")
		  wk.add(mappings)
      -- }}}

    end,
  },
}

