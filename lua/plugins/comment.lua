return {
    "numToStr/Comment.nvim",
    opts = {
        -- You can put optional config here; leave empty `{}` to use defaults
        padding = true,
        sticky = true,
        mappings = {
            basic = true,
            extra = true,
        },
    },
    config = function(_, opts)
        require("Comment").setup(opts)
    end,
}

