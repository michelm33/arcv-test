
Changes to apply when changing version:

- VERSION.txt: validate version number

- CHANGELOG

- Define shell api dependency
  * To use latest version, type in current terminal before releae creation:
      unset SHELLAPI_VERSION    # to be sure var is not defined
      <generate a release of shellapi> 
  * To use a version of shellapi different of the current one e.g. v1.1.2 (change to the actual version number):
      <Create a symlink of shell-api to the release folder of the version>
      update update_vernum_in_files.sh and set       
        SHELLAPI_VERSION=1.1-4 # example

- Define SHOTPLAN dependency
  * To use latest version, type in current terminal before releae creation:
      unset SHOTPLAN_VERSION    # to be sure var is not defined
      <generate a release of shellapi> 
  * To use a version of shellapi different of the current one e.g. v1.1.2 (change to the actual version number):
      update update_vernum_in_files.sh and set 
        SHOTPLAN_VERSION=1.1-1 # example

- Generate a release :
    make release

  The following updates are done automatically:
  * man page (man make target)
  * via "update_vernum_in_files":
    [x] install_arcv-test.sh: updated version numbers incl. dependencies
    [x] pack/debian/control : update dependency version
    [x] arcv_version.adoc in "developertoolsforlinux/pages/_topics/arcv/" of website
    [x] README.asciidoc replacing arcv AND arcv-test versions e.g.
    'arcv-test_1.0-0' => 'arcv-test_1.0-1'
    'shotplan_1.0-0' => 'shotplan_1.0-1
  * updates download page (web_download make target)
  NOTE: since some files may be updated:
    av -y
    make release

- Update the install program inside the container for installing the correct versions:
    arcv-test --CU

- Run all tests

- Tag the release once the release has been successfully tested:
    av pub

- Export the release to GitHub, for example (change to the actual version number):
    av export ../release/arcv-test/arcv-test-1.2-0

- Create the tag and related release in GitHub

