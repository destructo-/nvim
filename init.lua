require("main")
require("nightfox").setup({
  options = {
    colorblind = {
      enable = true,         -- Enable colorblind support
      simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
      severity = {
        protan = 1,          -- Severity [0,1] for protan (red)
        deutan = 0,          -- Severity [0,1] for deutan (green)
        tritan = 0,          -- Severity [0,1] for tritan (blue)
      }
    }
  }
})

vim.cmd.colorscheme "nightfox"
