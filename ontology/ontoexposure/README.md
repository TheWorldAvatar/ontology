# OntoExposure

This ontology is primarily used by <https://github.com/TheWorldAvatar/exposure-calculation-agent>.

## Note

The `exposure:ExposureResult` class should ideally inherit from a class in the ontology of units of measure, e.g. `om:Quantity`, rather than using `exposure:hasUnit` and `exposure:hasValue`.