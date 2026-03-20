local background = "#e7e7e7"
local surface = "#e1e1e1"
local selection = "#c3c7c9"

return {
  contrast = "hard",
  overrides = {
    MatchParen = { bold = true, underline = true, fg = "#d8a657", bg = selection },
    Normal = { bg = background },
    NormalFloat = { bg = background },
    SignColumn = { bg = background },
    StatusLine = { bg = background },
    StatusLineNC = { bg = background },
    GitSignsAdd = { fg = "#a9b665", bg = background },
    GitSignsChange = { fg = "#d8a657", bg = background },
    GitSignsDelete = { fg = "#ea6962", bg = background },
    GitSignsTopdelete = { fg = "#ea6962", bg = background },
    GitSignsChangedelete = { fg = "#d8a657", bg = background },
    GitSignsUntracked = { fg = "#7daea3", bg = background },
    GitSignsStagedAdd = { fg = "#6c7842", bg = background },
    GitSignsStagedChange = { fg = "#8a6d39", bg = background },
    GitSignsStagedDelete = { fg = "#94433f", bg = background },
    GitSignsStagedTopdelete = { fg = "#94433f", bg = background },
    GitSignsStagedChangedelete = { fg = "#8a6d39", bg = background },
    LineNr = { bg = background },
    CursorLineNr = { bg = background },
    CursorLine = { bg = surface },
    FoldColumn = { bg = background },
    DiffAdd = { bg = "#1e2718" },
    DiffChange = { bg = "#1e1e18" },
    DiffDelete = { bg = "#2a1818" },
  },
}
