# cms-ars3.1-moderate-inspec-profile-disa_stig-el7
CMS ARS 3.1 Moderate Overlay InSpec Validation Profile for RHEL7 STIG

Based on the InSpec Profile baseline maintained by the [SIMP](https://github.com/simp/) Project

# Description

This [InSpec](https://github.com/chef/inspec) compliance profile implements the [Red Hat Enterprise Linux 7 STIG Version 1, Release 4] (https://iasecontent.disa.mil/stigs/zip/U_Red_Hat_Enterprise_Linux_7_V1R4_STIG.zip), tailored as an overlay, meaning it is aligned to the relevant security controls and settings (attributes) specific to a CMS ARS 3.1 Moderate instance of RHEL7. It is dependent on a fork of the SIMP version of the base STIG profile.

## Requirements

- [InSpec](http://inspec.io/) at least version 2.1
- [AWS CLI](https://aws.amazon.com/cli/) at least version 2.x

## Get started

### Installing InSpec 

If needed - install inspec on your 'runner' system - i.e. your orchestration server, your workstation, your bastion host or your instance you wish to evlauate.

  a. InSpec has prepackaged installers for all platforms here: https://www.inspec.io/downloads, or 
  
  b. If you already have a ruby environment (`2.4.x`) installed on your 'runner' system - you can just do a simple `gem install inspec`, or 
  
  c. You can use the AWS SSM suite to run InSpec on your AWS assets - see the InSpec + SSM documation here: https://aws.amazon.com/blogs/mt/using-aws-systems-manager-to-run-compliance-scans-using-inspec-by-chef/
  
### Get the CMS ARS 3.1 Moderate Overlay InSpec Validation Profile for RHEL7 STIG

You will need to download the InSpec Profile to your `runner` system. You can do this via `git` or the GitHub Web interface, etc.

  a. `git clone https://github.cms.gov/ispg-review/cms-ars3.1-moderate-inspec-profile-disa_stig-el7`, or 
  
  b. Save a Zip or tar.gz copy of the master branch from the `Clone or Download` button of this project

### Setting up dependencies in your Ruby and InSpec Environments

The profile uses Bundler to manage needed dependencies - so you will need to installed the needed gems via bundler before you run the profile. Change directories to your your cloned inspec profile then do a `bundle install`. 

  a. `cd cms-ars3.1-moderate-inspec-profile-disa_stig-el7` 
  
  b. `bundle install`

## Usage

InSpec makes it easy to run your tests wherever you need. More options listed here: [InSpec cli](http://inspec.io/docs/reference/cli/)

```
# Clone Inspec Profile
$ git clone https://github.cms.gov/ispg-review/cms-ars3.1-moderate-inspec-profile-disa_stig-el7

# Install Gems
$ bundle install

# To run profile locally and directly from Github
$ inspec exec /path/to/profile -t aws:// --attrs=attributes.yml

# To run profile locally and directly from Github with cli & json output 
$ inspec exec /path/to/profile -t aws:// --attrs=attributes.yml --reporter cli json:rhel-results.json

```

### Run individual controls

In order to verify individual controls, just provide the control ids to InSpec:

```
$ inspec exec /path/to/profile --attrs=attributes.yml --controls V-72299
```

### Long Running Controls

There are a few long running controls that take anywhere from 3 minutes to 10 minutes 
or more to run. In an ongoing or CI/CD pipelne this is not ideal. We have created an 
attribute in the profile to allow you to 'skip' these controls to account for situations.

The attrubute `DISABLE_SLOW_CONTROLS (bool: false)` can be set to `true` or `false` as needed in 
the `attributes.yml` file or set in the `.kitchen.yml` file.

* `V-71849` (~3 minutes)
* `V-71855` (~3 minutes)
* `V-72037` (10+ minutes)

## Contributors + Kudos

- Aaron Lippold [aaronlippold](https://github.com/aaronlippold)

## License and Author

### Authors

- Author:: Aaron Lippold [lippold@gmail.com](mailto:lippold@gmail.com)

### License 

* This project is dual-licensed under the terms of the Apache license 2.0 (apache-2.0)

This repository uses either [Beaker](https://github.com/puppetlabs/beaker) to
run tests or the [KitchenCI](http://kitchen.ci) framework to run tests on the
various profiles. Please see the documentation below on how to use each of the
frameworks.

# Testing with Beaker

To run the tests, perform the following actions:

1. Have Ruby 2.3.0 or later installed
2. Run ``bundle install``
3. Run ``rake beaker:suites``

### Debugging

If you need to debug your systems, you can run Beaker with a couple of options:

1. Preserve the VM unconditionally
   * ``BEAKER_destroy=no rake beaker:suites``

2. Preserve the VM unless the tests pass
   * ``BEAKER_destroy=onpass rake beaker:suites``

You can then access the VM by going to the root level of the repository and
navigating to `.vagrant/beaker_vagrant_files/<automatic directory>`.

You should find a `Vagrantfile` at that location and can use any standard
[Vagrant CLI Commands](https://www.vagrantup.com/docs/cli/).

The most useful of these will be ``vagrant status`` and ``vagrant ssh <vm name>``.

## Test Layout

The tests are housed under the ``spec/acceptance`` directory and use the
profiles in ``spec/fixtures/inspec_profiles`` during testing.

# Testing with Kitchen

## Dependencies

* Ruby 2.3.0 or later
* [Virtualbox](https://www.virtualbox.org)
* [Vagrant](https://www.vagrantup.com)

#### _Notes to Windows Users_

1. An installation of ChefDK may generate conflicts when combined with the
   installed kitchen gems. **Recommend NOT installing ChefDK before testing
   with this repo.**

2. If you run into errors when running ``bundle install``, use the following
   commands to install gems:
  * ``gem install kitchen-puppet``
  * ``gem install librarian-puppet``
  * ``gem install kitchen-vagrant``

3. If the tests are not found when running ``kitchen verify``, open
   ``.kitchen.yml`` and consult ``inspec_tests`` under the ``suites`` section.

4. You may also experience an error when running ``kitchen converge`` where a
   folder is unable to be created due to the length of the path. In this case,
   you may need to edit a registry key as explained
   [here](https://www.howtogeek.com/266621/how-to-make-windows-10-accept-file-paths-over-260-characters/).

## Setting up your box

1. Clone the repo via `git clone -b dev https://github.com/simp/inspec_profiles.git`
2. cd to `inspec_profiles`
3. Run ``bundle install``
4. Run `kitchen list` - you should see the following choice:
   * `default-centos-7`
5. Run `kitchen converge default-centos-7`
6. Run `kitchen list` - your should see your host with status "converged"

## Validating your box

**Note:** Once the open issues are resolved in InSpec and kitchen-inspec these
steps will not really be needed but for now we have to do a few things a bit
more manually. Once resolved fully, you will only need to run `kitchen verify
(machine name)` and everything will be taken care of.

### In the 'inspec_profiles' dir ( manually )

1. cd `.kitchen/`
2. vi default-centos-7.yml
3. copy the `ssh_key:` value for later
4. note the mapped port value ( usually `2222`) and use in the next steps

### In the 'inspec_profiles' dir

1. On the terminal: `export SSH_KEY=(value from before)`
2. cd to `inspec_profiles`
   * (optional) run an `inspec check`, and
   ensure there are no errors in the baseline.

3. run: `inspec exec -i $SSH_KEY -t
   ssh://vagrant@127.0.0.1:2222 ( or the port mapped from step '4' above )`
   * (optional) `inspec exec controls/V-#####
   * -i $SSH_KEY -t
   ssh://vagrant@127.0.0.1:2222` to just test a single control
   * (optional) `inspec exec -i $SSH_KEY
   --controls=V-#####,V-##### -t ssh://vagrant@127.0.0.1:2222` to just test a
   small set of controls
   
### Long Running Controls

There are a few long running controls that take anywhere from 3 minutes to 10 minutes 
or more to run. In an ongoing or CI/CD pipelne this is not ideal. We have created an 
attribute in the profile to allow you to 'skip' these controls to account for situations.

The attrubute `DISABLE_SLOW_CONTROLS (bool: false)` can be set to `true` or `false` as needed in 
the `attributes.yml` file or set in the `.kitchen.yml` file.

* `V-71849` (~3 minutes)
* `V-71855` (~3 minutes)
* `V-72037` (10+ minutes)
