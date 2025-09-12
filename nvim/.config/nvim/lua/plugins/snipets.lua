return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  ft = { "markdown", "go", "lua" },
  opts = function(_, opts)
    local ls = require("luasnip")

    -- preserve original opts for lazyvim
    opts = vim.tbl_deep_extend("force", opts, {
      history = true,
      delete_check_events = "TextChanged",
    })

    local newSnippet = ls.snippet
    local txtNode = ls.text_node
    local inNode = ls.insert_node
    local funcNode = ls.function_node

    local function clipboard()
      return vim.fn.getreg("+")
    end

    -- Customs snippets
    -- che the filetype with :set ft
    local function codeBlockSnipp(lang)
      return newSnippet(lang, {
        txtNode({ "```", lang, "" }),
        inNode(1),
        txtNode({ "", "```" }),
      })
    end

    local langs = {
      "txt",
      "sql",
      "lua",
      "go",
      "bash",
      "markdown",
      "json",
      "jsonc",
    }

    local snippets = {}

    for _, lang in ipairs(langs) do
      table.insert(snippets, codeBlockSnipp(lang))
    end

    table.insert(
      snippets,
      newSnippet({
        trig = "link blank",
        name = '-> [](:target="_blank")',
      }, {
        txtNode("["),
        inNode(1),
        txtNode("]("),
        inNode(2),
        txtNode(")"),
      })
    )

    table.insert(
      snippets,
      newSnippet({
        trig = "link copy",
        name = "-> [](paste)",
      }, {
        txtNode("["),
        inNode(1),
        txtNode("]("),
        funcNode(clipboard, {}),
        txtNode(")"),
      })
    )

    table.insert(
      snippets,
      newSnippet({
        trig = "todo",
        name = "Add TODO: item",
        desc = "Add TODO: item",
      }, {
        txtNode("<!-- TODO: "),
        inNode(1),
        txtNode(" -->"),
      })
    )

    ls.add_snippets("markdown", snippets)
  end,
}
