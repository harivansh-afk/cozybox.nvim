local background = "#e7e7e7"
local surface = "#e1e1e1"
local selection = "#c3c7c9"

return {
  contrast = "hard",
  palette_overrides = {
    bright_red = "#923f3a",
    bright_blue = "#4261a5",
    neutral_red = "#f42d25",
    neutral_blue = "#3c7678",
    faded_red = "#923f3a",
    faded_blue = "#4261a5",
    dark_red = "#ff717b",
    dark_red_soft = "#ff7076",
    dark_red_hard = "#ff6675",
  },
  overrides = {
    MatchParen = { bold = true, underline = true, fg = "#d8a657", bg = selection },
    Normal = { bg = background },
    NormalFloat = { bg = background },
    SignColumn = { bg = background },
    StatusLine = { bg = background },
    StatusLineNC = { bg = background },
    GitSignsAdd = { fg = "#a9b665", bg = background },
    GitSignsChange = { fg = "#d8a657", bg = background },
    GitSignsDelete = { fg = "#923f3a", bg = background },
    GitSignsTopdelete = { fg = "#923f3a", bg = background },
    GitSignsChangedelete = { fg = "#d8a657", bg = background },
    GitSignsUntracked = { fg = "#7daea3", bg = background },
    GitSignsStagedAdd = { fg = "#6c7842", bg = background },
    GitSignsStagedChange = { fg = "#8a6d39", bg = background },
    GitSignsStagedDelete = { fg = "#e16963", bg = background },
    GitSignsStagedTopdelete = { fg = "#e16963", bg = background },
    GitSignsStagedChangedelete = { fg = "#8a6d39", bg = background },
    LineNr = { bg = background },
    CursorLineNr = { bg = background },
    CursorLine = { bg = surface },
    FoldColumn = { bg = background },
    DiffAdd = { bg = "#1e2718" },
    DiffChange = { bg = "#1e1e18" },
    DiffDelete = { bg = "#ffc7c7" },
  },
}
