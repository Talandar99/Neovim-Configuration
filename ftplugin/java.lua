local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local config = {
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
	'-Dosgi.bundles.defaultStartLevel=4',
	'-Declipse.product=org.eclipse.jdt.ls.core.product',
	'-Dlog.level=ALL', 
	'-noverify', 
	'-Xmx1G',
	'-jar','/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.2.600.jar',
	'-configuration','/usr/share/java/jdtls/config_linux ',
	'-data','$1',
	},
	root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  capabilities = capabilities,
	settings = {
    java = {
    }
  },
  init_options = {
    bundles = {}
  },
}
require('jdtls').start_or_attach(config)
