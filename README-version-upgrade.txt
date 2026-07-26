Changes to apply when changing version:

- VERSION.txt: validate version number
- CHANGELOG
- README.asciidoc: for GitHub, replace arcv AND arcv-test versions e.g.
    'arcv-test_1.0-0' => 'arcv-test_1.0-1'
    'arcv_1.0-0' => 'arcv_1.0-1'
- install_arcv-test.sh: update version numbers assigned to vars
- 'make man' to update manpage
- pack/debian/control : update dependency version
- online doc: ensure developertoolsforlinux/pages/_topics/arcv/arcv_version.adoc is up-to-date