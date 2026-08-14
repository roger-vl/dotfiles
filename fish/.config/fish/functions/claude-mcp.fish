function claude-mcp --description 'Launch claude with the on-demand MCP server library'
    # MCP servers are kept out of ~/.claude.json so plain `claude` starts light.
    # This loads the full library only when you need MCP tools.
    claude --strict-mcp-config --mcp-config $HOME/.claude/mcp-library.json $argv
end
