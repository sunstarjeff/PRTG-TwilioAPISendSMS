
# PRTG-TwilioAPISendSMS
Send PRTG SMS notification via Twilio using Powershell

## Quick Start

- Make sure .Net Framework 4.5 is install on your core PRTG server.

- *If needed, read this KB article: How can I use PowerShell scripts with PRTG's 'Execute Program' notification? ([https://helpdesk.paessler.com/en/support/solutions/articles/76000064755-how-can-i-use-powershell-scripts-with-prtg-s-execute-program-notification-](https://helpdesk.paessler.com/en/support/solutions/articles/76000064755-how-can-i-use-powershell-scripts-with-prtg-s-execute-program-notification-)).*

- Copy the Powershell script to the \Notifications\EXE\ subfolder of your PRTG core server program directory.

- Go to PRTG > Setup > Account Settings > Notification Templates
- Choose "Execute Program" option

	> **Executable File:** choose the Powershell script from the drop-down list.

	> **Parameters:** *(example)*:
	-AccountSid "AC00xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -AuthToken "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" -FromNumber "+10000000000" -ToNumber "+10000000000" -MessageBody "%device %shortname: %status %down (%message)"
