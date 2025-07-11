{
  "n" = {
    # LSP keymaps
    "<leader>lfd" = {
      action = "<cmd>FzfLua diagnostics_document<cr>";
      desc = "Find buffer diagnostics";
    };
    "<leader>lfD" = {
      action = "<cmd>FzfLua diagnostics_workspace<cr>";
      desc = "Find workspace diagnostics";
    };
    "<leader>ls" = {
      action = "<cmd>FzfLua lsp_document_symbols<cr>";
      desc = "Find lsp document symbols";
    };
    "<leader>ld" = {
      action = "<cmd>FzfLua lsp_definitions<cr>";
      desc = "Float definitions";
    };
    "<leader>lfr" = {
      action = "<cmd>FzfLua lsp_references<cr>";
      desc = "Float references";
    };
    "<leader>li" = {
      action = "<cmd>FzfLua lsp_implementations<cr>";
      desc = "Float implementations";
    };
    "<leader>lt" = {
      action = "<cmd>FzfLua typedefs<cr>";
      desc = "Float typedefs";
    };
    "<leader>la" = {
      action = "<cmd>FzfLua lsp_code_actions<cr>";
      desc = "Code actions";
    };
    
    # FZF keymaps
    "<leader>ff" = {
      action = "<cmd>FzfLua files<CR>";
      desc = "Find files";
    };
    "<leader>fo" = {
      action = "<cmd>FzfLua oldfiles<CR>";
      desc = "Find recent files";
    };
    "<leader>fb" = {
      action = "<cmd>FzfLua buffers<CR>";
      desc = "Find buffers";
    };
    "<leader>fg" = {
      action = "<cmd>FzfLua git_grep<CR>";
      desc = "Git grep";
    };
    "<leader>fl" = {
      action = "<cmd>FzfLua lines<CR>";
      desc = "Find lines in all buffers";
    };
    "<leader>fq" = {
      action = "<cmd>FzfLua quickfix<CR>";
      desc = "Find quickfix";
    };
    "<leader>fk" = {
      action = "<cmd>FzfLua keymaps<CR>";
      desc = "Find keymaps";
    };
    "<leader>fw" = {
      action = "<cmd>FzfLua live_grep<CR>";
      desc = "Live grep";
    };
    "<leader>fW" = {
      action = "<cmd>FzfLua live_grep_resume<CR>";
      desc = "Live grep resume";
    };
    
    # General utilities
    ";" = {
      action = ":";
      desc = "Fuck shift";
    };
    "<leader>c" = {
      action = ":bd<CR>";
      desc = "Close current buffer";
    };
    
    # Window splits
    "|" = {
      action = ":vsplit<CR>";
      desc = "Vertical split window";
    };
    "\\" = {
      action = ":split<CR>";
      desc = "Horizontal split window";
    };
    
    # Window navigation
    "<C-l>" = {
      action = "<C-w>l";
      desc = "Switch to right window";
    };
    "<C-k>" = {
      action = "<C-w>k";
      desc = "Switch to up window";
    };
    "<C-j>" = {
      action = "<C-w>j";
      desc = "Switch to down window";
    };
    "<C-h>" = {
      action = "<C-w>h";
      desc = "Switch to left window";
    };
  };
  
  # Можно добавить другие режимы при необходимости
  "v" = {
    # Visual mode keymaps
  };
  
  "i" = {
    # Insert mode keymaps
  };
}