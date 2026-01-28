# Providers Integrate Plugins

The Providers System integrates CodeCompanion with other Neovim plugins to enhance
its capabilities, particularly in areas like UI selection and code completion.

## Integration Areas

1. **Actions:** Uses picker plugins (Telescope, Mini.Pick, Fzf-Lua, Snacks) to
   display the Action Palette.
2. **Slash Commands:** Uses pickers to select slash commands.
3. **Completion:** Integrates with completion engines (nvim-cmp, blink.cmp, etc.)
   to provide autocompletion for slash commands, variables, and tools within the
   chat buffer.
4. **Diffs:** Uses diff plugins (Mini.Diff) to visualize changes.

## Abstraction

The system uses a provider abstraction layer, allowing CodeCompanion to support
multiple backend plugins for the same functionality. For example, the `actions`
module delegates to the configured provider (e.g., `telescope.lua` or `mini_pick.lua`)
to render the UI.

Tags: #providers #integration #plugins #neovim

## References
- Is a component of: [[202601270000-Codecompanion-architecture-overview.md]]
- Used by: [[202601270005-action-palette.md]]

## Backlinks
- [[202601270000-Codecompanion-architecture-overview.md]]
