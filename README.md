# cms-ars3.1-moderate-inspec-profile-disa_stig-el7
CMS ARS 3.1 Moderate Overlay InSpec Validation Profile for RHEL7 STIG

Based on the InSpec Profile baseline maintained by the [SIMP](https://github.com/simp/) Project

# Description

This [InSpec](https://github.com/chef/inspec) compliance profile implements the [Red Hat Enterprise Linux 7 STIG Version 1, Release 4](https://iasecontent.disa.mil/stigs/zip/U_Red_Hat_Enterprise_Linux_7_V1R4_STIG.zip), tailored as an overlay, meaning it is aligned to the relevant security controls and settings (attributes) specific to a CMS ARS 3.1 Moderate instance of RHEL7. It is dependent on a fork of the SIMP version of the base STIG profile.

## Requirements

- [InSpec](http://inspec.io/) at least version 2.1

## Get started

### Installing InSpec 

If needed - install inspec on your 'runner' system - i.e. your orchestration server, your workstation, your bastion host or your instance you wish to evlauate.

  a. InSpec has prepackaged installers for all platforms here: https://www.inspec.io/downloads, or 
  
  b. If you already have a ruby environment (`2.4.x`) installed on your 'runner' system - you can just do a simple `gem install inspec`, or 
  
  c. If running in AWS, you can use the AWS SSM suite to run InSpec on your RHEL assets - see the InSpec + SSM documation here: https://aws.amazon.com/blogs/mt/using-aws-systems-manager-to-run-compliance-scans-using-inspec-by-chef/
  
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

# To run profile locally with cli & json output 
$ inspec exec /path/to/profile --attrs=attributes.yml --reporter cli json:rhel-results.json
```
For more usage options, see https://github.com/chef/inspec/blob/master/README.md 

### Run individual controls

In order to verify individual controls, just provide the control ids to InSpec:

```
$ inspec exec /path/to/profile --attrs=attributes.yml --reporter cli json:rhel-results.json  --controls V-72299
```

### Long Running Controls

There are a few long running controls that take anywhere from 3 minutes to 10 minutes 
or more to run. In an ongoing or CI/CD pipelne this is not ideal. We have created an 
attribute in the profile to allow you to 'skip' these controls to account for situations.

The attrubute `DISABLE_SLOW_CONTROLS (bool: false)` can be set to `true` or `false` as needed in 
the `attributes.yml` file.

* `V-71849` (~3 minutes)
* `V-71855` (~3 minutes)
* `V-72037` (10+ minutes)

## Contributors + Kudos

- SIMP team for maintaining the baseline profile [SIMP](https://github.com/simp/) 
- Aaron Lippold [aaronlippold](https://github.com/aaronlippold)
- Danny Haynes [djhaynes](https://github.com/djhaynes)
- Eugene Aronne [ejaronne](https://github.com/ejaronne)

### License 

* This project is dual-licensed under the terms of the Apache license 2.0 (apache-2.0)
