# service-GRID
## What is service-GRID?
A REST based web service that implements an API to support implementation of the WMDA/ICCBBA Global Registry Identifier for Donors (GRID).
## What is GRID?

See this document:

[IG-038 Implementation Guide: Use of the Global Registration Identifier for Donors Data Structure 037 v1.0.0 - PDF](https://www.iccbba.org/docs/tech-library/implementation-guides/ig-038-use-of-the-global-registration-identifier-for-donors-data-structure-037.pdf)

## How to Use It

requires: Dancer2

`$ ./GRID-dance`

launches web service on port 3000


#### lookup checkdigit for GRID 2067000120704332016
`$ http://localhost:3000/ckd/2067000120704332016`

returns

`C`

--
