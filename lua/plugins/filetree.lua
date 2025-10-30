return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x", -- use latest stable
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- optional for file icons
        "MunifTanjim/nui.nvim",
    },
    opts = {
        window = {
            position = "left",
            width = 35,
        },
        filesystem = {
            follow_current_file = true, -- auto reveal file
            hijack_netrw_behavior = "open_default",
        },
    },
}

