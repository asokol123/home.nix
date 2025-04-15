{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>lfd";
        action = ''<cmd>FzfLua diagnostics_document<cr>'';
        options = {
          desc = "Find buffer diagnostics";
        };
      }
      {
        mode = "n";
        key = "<leader>lfD";
        action = ''<cmd>FzfLua diagnostics_workspace<cr>'';
        options = {
          desc = "Find workspace diagnostics";
        };
      }
      {
        mode = "n";
        key = "<leader>ls";
        action = ''<cmd>FzfLua lsp_document_symbols<cr>'';
        options = {
          desc = "Find lsp document symbols";
        };
      }
      {
        mode = "n";
        key = "<leader>ld";
        action = ''<cmd>FzfLua lsp_definitions<cr>'';
        options = {
          desc = "Float definitions";
        };
      }
      {
        mode = "n";
        key = "<leader>lfr";
        action = ''<cmd>FzfLua lsp_references<cr>'';
        options = {
          desc = "Float references";
        };
      }
      {
        mode = "n";
        key = "<leader>li";
        action = ''<cmd>FzfLua lsp_implementations<cr>'';
        options = {
          desc = "Float implementations";
        };
      }
      {
        mode = "n";
        key = "<leader>lt";
        action = ''<cmd>FzfLua typedefs<cr>'';
        options = {
          desc = "Float typedefs";
        };
      }
      {
        mode = "n";
        key = "<leader>la";
        action = ''<cmd>FzfLua lsp_code_actions<cr>'';
        options = {
          desc = "Code actions";
        };
      }
      {
        mode = "n";
        key = "<leader>fq";
        action = ''<cmd>FzfLua quickfix<CR>'';
        options = {
          desc = "Find quickfix";
        };
      }
      {
        mode = "n";
        key = "<leader>fk";
        action = ''<cmd>FzfLua keymaps<CR>'';
        options = {
          desc = "Find keymaps";
        };
      }
      {
        mode = "n";
        key = "<leader>fw";
        action = "<cmd>FzfLua live_grep<CR>";
        options = {
          desc = "Live grep";
        };
      }
      {
        mode = "n";
        key = "<leader>fW";
        action = "<cmd>FzfLua live_grep_resume<CR>";
        options = {
          desc = "Live grep resume";
        };
      }

      {
        mode = "n";
        key = ";";
        action = ":";
        options = {
          desc = "Fuck shift";
        };
      }

      {
        mode = "n";
        key = "<leader>c";
        action = ":bd<CR>";
        options = {
          desc = "Close current buffer";
        };
      }

      {
        mode = "n";
        key = "|";
        action = ":vsplit<CR>";
        options = {
          desc = "Vertical split window";
        };
      }
      {
        mode = "n";
        key = "\\";
        action = ":split<CR>";
        options = {
          desc = "Horizonal split window";
        };
      }

      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options = {
          desc = "Switch to right window";
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options = {
          desc = "Switch to up window";
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options = {
          desc = "Switch to up window";
        };
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options = {
          desc = "Switch to left window";
        };
      }
    ];
  };
}
