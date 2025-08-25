local function get_image_path()
  local line = vim.api.nvim_get_current_line()
  local image_pattern = "%[.-%]%((.-)%)"
  local _, _, image_path = string.find(line, image_pattern)
  return image_path
end

-- Img deleted to trash app
vim.keymap.set("n", "<leader>id", function()
  local image_path = get_image_path()
  if not image_path then
    vim.api.nvim_echo({ { "No image found under the cursor", "WarningMsg" } }, false, {})
    return
  end
  if string.sub(image_path, 1, 4) == "http" then
    vim.api.nvim_echo({ { "URL image cannot be deleted from disk.", "WarningMsg" } }, false, {})
    return
  end
  local current_file_path = vim.fn.expand("%:p:h")
  local absolute_image_path = current_file_path .. "/" .. image_path
  -- Check if file exists
  if vim.fn.filereadable(absolute_image_path) == 0 then
    vim.api.nvim_echo(
      { { "Image file does not exist:\n", "ErrorMsg" }, { absolute_image_path, "ErrorMsg" } },
      false,
      {}
    )
    return
  end

  -- Cannot see the popUp as the cursor is on top of the image name, so saving
  -- its position, will move it to the top and then move it back
  local current_pos = vim.api.nvim_win_get_cursor(0) -- Save cursor position
  vim.api.nvim_win_set_cursor(0, { 1, 0 }) -- Move to top
  vim.ui.select({ "yes", "no" }, { prompt = "Delete image file? " }, function(choice)
    vim.api.nvim_win_set_cursor(0, current_pos) -- Move back to image line
    if choice == "yes" then
      local success, _ = pcall(function()
        vim.fn.system({ "trash", vim.fn.fnameescape(absolute_image_path) })
      end)
      -- Verify if file still exists after deletion attempt
      if success and vim.fn.filereadable(absolute_image_path) == 1 then
        -- Try with rm if trash deletion failed
        -- Keep in mind that if deleting with `rm` the images won't go to the
        -- macos trash app, they'll be gone
        -- This is useful in case trying to delete images mounted in a network drive
        -- Cannot see the popUp as the cursor is on top of the image name, so saving
        -- its position, will move it to the top and then move it back
        current_pos = vim.api.nvim_win_get_cursor(0) -- Save cursor position
        vim.api.nvim_win_set_cursor(0, { 1, 0 }) -- Move to top

        vim.ui.select({ "yes", "no" }, { prompt = "Trash deletion failed. Try with rm command? " }, function(rm_choice)
          vim.api.nvim_win_set_cursor(0, current_pos) -- Move back to image line
          if rm_choice == "yes" then
            local rm_success, _ = pcall(function()
              vim.fn.system({ "rm", vim.fn.fnameescape(absolute_image_path) })
            end)
            if rm_success and vim.fn.filereadable(absolute_image_path) == 0 then
              vim.api.nvim_echo({
                { "Image file deleted from disk using rm:\n", "Normal" },
                { absolute_image_path, "Normal" },
              }, false, {})
              -- require("image").clear()
              vim.cmd("edit!")
              vim.cmd("normal! dd")
            else
              vim.api.nvim_echo({
                { "Failed to delete image file with rm:\n", "ErrorMsg" },
                { absolute_image_path, "ErrorMsg" },
              }, false, {})
            end
          end
        end)
      elseif success and vim.fn.filereadable(absolute_image_path) == 0 then
        vim.api.nvim_echo({
          { "Image file deleted from disk:\n", "Normal" },
          { absolute_image_path, "Normal" },
        }, false, {})
        -- require("image").clear()
        vim.cmd("edit!")
        vim.cmd("normal! dd")
      else
        vim.api.nvim_echo({
          { "Failed to delete image file:\n", "ErrorMsg" },
          { absolute_image_path, "ErrorMsg" },
        }, false, {})
      end
    else
      vim.api.nvim_echo({ { "Image deletion canceled.", "Normal" } }, false, {})
    end
  end)
end, { desc = "[P](macOS) Delete image file under cursor" })
