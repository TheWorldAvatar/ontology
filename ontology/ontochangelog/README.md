# 1. Ontology for Changelogs

OntoChangelog is designed to provide a clear history of every change, acting as a digital paper trail that records who made a change, when it occurred, and a description of the action. This document serves to explain the modelling decisions and provide example usage of the ontology alongside the external ontologies.

The namespace for the ontology is:

<p align="center"><i>https://theworldavatar.io/kg/ontochangelog/</i></p>

## Table of Contents

- [1. Ontology for Changelogs](#1-ontology-for-changelogs)
- [2. Data Model](#2-data-model)
  - [Legend](#legend)
  - [2.1 Activity](#21-activity)

# 2. Data Model

## Legend

> Ontology Diagram

The representation of a class and instance is denoted by the node's shape. This means that an instance of the `Person` class will share the same label as the `Person` class itself, and they can only be distinguished by their shape. Literals are represented within the node of the class or instances. The label of instance nodes represent either a label for the purpose of explaining the diagram or the class it is `rdf:type` of (it is a class label if a prefix is available). Instance with labels will also be link to their respective class eg `prefix:Class` to clarify the instance. Multiple instance nodes for the same class in one diagram describes distinct instances of the class that is typically linked by different relations and instances.

```mermaid
flowchart TD
    instance[[Instance Label]]
    clazz[prefix:Class]
    clazzLiteral["<h4>prefix:Class</h4><p style='font-size:0.75rem;'>data property &quot;literal type&quot;</p>"]:::literal
```

```mermaid
flowchart TD
    %% Styling
    classDef literal fill:none

    %% Diagram
    subgraph equivalent instance with data property representation
    direction LR
    instanceDataProperty[["<h4>prefix:Class with data property</h4><p style='font-size:0.75rem;'>data property &quot;literal type&quot;</p>"]]:::literal
    instDataProperty[[Instance of Class Label]] -. rdf:type .-> instClazzLiteral["<h4>prefix:Class</h4><p style='font-size:0.75rem;'>data property &quot;literal type&quot;</p>"]:::literal
    end

    subgraph equivalent instance representation
    direction LR
    instClass[[prefix:Class]]
    instClassInst[[Instance of Class Label]] -. rdf:type .-> parentClass[prefix:Class]
    end
```

Relations between instances of one or more classes are indicated as dotted lines.

```mermaid
flowchart LR
    Inst[[Instance]] -. relation .-> rangeInst[[Instance]]
```

Relations linked to a class will also be applied to their instances.

```mermaid
flowchart LR
    subgraph equivalent relations for object properties
    direction LR
    multiinstance[[multiple class instance]] -.->  clazz2[prefix:Class]
    multiinstance -. relations .-> objInst2[[Object Instance]]

    instance[[multiple class instance]] -.->  clazz[prefix:Class]
    clazz -. relations .-> objInst[[Object Instance]]
    end
```

Unlabelled arrows references `rdfs:subClassOf` and `rdf:type` for solid and dotted lines respectively.

```mermaid
flowchart TB
    subgraph equivalent rdftype
    direction LR
    instance[[Instance]] -.-> clazz[prefix:Class]
    instance2[[Instance]] -. rdf:type .-> clazz2[prefix:Class]
    end

    subgraph equivalent subclassof for classes
    direction LR
    subclass[prefix:SubClass] --> superclass[prefix:SuperClass]
    subclass2[prefix:SubClass] -. rdfs:subClassOf .-> superclass2[prefix:SuperClass]
    end
```

```mermaid
flowchart LR
    subgraph equivalent subclassof for instances
    direction LR
    instanceSubClass[[prefix:SubClass]] ---> superclass1[prefix:SuperClass]
    inst[[Instance]] -.-> subClazz[prefix:SubClass]
    subClazz --> superclass2[prefix:SuperClass]
    end
```

> Namespace Prefix

| Prefix            | Namespace                                                                                        |
| ----------------- | ------------------------------------------------------------------------------------------------ |
| dc-term           | `http://purl.org/dc/terms/`                                                                      |
| foaf              | `http://xmlns.com/foaf/0.1/`                                                                     |
| rdfs              | `http://www.w3.org/2000/01/rdf-schema#`                                                          |
| ontochangelog     | `https://theworldavatar.io/kg/ontochangelog/`                                                    |

## 2.1. Activity

The basis of this ontology revolves around the `Activity` concept, which describes the action and when the action took place. The ontology also defines the individual or automated system responsible for triggering the activity through the `foaf:Agent` concept. To enable flexibility in recording these actions, the activity can be associated with any instance.

Figure 1: TBox representation for an Activity

```mermaid
flowchart TD
    %% Styling
    classDef literal fill:none
    classDef node overflow-wrap:break-word,text-wrap:pretty
    linkStyle default overflow-wrap:break-word,text-wrap:pretty;

    %% Contents
    Activity[["<h4>ontochangelog:Activity</h4><p style='font-size:0.75rem;'>dc-term:description &quot;string&quot;<br>ontochangelog:timestamp &quot;xsd:dateTime&quot;</p>"]]:::literal -. ontochangelog:affected .-> Any[[anyConcept]]
    Activity -. ontochangelog:wasPerformedBy .-> Agent[["<h4>foaf:Agent</h4><p style='font-size:0.75rem;'>rdfs:label &quot;string&quot;<br>dc-term:identifier &quot;id string&quot;</p>"]]:::literal
```
