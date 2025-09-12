return {
  "HakonHarnes/img-clip.nvim",
  lazy = true,
  event = "VeryLazy",
  ft = { "markdown" },
  opts = {
    default = {
      relative_to_current_file = true,
      prompt_for_file_name = true,
      extension = "avif",
      proces_cmd = "convert - -quality 75 avif:-",
    },
  },
  keys = {
    { "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
