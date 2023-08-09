local ensure_install = {"prettier", "golines"}

require("mason").setup()

for _, package in pairs(ensure_install) do
	vim.cmd("MasonInstall " .. package)
end
