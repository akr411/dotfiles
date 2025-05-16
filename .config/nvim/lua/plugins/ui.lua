return {
  {
    "aktersnurra/no-clown-fiesta.nvim",
    lazy = true,
    opts = {
      transparent = true,
      styles = {
        keywords = { bold = true },
        comments = { italic = true },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            layout = { layout = { position = "right" } },
          },
        },
      },
      dashboard = {
        sections = {
          { section = "header" },
          { pane = 2, section = "terminal", cmd = "colorscript -e blocks1", height = 5, padding = 1 },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
        preset = {
          header = [[
            ,,,,,,            
        o#'9MMHb':'-,o,       
     .oH":HH$' "' ' -*R&o,    
    dMMM*""'`'      .oM"HM?.  
  ,MMM'          "HLbd< ?&H\  
 .:MH ."\          ` MM  MM&b 
. "*H    -        &MMMMMMMMMH:
.    dboo        MMMMMMMMMMMM.
.   dMMMMMMb      *MMMMMMMMMP.
.    MMMMMMMP        *MMMMMP .
     `#MMMMM           MM6P , 
 '    `MMMP"           HM*`,  
  '    :MM             .- ,   
   '.   `#?..  .       ..'    
      -.   .         .-       
        ''-.oo,oo.-''         
]],
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_a = {},
        lualine_z = {},
      },
    },
  },
}
