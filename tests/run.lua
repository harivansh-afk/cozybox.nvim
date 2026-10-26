for _, scheme in ipairs({ "cozybox", "cozybox-light" }) do
  vim.cmd.colorscheme(scheme)
  assert(vim.g.colors_name == scheme, scheme .. ": colors_name")
  local c = require("cozybox").palettes[vim.o.background]
  local function fg(name)
    return string.format("#%06x", vim.api.nvim_get_hl(0, { name = name, link = true }).fg)
  end
  assert(fg("Normal") == c.fg1, scheme .. ": Normal")
  for _, name in ipairs({ "Function", "Title", "Directory" }) do
    assert(fg(name) == c.blue, scheme .. ": " .. name .. " is not blue")
  end
  assert(vim.g.terminal_color_4 == c.terminal[5], scheme .. ": terminal colors")
end
print("ok")
