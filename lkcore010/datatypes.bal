// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com).

// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at

// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

// AUTO-GENERATED FILE.
// This file is auto-generated by Ballerina.

import ballerinax/health.fhir.r4;

@r4:DataTypeDefinition {
    name: "LKCoreAddress",
    baseType: (),
    elements: {
    
        "country": {
            name: "country",
            dataType: string,
            min: 0,
            max: 1,
            isArray: false,
            description: "Country - a nation as commonly understood or generally accepted.",
            path: "Address.country"
        },    
        "period": {
            name: "period",
            dataType: r4:Period,
            min: 0,
            max: 1,
            isArray: false,
            description: "Time period when address was/is in use.",
            path: "Address.period"
        },    
        "LkCoreAddressUse": {
            name: "LkCoreAddressUse",
            dataType: LkCoreAddressUse,
            min: 0,
            max: 1,
            isArray: false,
            description: "The purpose of this address.",
            path: "Address.use"
        },    
        "city": {
            name: "city",
            dataType: string,
            min: 0,
            max: 1,
            isArray: false,
            description: "The name of the city, town, suburb, village or other community or delivery center.",
            path: "Address.city"
        },    
        "line": {
            name: "line",
            dataType: string,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            description: "This component contains the house number, apartment number, street name, street direction, P.O. Box number, delivery hints, and similar address information.",
            path: "Address.line"
        },    
        "district": {
            name: "district",
            dataType: string,
            min: 0,
            max: 1,
            isArray: false,
            description: "The name of the administrative area (county).",
            path: "Address.district"
        },    
        "postalCode": {
            name: "postalCode",
            dataType: string,
            min: 0,
            max: 1,
            isArray: false,
            description: "A postal code designating a region defined by the postal service.",
            path: "Address.postalCode"
        },    
        "text": {
            name: "text",
            dataType: string,
            min: 0,
            max: 1,
            isArray: false,
            description: "Specifies the entire address as it should be displayed e.g. on a postal label. This may be provided instead of or as well as the specific parts.",
            path: "Address.text"
        },    
        "state": {
            name: "state",
            dataType: string,
            min: 0,
            max: 1,
            isArray: false,
            description: "Sub-unit of a country with limited sovereignty in a federally organized country. A code may be used if codes are in common use (e.g. US 2 letter state codes).",
            path: "Address.state"
        },    
        "LkCoreAddressType": {
            name: "LkCoreAddressType",
            dataType: LkCoreAddressType,
            min: 0,
            max: 1,
            isArray: false,
            description: "Distinguishes between physical addresses (those you can visit) and mailing addresses (e.g. PO Boxes and care-of addresses). Most addresses are both.",
            path: "Address.type"
        }        },
    serializers: {
        'xml: r4:complexDataTypeXMLSerializer,
        'json: r4:complexDataTypeJsonSerializer
    }
}
public type LkCoreAddress record {|
    *r4:Address;

    //Inherited child element from "Element" (Redefining to maintain order when serialize) (START)
    string id?;
    r4:Extension[] extension?;
    //Inherited child element from "Element" (Redefining to maintain order when serialize) (END)
    string country?;
    r4:Period period?;
    LkCoreAddressUse LkCoreAddressUse?;
    string city?;
    string[] line?;
    string district?;
    string postalCode?;
    string text?;
    string state?;
    LkCoreAddressType LkCoreAddressType?;
|};

public enum LkCoreAddressUse {
    CODE_LKCOREADDRESSUSE_TEMP = "temp",
    CODE_LKCOREADDRESSUSE_WORK = "work",
    CODE_LKCOREADDRESSUSE_OLD = "old",
    CODE_LKCOREADDRESSUSE_HOME = "home",
    CODE_LKCOREADDRESSUSE_BILLING = "billing"
};

public enum LkCoreAddressType {
    CODE_LKCOREADDRESSTYPE_POSTAL = "postal",
    CODE_LKCOREADDRESSTYPE_PHYSICAL = "physical",
    CODE_LKCOREADDRESSTYPE_BOTH = "both"
};


@r4:DataTypeDefinition {
    name: "LKCoreProvinceExt",
    baseType: (),
    elements: {
    
        "valueCodeableConcept": {
            name: "valueCodeableConcept",
            dataType: r4:CodeableConcept,
            min: 0,
            max: 1,
            isArray: false,
            description: "Value of extension - must be one of a constrained set of the data types (see [Extensibility](http://hl7.org/fhir/R4/extensibility.html) for a list).",
            path: "Extension.value[x]"
        },    
        "url": {
            name: "url",
            dataType: string,
            min: 1,
            max: 1,
            isArray: false,
            description: "Source of the definition for the extension code - a logical name or a URL.",
            path: "Extension.url"
        }        },
    serializers: {
        'xml: r4:complexDataTypeXMLSerializer,
        'json: r4:complexDataTypeJsonSerializer
    }
}
public type LkCoreProvinceExt record {|
    *r4:CodeableConceptExtension;

    //Inherited child element from "Element" (Redefining to maintain order when serialize) (START)
    string id?;
    r4:Extension[] extension?;
    //Inherited child element from "Element" (Redefining to maintain order when serialize) (END)
    r4:CodeableConcept valueCodeableConcept?;
    string url;
|};


@r4:DataTypeDefinition {
    name: "LKCoreGNAreaExt",
    baseType: (),
    elements: {
    
        "valueCodeableConcept": {
            name: "valueCodeableConcept",
            dataType: r4:CodeableConcept,
            min: 0,
            max: 1,
            isArray: false,
            description: "Value of extension - must be one of a constrained set of the data types (see [Extensibility](http://hl7.org/fhir/R4/extensibility.html) for a list).",
            path: "Extension.value[x]"
        },    
        "url": {
            name: "url",
            dataType: string,
            min: 1,
            max: 1,
            isArray: false,
            description: "Source of the definition for the extension code - a logical name or a URL.",
            path: "Extension.url"
        }        },
    serializers: {
        'xml: r4:complexDataTypeXMLSerializer,
        'json: r4:complexDataTypeJsonSerializer
    }
}
public type LkCoreGnAreaExt record {|
    *r4:CodeableConceptExtension;

    //Inherited child element from "Element" (Redefining to maintain order when serialize) (START)
    string id?;
    r4:Extension[] extension?;
    //Inherited child element from "Element" (Redefining to maintain order when serialize) (END)
    r4:CodeableConcept valueCodeableConcept?;
    string url;
|};

@r4:DataTypeDefinition {
    name: "LKCoreMOHAreaExt",
    baseType: (),
    elements: {
    
        "valueCodeableConcept": {
            name: "valueCodeableConcept",
            dataType: r4:CodeableConcept,
            min: 0,
            max: 1,
            isArray: false,
            description: "Value of extension - must be one of a constrained set of the data types (see [Extensibility](http://hl7.org/fhir/R4/extensibility.html) for a list).",
            path: "Extension.value[x]"
        },    
        "url": {
            name: "url",
            dataType: string,
            min: 1,
            max: 1,
            isArray: false,
            description: "Source of the definition for the extension code - a logical name or a URL.",
            path: "Extension.url"
        }        },
    serializers: {
        'xml: r4:complexDataTypeXMLSerializer,
        'json: r4:complexDataTypeJsonSerializer
    }
}
public type LkCoreMohAreaExt record {|
    *r4:CodeableConceptExtension;

    //Inherited child element from "Element" (Redefining to maintain order when serialize) (START)
    string id?;
    r4:Extension[] extension?;
    //Inherited child element from "Element" (Redefining to maintain order when serialize) (END)
    r4:CodeableConcept valueCodeableConcept?;
    string url;
|};


