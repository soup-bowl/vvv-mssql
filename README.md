# Microsoft SQL PHP Extension for Varying Vagrant Vagrants

Additional provision for [VVV][vvv] that allows for the installation of the 
Microsoft SQL adapter for PHP, and the underlying dependencies. 

This is currently EXPERIMENTAL, and is not yet finished. Additional steps may
be required to get this fully working.

To use this provision, add the following to your `vvv-custom.yaml`:

```yaml
utilities:
  mssql:
    - mssql
utility-sources:
  mssql: https://gitlab.com/soup-bowl/vvv-mssql.git
```

Add this to your existing utilities section (there should already be one, if you
duplicated the main configuration).

[vvv]: https://varyingvagrantvagrants.org/