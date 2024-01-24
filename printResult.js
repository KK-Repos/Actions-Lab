const fs = require("fs");

		const data = fs.readFileSync('slackReport/output.json', { encoding: 'utf8', flag: 'r' });
		const output = JSON.parse(data);
        print("[output]",output)

cypressReportInSlack();
