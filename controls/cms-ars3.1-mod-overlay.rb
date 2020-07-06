# encoding: utf-8

include_controls "inspec-profile-disa_stig-el7" do
  
  control "V-71855" do
    impact 0.0
    desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not applied to this system categorization in CMS ARS 3.1'
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
If the value of \"difok\" is set to less than \"6\", this is a finding."
  tag "fix": "Configure the operating system to require the change of at least
eight of the total number of characters when passwords are changed by setting
the \"difok\" option.
Add the following line to \"/etc/security/pwquality.conf\" (or modify the line
to have the required value):
difok = 6"
  end
	
control 'V-71913' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related requirement is not included in IA-5(1) in CMS ARS 3.1'
end 

control 'V-71915' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related requirement is not included in IA-5(1) in CMS ARS 3.1'
end 

control 'V-71917' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related requirement is not included in IA-5(1) in CMS ARS 3.1'
end 

control 'V-71933' do
	title 'Passwords must be prohibited from reuse for a minimum of 6 generations.'
	tag 'check': 'Verify the operating system prohibits password reuse for a minimum of 6 generations.

Check for the value of the "remember" argument in "/etc/pam.d/system-auth-ac" with the following command:

# grep -i remember /etc/pam.d/system-auth-ac
password sufficient pam_unix.so use_authtok sha512 shadow remember=6

If the line containing the "pam_unix.so" line does not have the "remember" module argument set, or the value of the "remember" module argument is set to less than "6", this is a finding.'
	tag 'fix': 'Configure the operating system to prohibit password reuse for a minimum of 6 generations.

Add the following line in "/etc/pam.d/system-auth-ac" (or modify the line to have the required value):

password sufficient pam_unix.so use_authtok sha512 shadow remember=6'
	end

control 'V-71941' do
	desc 'Inactive identifiers pose a risk to systems and applications because attackers may exploit an inactive identifier and potentially obtain undetected access to the system. Owners of inactive accounts will not notice if unauthorized access to their user account has been obtained.

Operating systems need to track periods of inactivity and disable application identifiers after 60 days of inactivity.'
	tag 'check': 'Verify the operating system disables account identifiers (individuals, groups, roles, and devices) after the password expires with the following command:

# grep -i inactive /etc/default/useradd
INACTIVE=60

If the value is not set to "60", is commented out, or is not defined, this is a finding.'
	tag 'fix': 'Configure the operating system to disable account identifiers (individuals, groups, roles, and devices) after the password expires.

Add the following line to "/etc/default/useradd" (or modify the line to have the required value):

INACTIVE=60'
	end

control 'V-71943' do
	title "Accounts subject to five unsuccessful logon attempts within 120 minutes must be locked for one hour."
	tag 'check': 'Verify the operating system automatically locks an account for one hour.

Check that the system locks an account for one hour after five unsuccessful logon attempts within a period of 120 minutes with the following command:

# grep pam_faillock.so /etc/pam.d/password-auth-ac
auth        required       pam_faillock.so preauth silent audit deny=5 even_deny_root unlock_time=3600
auth        [default=die]  pam_faillock.so authfail audit deny=5 even_deny_root unlock_time=3600
account required pam_faillock.so 

If the "unlock_time" setting is greater than "3600" on both lines with the "pam_faillock.so" module name or is missing from a line, this is a finding.

# grep pam_faillock.so /etc/pam.d/system-auth-ac
auth required pam_faillock.so preauth silent audit deny=5 even_deny_root unlock_time=3600
auth [default=die] pam_faillock.so authfail audit deny=5 even_deny_root unlock_time=3600
account required pam_faillock.so 

If the "unlock_time" setting is greater than "3600" on both lines with the "pam_faillock.so" module name or is missing from a line, this is a finding.'
	tag 'fix': 'Configure the operating system to lock an account for one hour when five unsuccessful logon attempts in 120 minutes are made.

Modify the first three lines of the auth section of the "/etc/pam.d/system-auth-ac" and "/etc/pam.d/password-auth-ac" files to match the following lines:

auth        required       pam_faillock.so preauth silent audit deny=5 even_deny_root fail_interval=7200 unlock_time=3600
auth        sufficient     pam_unix.so try_first_pass
auth        [default=die]  pam_faillock.so authfail audit deny=5 even_deny_root fail_interval=7200 unlock_time=3600
account required pam_faillock.so'
	end

control 'V-71945' do
	title 'If five unsuccessful root logon attempts within 120 minutes occur the associated account must be locked.'
	tag 'check': 'Verify the operating system automatically locks the root account until it is released by an administrator when five unsuccessful logon attempts in 120 minutes are made.

# grep pam_faillock.so /etc/pam.d/password-auth-ac
auth required pam_faillock.so preauth silent audit deny=5 even_deny_root unlock_time=7200 fail_interval=3600 
auth [default=die] pam_faillock.so authfail audit deny=5 even_deny_root unlock_time=7200 fail_interval=3600
account required pam_faillock.so

If the "even_deny_root" setting is not defined on both lines with the "pam_faillock.so" module name, this is a finding.

# grep pam_faillock.so /etc/pam.d/system-auth-ac
auth required pam_faillock.so preauth silent audit deny=5 even_deny_root unlock_time=7200 fail_interval=3600 
auth [default=die] pam_faillock.so authfail audit deny=5 even_deny_root unlock_time=7200 fail_interval=3600
account required pam_faillock.so

If the "even_deny_root" setting is not defined on both lines with the "pam_faillock.so" module name, this is a finding.'
	tag 'fix': 'Configure the operating system to automatically lock the root account until the locked account is released by an administrator when three unsuccessful logon attempts in 30 minutes are made.

Modify the first three lines of the auth section of the "/etc/pam.d/system-auth-ac" and "/etc/pam.d/password-auth-ac" files to match the following lines:

auth        required       pam_faillock.so preauth silent audit deny=5 even_deny_root fail_interval=7200 unlock_time=3600
auth        sufficient     pam_unix.so try_first_pass
auth        [default=die]  pam_faillock.so authfail audit deny=5 even_deny_root fail_interval=7200 unlock_time=3600
account required pam_faillock.so

Note: Any updates made to "/etc/pam.d/system-auth-ac" and "/etc/pam.d/password-auth-ac" may be overwritten by the "authconfig" program. The "authconfig" program should not be used.'
	end

control 'V-71947' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
end

control 'V-71949' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
end

control 'V-71951' do
	desc "Configuring the operating system to implement organization-wide security implementation guides and security checklists verifies compliance with federal standards and establishes a common security baseline that reflects the most restrictive security posture consistent with operational requirements.

Configuration settings are the set of parameters that can be changed in hardware, software, or firmware components of the system that affect the security posture and/or functionality of the system. Security-related parameters are those parameters impacting the security state of the system, including the parameters required to satisfy other security control requirements. Security-related parameters include, for example, registry settings; account, file, and directory permission settings; and settings for functions, ports, protocols, services, and remote connections."
	end

control 'V-71973' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
end

control 'V-71975' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
end

control 'V-71977' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not applied to this system categorization in CMS ARS 3.1'
end

control 'V-71979' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not applied to this system categorization in CMS ARS 3.1'
end

control 'V-71981' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not applied to this system categorization in CMS ARS 3.1'
end

control 'V-71987' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
end

control 'V-71989' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not applied to this system categorization in CMS ARS 3.1'
end

control 'V-71991' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not applied to this system categorization in CMS ARS 3.1'
end

control 'V-72007' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
end

control 'V-72009' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
end

control 'V-72067' do
	tag 'check': 'Verify the operating system implements approved encryption to protect the confidentiality of remote access sessions.

Check to see if the "dracut-fips" package is installed with the following command:

# yum list installed | grep dracut-fips

dracut-fips-033-360.el7_2.x86_64.rpm

If a "dracut-fips" package is installed, check to see if the kernel command line is configured to use FIPS mode with the following command:

Note: GRUB 2 reads its configuration from the "/boot/grub2/grub.cfg" file on traditional BIOS-based machines and from the "/boot/efi/EFI/redhat/grub.cfg" file on UEFI machines.

# grep fips /boot/grub2/grub.cfg
/vmlinuz-3.8.0-0.40.el7.x86_64 root=/dev/mapper/rhel-root ro rd.md=0 rd.dm=0 rd.lvm.lv=rhel/swap crashkernel=auto rd.luks=0 vconsole.keymap=us rd.lvm.lv=rhel/root rhgb fips=1 quiet

If the kernel command line is configured to use FIPS mode, check to see if the system is in FIPS mode with the following command:

# cat /proc/sys/crypto/fips_enabled 
1

If a "dracut-fips" package is not installed, the kernel command line does not have a fips entry, or the system has a value of "0" for "fips_enabled" in "/proc/sys/crypto", this is a finding.'
	tag 'fix': 'Configure the operating system to implement approved encryption by installing the dracut-fips package.

To enable strict FIPS compliance, the fips=1 kernel option needs to be added to the kernel command line during system installation so key generation is done with FIPS-approved algorithms and continuous monitoring tests in place.

Configure the operating system to implement approved encryption by following the steps below: 

The fips=1 kernel option needs to be added to the kernel command line during system installation so that key generation is done with FIPS-approved algorithms and continuous monitoring tests in place. Users should also ensure that the system has plenty of entropy during the installation process by moving the mouse around, or if no mouse is available, ensuring that many keystrokes are typed. The recommended amount of keystrokes is 256 and more. Less than 256 keystrokes may generate a non-unique key.

For proper operation of the in-module integrity verification, the prelink has to be disabled. This can be done by configuring PRELINKING=no in the "/etc/sysconfig/prelink" configuration file. Existing prelinking, if any, should be undone on all system files using the prelink -u -a command.

Install the dracut-fips package with the following command:

# yum install dracut-fips

Recreate the "initramfs" file with the following command:

Note: This command will overwrite the existing "initramfs" file.

# dracut -f

Modify the kernel command line of the current kernel in the "grub.cfg" file by adding the following option to the GRUB_CMDLINE_LINUX key in the "/etc/default/grub" file and then rebuild the "grub.cfg" file:

fips=1

Changes to "/etc/default/grub" require rebuilding the "grub.cfg" file as follows:

On BIOS-based machines, use the following command:

# grub2-mkconfig -o /boot/grub2/grub.cfg

On UEFI-based machines, use the following command:

# grub2-mkconfig -o /boot/efi/EFI/redhat/grub.cfg

If /boot or /boot/efi reside on separate partitions, the kernel parameter boot=<partition of /boot or /boot/efi> must be added to the kernel command line. You can identify a partition by running the df /boot or df /boot/efi command:

# df /boot
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sda1               495844     53780    416464  12% /boot

To ensure the boot= configuration option will work even if device naming changes between boots, identify the universally unique identifier (UUID) of the partition with the following command:

# blkid /dev/sda1
/dev/sda1: UUID="05c000f1-a213-759e-c7a2-f11b7424c797" TYPE="ext4"
'
	end	

control 'V-72083' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
end

control 'V-72085' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
end

control 'V-72087' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
end

control 'V-72089' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not applied to this system categorization in CMS ARS 3.1'
end

control 'V-72091' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not applied to this system categorization in CMS ARS 3.1'
end

control 'V-72093' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not applied to this system categorization in CMS ARS 3.1'
end

control 'V-72217' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not applied to this system categorization in CMS ARS 3.1'
end

control 'V-72221' do
	desc "Unapproved mechanisms that are used for authentication to the cryptographic module are not verified and therefore cannot be relied upon to provide confidentiality or integrity, and CMS data may be compromised.

Operating systems utilizing encryption are required to use FIPS-compliant mechanisms for authenticating to cryptographic modules.

FIPS 140-2 is the current standard for validating that mechanisms used to access cryptographic modules utilize authentication that meets DoD requirements. This allows for Security Levels 1, 2, 3, or 4 for use on a general purpose computing system."
	end	

control 'V-72223' do
	title 'All network connections associated with a communication session must be terminated at the end of the session or after 30 minutes of inactivity from the user at a command prompt, except to fulfill documented and validated mission requirements.'
	tag 'check': 'Verify the operating system terminates all network connections associated with a communications session at the end of the session or based on inactivity.

Check the value of the system inactivity timeout with the following command:

# grep -i tmout /etc/bashrc /etc/profile.d/*

TMOUT=1800

If "TMOUT" is not set to "1800" or less in "/etc/bashrc" or in a script created to enforce session termination after inactivity, this is a finding.'
	tag 'fix': 'Configure the operating system to terminate all network connections associated with a communications session at the end of the session or after a period of inactivity.

Add or update the following lines in "/etc/profile".

TMOUT=1800
readonly TMOUT
export TMOUT

Or create a script to enforce the inactivity timeout (for example /etc/profile.d/tmout.sh) such as:

#!/bin/bash

TMOUT=1800
readonly TMOUT
export TMOUT'
	end

control 'V-72225' do
	title 'The Standard Mandatory CMS Notice and Consent Banner must be displayed immediately prior to, or as part of, remote access logon prompts.'
	desc 'Display of a standardized and approved use notification before granting access to the publicly accessible operating system ensures privacy and security notification verbiage used is consistent with applicable federal laws, Executive Orders, directives, policies, regulations, standards, and guidance.

System use notifications are required only for access via logon interfaces with human users and are not required when such human interfaces do not exist.

The banner must be formatted in accordance with applicable CMS policy. Use the following verbiage for operating systems that can accommodate banners:
"* This warning banner provides privacy and security notices consistent with applicable federal laws, directives, and other federal guidance for accessing this Government system, which includes (1) this computer network, (2) all computers connected to this network, and (3) all devices and storage media attached to this network or to a computer on this network.
* This system is provided for Government authorized use only.
* Unauthorized or improper use of this system is prohibited and may result in disciplinary action and/or civil and criminal penalties.
* Personal use of social media and networking sites on this system is limited as to not interfere with official work duties and is subject to monitoring.
* By using this system, you understand and consent to the following:
- The Government may monitor, record, and audit your system usage, including usage of personal devices and email systems for official duties or to conduct HHS business. Therefore, you have no reasonable expectation of privacy regarding any communication or data transiting or stored on this system. At any time, and for any lawful Government purpose, the government may monitor, intercept, and search and seize any communication or data transiting or stored on this system.
- Any communication or data transiting or stored on this system may be disclosed or used for any lawful Government purpose"

Satisfies: SRG-OS-000023-GPOS-00006, SRG-OS-000024-GPOS-00007 , SRG-OS-000228-GPOS-00088'
	
	tag 'check': 'Verify any publicly accessible connection to the operating system displays the Standard Mandatory CMS Notice and Consent Banner before granting access to the system.

Check for the location of the banner file being used with the following command:

# grep -i banner /etc/ssh/sshd_config

banner /etc/issue

This command will return the banner keyword and the name of the file that contains the ssh banner (in this case "/etc/issue").

If the line is commented out, this is a finding.

View the file specified by the banner keyword to check that it matches the text of the Standard Mandatory CMS Notice and Consent Banner:

"* This warning banner provides privacy and security notices consistent with applicable federal laws, directives, and other federal guidance for accessing this Government system, which includes (1) this computer network, (2) all computers connected to this network, and (3) all devices and storage media attached to this network or to a computer on this network.
* This system is provided for Government authorized use only.
* Unauthorized or improper use of this system is prohibited and may result in disciplinary action and/or civil and criminal penalties.
* Personal use of social media and networking sites on this system is limited as to not interfere with official work duties and is subject to monitoring.
* By using this system, you understand and consent to the following:
- The Government may monitor, record, and audit your system usage, including usage of personal devices and email systems for official duties or to conduct HHS business. Therefore, you have no reasonable expectation of privacy regarding any communication or data transiting or stored on this system. At any time, and for any lawful Government purpose, the government may monitor, intercept, and search and seize any communication or data transiting or stored on this system.
- Any communication or data transiting or stored on this system may be disclosed or used for any lawful Government purpose"

If the system does not display a graphical logon banner or the banner does not match the Standard Mandatory CMS Notice and Consent Banner, this is a finding.

If the text in the file does not match the Standard Mandatory CMS Notice and Consent Banner, this is a finding.'
	tag 'fix': 'Configure the operating system to display the Standard Mandatory CMS Notice and Consent Banner before granting access to the system via the ssh.

Edit the "/etc/ssh/sshd_config" file to uncomment the banner keyword and configure it to point to a file that will contain the logon banner (this file may be named differently or be in a different location if using a version of SSH that is provided by a third-party vendor). An example configuration line is:

banner /etc/issue

Either create the file containing the banner or replace the text in the file with the Standard Mandatory CMS Notice and Consent Banner. The CMS required text is:

"* This warning banner provides privacy and security notices consistent with applicable federal laws, directives, and other federal guidance for accessing this Government system, which includes (1) this computer network, (2) all computers connected to this network, and (3) all devices and storage media attached to this network or to a computer on this network.
* This system is provided for Government authorized use only.
* Unauthorized or improper use of this system is prohibited and may result in disciplinary action and/or civil and criminal penalties.
* Personal use of social media and networking sites on this system is limited as to not interfere with official work duties and is subject to monitoring.
* By using this system, you understand and consent to the following:
- The Government may monitor, record, and audit your system usage, including usage of personal devices and email systems for official duties or to conduct HHS business. Therefore, you have no reasonable expectation of privacy regarding any communication or data transiting or stored on this system. At any time, and for any lawful Government purpose, the government may monitor, intercept, and search and seize any communication or data transiting or stored on this system.
- Any communication or data transiting or stored on this system may be disclosed or used for any lawful Government purpose"

The SSH service must be restarted for changes to take effect.'
	end


control 'V-72237' do
	title 'All network connections associated with SSH traffic must terminate at the end of the session or after 30 minutes of inactivity, except to fulfill documented and validated mission requirements.'
	tag 'check': 'Verify the operating system automatically terminates a user session after inactivity time-outs have expired. 

Check for the value of the "ClientAliveInterval" keyword with the following command: 

# grep -iw clientaliveinterval /etc/ssh/sshd_config 

ClientAliveInterval 1800 

If "ClientAliveInterval" is not configured, commented out, or has a value of "0", this is a finding. 

If "ClientAliveInterval" has a value that is greater than "1800" and is not documented with the Information System Security Officer (ISSO) as an operational requirement, this is a finding.'
	tag 'fix': 'Configure the operating system to automatically terminate a user session after inactivity time-outs have expired or at shutdown. 

Add the following line (or modify the line to have the required value) to the "/etc/ssh/sshd_config" file (this file may be named differently or be in a different location if using a version of SSH that is provided by a third-party vendor): 

ClientAliveInterval 1800 

The SSH service must be restarted for changes to take effect.'
	end

control 'V-72253' do
	desc "Information systems are required to use FIPS 140-2 approved cryptographic hash functions. The only SSHv2 hash algorithm meeting this requirement is SHA."
	end

control 'V-73163' do
	impact 0.0
	desc 'caveat', 'Not applicable for this CMS ARS 3.1 overlay, since the related security control is not included in CMS ARS 3.1'
end
