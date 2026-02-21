return { -- Enhanced Swift support
  {
    "git@github.com:wojciech-kulik/xcodebuild.nvim.git",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("xcodebuild").setup()
    end,
  },
}
