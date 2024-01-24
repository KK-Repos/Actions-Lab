const fs = require("fs");

		const data = fs.readFileSync('resultTest.js', { encoding: 'utf8', flag: 'r' });
		const output = JSON.parse(data);
        print("[output]",output)

cypressReportInSlack();
