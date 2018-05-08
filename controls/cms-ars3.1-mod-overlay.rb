# encoding: utf-8

include_controls "inspec-profile-disa_stig-el7" do
  
  control "V-71855" do
    tag "cci": "CCI-002704"
    tag "nist": ["SI-7", "Rev_4"]
  end 
  
  control "V-71859" do
    title "The operating system must display the Standard Mandatory CMS Banner before granting local or remote access to the system via a graphical user logon."
    desc "Display of a standardized and approved use notification before granting access to the operating system ensures privacy and security notification verbiage used is consistent with applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance.

The approved banner states:
'* This warning banner provides privacy and security notices consistent with applicable federal laws, directives, and other federal guidance for accessing this Government system, which includes (1) this computer network, (2) all computers connected to this network, and (3) all devices and storage media attached to this network or to a computer on this network.
* This system is provided for Government authorized use only.
* Unauthorized or improper use of this system is prohibited and may result in disciplinary action and/or civil and criminal penalties.
* Personal use of social media and networking sites on this system is limited as to not interfere with official work duties and is subject to monitoring.
* By using this system, you understand and consent to the following:
- The Government may monitor, record, and audit your system usage, including usage of personal devices and email systems for official duties or to conduct HHS business. Therefore, you have no reasonable expectation of privacy regarding any communication or data transiting or stored on this system. At any time, and for any lawful Government purpose, the government may monitor, intercept, and search and seize any communication or data transiting or stored on this system.
- Any communication or data transiting or stored on this system may be disclosed or used for any lawful Government purpose'"
      tag "check": "Verify the operating system displays the Standard Mandatory CMS Banner before granting access to the operating system via a graphical user logon.
	
Note: If the system does not have GNOME installed, this requirement is Not Applicable. 

Check to see if the operating system displays a banner at the logon screen with the following command:

# grep banner-message-enable /etc/dconf/db/local.d/*
banner-message-enable=true

If 'banner-message-enable' is set to 'false' or is missing, this is a finding."
	  tag "fix": "Configure the operating system to display the Standard Mandatory CMS Banner before granting access to the system.

Note: If the system does not have GNOME installed, this requirement is Not Applicable.

Create a database to contain the system-wide graphical user logon settings (if it does not already exist) with the following command:

# touch /etc/dconf/db/local.d/01-banner-message

Add the following line to the [org/gnome/login-screen] section of the '/etc/dconf/db/local.d/01-banner-message':

[org/gnome/login-screen]
banner-message-enable=true

Update the system databases:

# dconf update

Users must log out and back in again before the system-wide settings take
effect."
	end 
  
  control "V-71861" do
  	title "The operating system must display the approved Standard Mandatory CMS Banner before granting local or remote access to the system via a graphical user logon."
	  desc 'Display of a standardized and approved use notification before granting access to the operating system ensures privacy and security notification verbiage used is consistent with applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance.

The approved banner states:
"* This warning banner provides privacy and security notices consistent with applicable federal laws, directives, and other federal guidance for accessing this Government system, which includes (1) this computer network, (2) all computers connected to this network, and (3) all devices and storage media attached to this network or to a computer on this network.
* This system is provided for Government authorized use only.
* Unauthorized or improper use of this system is prohibited and may result in disciplinary action and/or civil and criminal penalties.
* Personal use of social media and networking sites on this system is limited as to not interfere with official work duties and is subject to monitoring.
* By using this system, you understand and consent to the following:
- The Government may monitor, record, and audit your system usage, including usage of personal devices and email systems for official duties or to conduct HHS business. Therefore, you have no reasonable expectation of privacy regarding any communication or data transiting or stored on this system. At any time, and for any lawful Government purpose, the government may monitor, intercept, and search and seize any communication or data transiting or stored on this system.
- Any communication or data transiting or stored on this system may be disclosed or used for any lawful Government purpose'
	tag 'check': 'Verify the operating system displays the approved Standard Mandatory CMS Banner before granting access to the operating system via a graphical user logon.

Note: If the system does not have GNOME installed, this requirement is Not Applicable. 

Check that the operating system displays the exact approved Standard Mandatory CMS Notice and Consent Banner text with the command:

# grep banner-message-text /etc/dconf/db/local.d/*
banner-message-text=
\'* This warning banner provides privacy and security notices consistent with applicable federal laws, directives, and other federal guidance for accessing this Government system, which includes (1) this computer network, (2) all computers connected to this network, and (3) all devices and storage media attached to this network or to a computer on this network.
* This system is provided for Government authorized use only.
* Unauthorized or improper use of this system is prohibited and may result in disciplinary action and/or civil and criminal penalties.
* Personal use of social media and networking sites on this system is limited as to not interfere with official work duties and is subject to monitoring.
* By using this system, you understand and consent to the following:
- The Government may monitor, record, and audit your system usage, including usage of personal devices and email systems for official duties or to conduct HHS business. Therefore, you have no reasonable expectation of privacy regarding any communication or data transiting or stored on this system. At any time, and for any lawful Government purpose, the government may monitor, intercept, and search and seize any communication or data transiting or stored on this system.
- Any communication or data transiting or stored on this system may be disclosed or used for any lawful Government purpose\'

Note: The "\n " characters are for formatting only. They will not be displayed on the GUI.

If the banner does not match the approved Standard Mandatory CMS Notice and Consent Banner, this is a finding.'
      tag 'fix': 'Configure the operating system to display the approved Standard Mandatory CMS Banner before granting access to the system.

Note: If the system does not have GNOME installed, this requirement is Not Applicable.

Create a database to contain the system-wide graphical user logon settings (if it does not already exist) with the following command:

# touch /etc/dconf/db/local.d/01-banner-message

Add the following line to the [org/gnome/login-screen] section of the "/etc/dconf/db/local.d/01-banner-message":

[org/gnome/login-screen]

banner-message-enable=true

banner-message-text=\'* This warning banner provides privacy and security notices consistent with applicable federal laws, directives, and other federal guidance for accessing this Government system, which includes (1) this computer network, (2) all computers connected to this network, and (3) all devices and storage media attached to this network or to a computer on this network.
* This system is provided for Government authorized use only.
* Unauthorized or improper use of this system is prohibited and may result in disciplinary action and/or civil and criminal penalties.
* Personal use of social media and networking sites on this system is limited as to not interfere with official work duties and is subject to monitoring.
* By using this system, you understand and consent to the following:
- The Government may monitor, record, and audit your system usage, including usage of personal devices and email systems for official duties or to conduct HHS business. Therefore, you have no reasonable expectation of privacy regarding any communication or data transiting or stored on this system. At any time, and for any lawful Government purpose, the government may monitor, intercept, and search and seize any communication or data transiting or stored on this system.
- Any communication or data transiting or stored on this system may be disclosed or used for any lawful Government purpose\'

Note: The "\n " characters are for formatting only. They will not be displayed on the GUI.

Run the following command to update the database:
# dconf update'
	end

  control 'V-71863' do
	title 'The operating system must display the Standard Mandatory CMS Notice and Consent Banner before granting local or remote access to the system via a command line user logon.'
	desc 'Display of a standardized and approved use notification before granting access to the operating system ensures privacy and security notification verbiage used is consistent with applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance.

The approved banner states:
"* This warning banner provides privacy and security notices consistent with applicable federal laws, directives, and other federal guidance for accessing this Government system, which includes (1) this computer network, (2) all computers connected to this network, and (3) all devices and storage media attached to this network or to a computer on this network.
* This system is provided for Government authorized use only.
* Unauthorized or improper use of this system is prohibited and may result in disciplinary action and/or civil and criminal penalties.
* Personal use of social media and networking sites on this system is limited as to not interfere with official work duties and is subject to monitoring.
* By using this system, you understand and consent to the following:
- The Government may monitor, record, and audit your system usage, including usage of personal devices and email systems for official duties or to conduct HHS business. Therefore, you have no reasonable expectation of privacy regarding any communication or data transiting or stored on this system. At any time, and for any lawful Government purpose, the government may monitor, intercept, and search and seize any communication or data transiting or stored on this system.
- Any communication or data transiting or stored on this system may be disclosed or used for any lawful Government purpose"'
	tag 'check': 'Verify the operating system displays the Standard Mandatory CMS Notice and Consent Banner before granting access to the operating system via a command line user logon.

Check to see if the operating system displays a banner at the command line logon screen with the following command:

# more /etc/issue

The command should return the following text:
"* This warning banner provides privacy and security notices consistent with applicable federal laws, directives, and other federal guidance for accessing this Government system, which includes (1) this computer network, (2) all computers connected to this network, and (3) all devices and storage media attached to this network or to a computer on this network.
* This system is provided for Government authorized use only.
* Unauthorized or improper use of this system is prohibited and may result in disciplinary action and/or civil and criminal penalties.
* Personal use of social media and networking sites on this system is limited as to not interfere with official work duties and is subject to monitoring.
* By using this system, you understand and consent to the following:
- The Government may monitor, record, and audit your system usage, including usage of personal devices and email systems for official duties or to conduct HHS business. Therefore, you have no reasonable expectation of privacy regarding any communication or data transiting or stored on this system. At any time, and for any lawful Government purpose, the government may monitor, intercept, and search and seize any communication or data transiting or stored on this system.
- Any communication or data transiting or stored on this system may be disclosed or used for any lawful Government purpose"

If the operating system does not display a graphical logon banner or the banner does not match the Standard Mandatory CMS Notice and Consent Banner, this is a finding.

If the text in the "/etc/issue" file does not match the Standard Mandatory CMS Notice and Consent Banner, this is a finding.'
	tag 'fix': 'Configure the operating system to display the Standard Mandatory CMS Notice and Consent Banner before granting access to the system via the command line by editing the "/etc/issue" file.

Replace the default text with the Standard Mandatory CMS Notice and Consent Banner. The CMS required text is:

"* This warning banner provides privacy and security notices consistent with applicable federal laws, directives, and other federal guidance for accessing this Government system, which includes (1) this computer network, (2) all computers connected to this network, and (3) all devices and storage media attached to this network or to a computer on this network.
* This system is provided for Government authorized use only.
* Unauthorized or improper use of this system is prohibited and may result in disciplinary action and/or civil and criminal penalties.
* Personal use of social media and networking sites on this system is limited as to not interfere with official work duties and is subject to monitoring.
* By using this system, you understand and consent to the following:
- The Government may monitor, record, and audit your system usage, including usage of personal devices and email systems for official duties or to conduct HHS business. Therefore, you have no reasonable expectation of privacy regarding any communication or data transiting or stored on this system. At any time, and for any lawful Government purpose, the government may monitor, intercept, and search and seize any communication or data transiting or stored on this system.
- Any communication or data transiting or stored on this system may be disclosed or used for any lawful Government purpose"'
	end
  
  control "V-71911" do
  title "When passwords are changed a minimum of six of the total number of
characters must be changed."
  tag "check": "The \"difok\" option sets the number of characters in a
password that must not be present in the old password.
Check for the value of the \"difok\" option in \"/etc/security/pwquality.conf\"
with the following command:
# grep difok /etc/security/pwquality.conf
difok = 6
If the value of \"difok\" is set to less than \"8\", this is a finding."
  tag "fix": "Configure the operating system to require the change of at least
eight of the total number of characters when passwords are changed by setting
the \"difok\" option.
Add the following line to \"/etc/security/pwquality.conf\" (or modify the line
to have the required value):
difok = 6"
  end
  
end

