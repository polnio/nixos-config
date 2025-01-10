return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  branch = "main",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Neotree",
  opts = {
    enable_git_status = true,
    enable_diagnostics = true,
    nesting_rules = {
      ["cpp"] = { "hpp" },
      ["js"] = { "js.map", "d.ts", "d.ts.map" },
      ["module.ts"] = { "service.ts", "controller.ts", "controller.spec.ts" },
      ["yuck"] = { "scss" },
      ["tex"] = {
        pattern = "(.*)%.tex",
        files = { "%1.synctex.gz", "%1.log", "%1.pdf", "%1.aux", "%1.fls", "%1.fdb_latexmk", "%1.fdb" },
      },
      ["org"] = {
        pattern = "(.*)%.org",
        files = { "%1.pdf" },
      },
    },
    commands = {
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if (node.type == "directory" or node:has_children()) and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" or node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else                           -- if expanded and has children, seleect the next child
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          end
        else -- if not a directory just open it
          state.commands.open(state)
        end
      end,
    },
    default_component_configs = {
      name = {
        use_git_status_colors = false,
      },
    },
    window = {
      width = 30,
      mappings = {
        h = "parent_or_close",
        l = "child_or_open",
      },
    },
    filesystem = {
      bind_to_cwd = true,
      follow_current_file = {
        -- enabled = true,
        enabled = false,
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-Tree" },
  },
}
