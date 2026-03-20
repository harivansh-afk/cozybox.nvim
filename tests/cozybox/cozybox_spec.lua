require("plenary.reload").reload_module("cozybox", true)
local cozybox = require("cozybox")
local default = cozybox.config

local function clear_term_colors()
  for item = 0, 15 do
    vim.g["terminal_color_" .. item] = nil
  end
end

describe("tests", function()
  it("works with default values", function()
    cozybox.setup()
    assert.are.same(cozybox.config, default)
  end)

  it("works with config overrides", function()
    cozybox.setup({ undercurl = false, underline = false })
    assert.is_false(cozybox.config.undercurl)
    assert.is_false(cozybox.config.underline)
    assert.are.same(cozybox.config.contrast, "hard")
    assert.are.same(cozybox.config.palette_overrides.bright_blue, "#5b84de")
    assert.are.same(cozybox.config.overrides.Normal.bg, "#181818")
  end)

  it("should override a hightlight color", function()
    local config = {
      overrides = {
        Search = { fg = "#ff9900", bg = "#000000" },
        ColorColumn = { bg = "#ff9900" },
      },
    }

    cozybox.setup(config)
    cozybox.load()

    local search_group_id = vim.api.nvim_get_hl_id_by_name("Search")
    local search_values = {
      background = vim.fn.synIDattr(search_group_id, "bg", "gui"),
      foreground = vim.fn.synIDattr(search_group_id, "fg", "gui"),
    }

    assert.are.same(search_values, { background = "#000000", foreground = "#ff9900" })

    local color_column_group_id = vim.api.nvim_get_hl_id_by_name("ColorColumn")
    local color_column_values = {
      background = vim.fn.synIDattr(color_column_group_id, "bg", "gui"),
    }

    assert.are.same(color_column_values, { background = "#ff9900" })
  end)

  it("should create new hightlights colors if they dont exist", function()
    local config = {
      overrides = {
        Search = { fg = "#ff9900", bg = "#000000" },
        New = { bg = "#ff9900" },
      },
    }

    cozybox.setup(config)
    cozybox.load()

    local search_group_id = vim.api.nvim_get_hl_id_by_name("Search")
    local search_values = {
      background = vim.fn.synIDattr(search_group_id, "bg", "gui"),
      foreground = vim.fn.synIDattr(search_group_id, "fg", "gui"),
    }

    assert.are.same(search_values, { background = "#000000", foreground = "#ff9900" })

    local new_group_id = vim.api.nvim_get_hl_id_by_name("New")
    local new_group_values = {
      background = vim.fn.synIDattr(new_group_id, "bg", "gui"),
    }

    assert.are.same(new_group_values, { background = "#ff9900" })
  end)

  it("should override links", function()
    local config = {
      overrides = {
        TelescopePreviewBorder = { fg = "#990000", bg = nil },
      },
    }
    cozybox.setup(config)
    cozybox.load()

    local group_id = vim.api.nvim_get_hl_id_by_name("TelescopePreviewBorder")
    local values = {
      fg = vim.fn.synIDattr(group_id, "fg", "gui"),
    }

    local expected = {
      fg = "#990000",
    }
    assert.are.same(expected, values)
  end)

  it("should override palette", function()
    local config = {
      palette_overrides = {
        gray = "#ff9900",
      },
    }

    cozybox.setup(config)
    cozybox.load()

    local group_id = vim.api.nvim_get_hl_id_by_name("Comment")
    local values = {
      fg = vim.fn.synIDattr(group_id, "fg", "gui"),
    }
    assert.are.same(values, { fg = "#ff9900" })
  end)

  it("does not set terminal colors when terminal_colors is false", function()
    clear_term_colors()
    cozybox.setup({ terminal_colors = false })
    cozybox.load()
    assert.is_nil(vim.g.terminal_color_0)
  end)

  it("sets terminal colors when terminal_colors is true", function()
    clear_term_colors()
    cozybox.setup({ terminal_colors = true })
    cozybox.load()

    -- dark bg
    local colors = require("cozybox").palette
    vim.opt.background = "dark"
    assert.are.same(vim.g.terminal_color_0, colors.dark0_hard)

    -- light bg
    clear_term_colors()
    cozybox.load()
    vim.opt.background = "light"
    assert.are.same(vim.g.terminal_color_0, colors.light0_hard)
  end)

  it("multiple calls to setup() are independent", function()
    -- First call to setup
    cozybox.setup({
      contrast = "soft",
      overrides = { CursorLine = { bg = "#FF0000" } },
    })
    assert.are.same(cozybox.config.contrast, "soft")
    assert.are.same(cozybox.config.overrides.CursorLine.bg, "#FF0000")

    -- Second call to setup
    cozybox.setup({ contrast = "hard" })
    assert.are.same(cozybox.config.contrast, "hard")
    -- Check that overrides from the first call are reset to the cozybox defaults
    assert.are.same(cozybox.config.overrides.CursorLine.bg, "#1e1e1e")

    -- Third call to setup with different overrides
    cozybox.setup({
      overrides = { Normal = { fg = "#00FF00" } },
    })
    assert.are.same(cozybox.config.contrast, "hard") -- Contrast should be reset to the cozybox default
    assert.are.same(cozybox.config.overrides.CursorLine.bg, "#1e1e1e") -- Default CursorLine override is preserved
    assert.are.same(cozybox.config.overrides.Normal.fg, "#00FF00") -- New override is present

    -- Call setup with no arguments to reset to defaults
    cozybox.setup()
    assert.are.same(cozybox.config.contrast, "hard")
    assert.are.same(cozybox.config.overrides.Normal.bg, "#181818")
  end)

  it("supports custom colorscheme names during load", function()
    cozybox.setup()
    vim.opt.background = "light"
    cozybox.load("cozybox-light")

    assert.are.same(vim.g.colors_name, "cozybox-light")
  end)
end)
