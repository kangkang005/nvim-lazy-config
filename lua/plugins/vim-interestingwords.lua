-- viminterestingwords.nvim highlights the occurrences of the word under the cursor throughout the buffer.
return {
  "Mr-LLLLL/interestingwords.nvim",
  config = {
    colors = { "#aeee00", "#ff0000", "#0000ff", "#b88823", "#ffa724", "#ff2c4b" },
    search_count = true,
    navigation = true,
    scroll_center = true,
    search_key = "<leader>i",
    cancel_search_key = "<leader>I",
    color_key = "<leader>j",
    cancel_color_key = "<leader>J",
    select_mode = "random", -- random or loop
  },
}
