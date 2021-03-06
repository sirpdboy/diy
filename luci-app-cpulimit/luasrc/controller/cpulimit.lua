
module("luci.controller.cpulimit", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/cpulimit") then
		return
	end

	local page = entry({"admin", "control", "cpulimit"}, cbi("cpulimit"), luci.i18n.translate("cpulimit"), 65)
	page.i18n = "cpulimit"
	page.dependent = true
	page.acl_depends = { "luci-app-cpulimit" }

end
