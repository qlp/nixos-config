return {
	entry = function()
		local h = cx.active.current.hovered
		local hx_command = ':o ' .. tostring(h.url)
		local command = 'zellij ac focus-next-pane && zellij ac write 27 && zellij ac write-chars "' .. hx_command .. '" && zellij ac write 13 '
		-- zellij ac focus-next-pane && zellij ac write 27 && zellij ac write-chars ":o flake.nix" && zellij ac write 13
		os.execute(command)
	end,
}
