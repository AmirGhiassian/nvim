local orig = vim.lsp.handlers["client/registerCapability"]

vim.lsp.handlers["client/registerCapability"] = function(err, result, ctx, config)
  if not result or not result.registrations then
    vim.notify(
      "⚠️ LSP "
        .. (vim.lsp.get_client_by_id(ctx.client_id).name or "unknown")
        .. " sent bad registerCapability payload",
      vim.log.levels.WARN
    )
    return
  end
  return orig(err, result, ctx, config)
end
