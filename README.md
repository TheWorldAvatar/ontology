# The World Avatar Ontology library

This repository contains ontological concepts for TWA projects

## Contribution

Changes made to an ontology on the default branch (`main`) must be made via a Pull Request. Contributors must ensure that version numbers are incremented within the relevant OWL file i.e.

```xml
<rdf:RDF [...]>
    <owl:Ontology rdf:about="http://[...].owl">
        <owl:versionInfo>M.m.r</owl:versionInfo>
```

where `M.m.r` follows the semantic versioning pattern in the usual way.

> [!TIP]
> If the OWL file is generated from a CSV file using the TBoxGenerator, then the above element will be automatically populated from a line in the CSV that annotates the TBox with the relation `http://www.w3.org/2002/07/owl#versionInfo`.

This must be verified by the reviewer of the Pull Request. This is not enforced for individual ontologies via any action but is present as a manual check in the PR template.
