define({
	proxyPort: 9000,
	proxyUrl: 'http://localhost:9000/',

	capabilities: {
		'selenium-version': '2.45.0',
		'idle-timeout': 30
	},
	environments: [
		{ browserName: 'chrome' },
		{ browserName: 'firefox' }
	],

	maxConcurrency: 2,

	tunnel: 'NullTunnel',

	loader: {
		// Packages that should be registered with the loader in each testing environment
		packages: [
			{ name: 'intern-selftest', location: '.' }
		],
		map: {
			'intern-selftest': {
				dojo: 'intern-selftest/node_modules/dojo',
				chai: 'intern-selftest/node_modules/chai/chai',
				diff: 'intern-selftest/node_modules/diff/diff'
			}
		}
	},

	suites: [
		'intern-selftest/tests/unit/all'
	],
	functionalSuites: [
		'intern-selftest/tests/functional/lib/ProxiedSession'
	],

	excludeInstrumentation: /(?:tests|node_modules)\//,

	isSelfTestConfig: true
});
