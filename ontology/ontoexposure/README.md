# OntoExposure

OntoExposure is an ontology for representing the information required to
calculate and interpret environmental exposure measures. It describes the
subject of an exposure assessment, the environmental dataset, the calculation
method and parameters, and the resulting exposure value.

The ontology is used by the
[exposure-calculation-agent](https://github.com/TheWorldAvatar/exposure-calculation-agent).

## Namespace

| Item | Value |
| --- | --- |
| Ontology IRI | `https://www.theworldavatar.com/kg/ontoexposure/` |
| Preferred prefix | `exp` |

Example prefix declaration:

```turtle
@prefix exp: <https://www.theworldavatar.com/kg/ontoexposure/> .
```

## Core model

The principal classes are:

- `exp:Subject`: the person, place, trajectory, or other spatial entity for
  which an exposure is calculated. It is a subclass of
  `geo:Geometry` from GeoSPARQL.
- `exp:ExposureDataset`: the dataset from which an exposure measure is
  derived. It is a subclass of `dcat:Dataset`.
- `exp:Calculation`: the method and parameters used to calculate an exposure.
- `exp:ExposureResult`: the value produced by an exposure calculation.

Calculation subclasses describe operations for different spatial data and
exposure definitions. Examples include `exp:RasterAverage`, `exp:RasterSum`,
`exp:RasterArea`, `exp:Count`, `exp:TotalLength`, and
`exp:ClosestDistance`. Column-based calculations are grouped under
`exp:ColumnBasedCalculation`.

The ontology also supports:

- buffer distances through `exp:hasDistance`
- dataset filtering through `exp:DatasetFilter`, `exp:hasFilterColumn`, and
  `exp:hasFilterValue`
- result values, units, and percentiles through `exp:hasValue`, `exp:hasUnit`,
  and `exp:hasPercentile`

## Generation

`OntoExposure.csv` is the input to the
[TBoxGenerator](https://github.com/TheWorldAvatar/baselib/tree/main/src/main/java/uk/ac/cam/cares/jps/base/converter),
which generates `OntoExposure.owl`.
