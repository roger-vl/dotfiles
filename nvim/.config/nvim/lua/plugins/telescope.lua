local function focus_preview(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local picker = action_state.get_current_picker(prompt_bufnr)
  local prompt_win = picker.prompt_win
  local previewer = picker.previewer
  local bufnr = previewer.state.bufnr or previewer.state.termopen_bufnr
  local winid = previewer.state.winid or vim.fn.win_findbuf(bufnr)[1]
  vim.wo[winid].number = true

  vim.keymap.set("n", "<ESC>", function()
    vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win))
  end, { buffer = bufnr })
  vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
end

return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "git@github.com:nvim-telescope/telescope-file-browser.nvim.git",
    },

    keys = {
      {
        "<D-e>",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers({
            prompt_title = "Quick Buff",
            results_title = "",
            only_cwd = true,
          })
        end,
        desc = "Buffers",
      },
      {
        "<leader>fo",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = true,
            hidden = true,
            search_dirs = { "~/Documents/knowledge/knowledge/" },
          })
        end,
        desc = "Lists obsidian files",
      },
      {
        ";f",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      {
        ";t",
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
      },
      {
        ";;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume the previous telescope picker",
      },
      {
        ";e",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      {
        ";s",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
      {
        ";d",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = {
              width = 0.5,
              height = 0.4,
            },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      local fb_actions = require("telescope").extensions.file_browser.actions

      telescope.setup({
        defaults = {
          file_ignore_patterns = { ".git/" },
          path_display = function(opts, path)
            local configPath = {
              path_display = {
                filename_first = {
                  reverse_directories = true,
                },
                shorten = {
                  len = 3,
                  exclude = { -1, -2, -3 },
                },
                truncate = 2,
              },
            }

            local tail = require("telescope.utils").path_tail(path)
            local formattedPath = require("telescope.utils").transform_path(configPath, path)
            local sections = {}
            local inc = 0
            for i = 1, #formattedPath do
              if formattedPath:sub(i, i) == "/" then
                table.insert(sections, inc, i)
                inc = inc + 1
              end
            end
            local endLight = #tail
            local highlights = {
              {
                { 0, #tail },
                "T_tail",
              },
            }
            if sections[0] ~= nil then
              table.insert(highlights, {
                { #tail + 1, sections[0] },
                "T_path_1",
              })
              endLight = sections[0]
            end
            if sections[1] ~= nil then
              table.insert(highlights, {
                { sections[0], sections[1] },
                "T_path_2",
              })
              endLight = sections[1]
            end
            table.insert(highlights, {
              { endLight, #formattedPath },
              "T_path",
            })
            return formattedPath, highlights
          end,
          wrap_results = true,
          initial_mode = "normal",
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "top",
            height = 0.5,
            width = 0.7,
          },
          sorting_strategy = "descending",
          mappings = {
            n = {
              ["<Tab><Tab>"] = focus_preview,
              ["<C-.>"] = actions.select_vertical,
              ["<C-,>"] = actions.select_horizontal,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
            },
            i = {
              ["<Tab><Tab>"] = focus_preview,
              ["<C-.>"] = actions.select_vertical,
              ["<C-,>"] = actions.select_horizontal,
            },
          },
        },
        pickers = {
          diagnostics = {
            theme = "ivy",
            initial_mode = "normal",
            layout_config = {
              preview_cutoff = 150,
            },
          },

          lsp_references = {
            show_line = false,
            include_current_line = false,
            include_declaration = false,
            layout_config = {
              prompt_position = "bottom",
              width = 0.3,
              height = 0.2,
            },
          },

          find_files = {
            no_ignore = true,
            hidden = true,
            prompt_title = "Files",
            results_title = "",
            follow = true,
            layout_strategy = "horizontal",
            layout_config = {
              prompt_position = "top",
              width = 0.8,
              height = 0.9,
              preview_width = 0.7,
            },
            sorting_strategy = "ascending",
            initial_mode = "insert",
          },

          buffers = {
            prompt_title = "All Buff",
            sort_mru = true,
            previewer = false,
            layout_strategy = "horizontal",
            layout_config = {
              prompt_position = "bottom",
              width = 0.3,
              height = 0.2,
            },
            sorting_strategy = "ascending",
            initial_mode = "normal",
            ignore_current_buffer = true,
            mappings = {
              ["n"] = {
                ["d"] = actions.delete_buffer,
              },
            },
          },

          git_branches = {
            prompt_title = "Branch Diff",
            results_title = "",
            layout_strategy = "center",
            sorting_strategy = "descending",
            initial_mode = "normal",
            layout_config = {
              prompt_position = "bottom",
              height = 0.2,
              width = 0.6,
            },
            previewer = false,
            mappings = {
              ["n"] = {
                ["d"] = function()
                  local entry = action_state.get_selected_entry()
                  -- close Telescope window properly prior to switching windows
                  actions.close(vim.api.nvim_get_current_buf())
                  vim.cmd(("DiffviewOpen %s.."):format(entry.value))
                end,
              },
            },
          },
        },

        extensions = {
          file_browser = {
            theme = "dropdown",
            follow_symlinks = true,
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              -- your custom insert mode mappings
              ["n"] = {
                -- your custom normal mode mappings
                ["N"] = fb_actions.create,
                ["h"] = fb_actions.goto_parent_dir,
                ["<C-u>"] = function(prompt_bufnr)
                  for i = 1, 10 do
                    actions.move_selection_previous(prompt_bufnr)
                  end
                end,
                ["<C-d>"] = function(prompt_bufnr)
                  for i = 1, 10 do
                    actions.move_selection_next(prompt_bufnr)
                  end
                end,
                ["<PageUp>"] = actions.preview_scrolling_up,
                ["<PageDown>"] = actions.preview_scrolling_down,
              },
            },
          },
        },
      })
      -- telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
      -- telescope.load_extension 'rest'
      telescope.load_extension("projects")
      -- vim.cmd 'autocmd User TelescopePreviewerLoaded setlocal number'
    end,
  },
}
