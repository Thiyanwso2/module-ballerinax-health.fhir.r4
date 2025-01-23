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

import ballerina/constraint;
import ballerinax/health.fhir.r4;

public const string PROFILE_BASE_USCOREDIAGNOSTICREPORTPROFILENOTEEXCHANGE = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-note";
public const RESOURCE_NAME_USCOREDIAGNOSTICREPORTPROFILENOTEEXCHANGE = "DiagnosticReport";

# FHIR USCoreDiagnosticReportProfileNoteExchange resource record.
#
# + resourceType - The type of the resource describes
# + extension - May be used to represent additional information that is not part of the basic definition of the resource. To make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer can define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension.
# + code - The test, panel, report, or note that was ordered.
# + subject - The subject of the report. Usually, but not always, this is a patient. However, diagnostic services also perform analyses on specimens collected from a variety of other sources.
# + modifierExtension - May be used to represent additional information that is not part of the basic definition of the resource and that modifies the understanding of the element that contains it and/or the understanding of the containing element's descendants. Usually modifier elements provide negation or qualification. To make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension. Applications processing a resource are required to check for modifier extensions. Modifier extensions SHALL NOT change the meaning of any elements on Resource or DomainResource (including cannot change the meaning of modifierExtension itself).
# + presentedForm - Rich text representation of the entire result as issued by the diagnostic service. Multiple formats are allowed but they SHALL be semantically equivalent.
# + language - The base language in which the resource is written.
# + media - A list of key images associated with this report. The images are generally created during the diagnostic process, and may be directly of the patient, or of treated specimens (i.e. slides of interest).
# + conclusion - Concise and clinically contextualized summary conclusion (interpretation/impression) of the diagnostic report.
# + result - [Observations](http://hl7.org/fhir/R4/observation.html) that are part of this diagnostic report.
# + specimen - Details about the specimens on which this diagnostic report is based.
# + id - The logical id of the resource, as used in the URL for the resource. Once assigned, this value never changes.
# + text - A human-readable narrative that contains a summary of the resource and can be used to represent the content of the resource to a human. The narrative need not encode all the structured data, but is required to contain sufficient detail to make it 'clinically safe' for a human to just read the narrative. Resource definitions may define what content should be represented in the narrative to ensure clinical safety.
# + issued - The date and time that this version of the report was made available to providers, typically after the report was reviewed and verified.
# + basedOn - Details concerning a service requested.
# + identifier - Identifiers assigned to this report by the performer or other systems.
# + performer - The diagnostic service that is responsible for issuing the report.
# + effectivePeriod - The time or time-period the observed values are related to. When the subject of the report is a patient, this is usually either the time of the procedure or of specimen collection(s), but very often the source of the date/time is not known, only the date/time itself.
# + resultsInterpreter - The practitioner or organization that is responsible for the report's conclusions and interpretations.
# + conclusionCode - One or more codes that represent the summary conclusion (interpretation/impression) of the diagnostic report.
# + encounter - The healthcare event (e.g. a patient and healthcare provider interaction) which this DiagnosticReport is about.
# + contained - These resources do not have an independent existence apart from the resource that contains them - they cannot be identified independently, and nor can they have their own independent transaction scope.
# + effectiveDateTime - The time or time-period the observed values are related to. When the subject of the report is a patient, this is usually either the time of the procedure or of specimen collection(s), but very often the source of the date/time is not known, only the date/time itself.
# + meta - The metadata about the resource. This is content that is maintained by the infrastructure. Changes to the content might not always be associated with version changes to the resource.
# + implicitRules - A reference to a set of rules that were followed when the resource was constructed, and which must be understood when processing the content. Often, this is a reference to an implementation guide that defines the special rules along with other profiles etc.
# + category - A code that classifies the clinical discipline, department or diagnostic service that created the report (e.g. cardiology, biochemistry, hematology, MRI). This is used for searching, sorting and display purposes.
# * category Slicings
# 1) USCoreDiagnosticReportProfileNoteExchangeCategoryUs_core: (USCDI) Service category
#       - min = 0
#       - max = *
#
# + imagingStudy - One or more links to full details of any imaging performed during the diagnostic investigation. Typically, this is imaging performed by DICOM enabled modalities, but this is not required. A fully enabled PACS viewer can use this information to provide views of the source images.
# + status - The status of the diagnostic report.
@r4:ResourceDefinition {
    resourceType: "DiagnosticReport",
    baseType: r4:DomainResource,
    profile: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-note",
    elements: {
        "extension" : {
            name: "extension",
            dataType: r4:Extension,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.extension"
        },
        "code" : {
            name: "code",
            dataType: r4:CodeableConcept,
            min: 1,
            max: 1,
            isArray: false,
            path: "DiagnosticReport.code",
            valueSet: "http://hl7.org/fhir/us/core/ValueSet/us-core-diagnosticreport-report-and-note-codes"
        },
        "subject" : {
            name: "subject",
            dataType: r4:Reference,
            min: 1,
            max: 1,
            isArray: false,
            path: "DiagnosticReport.subject"
        },
        "modifierExtension" : {
            name: "modifierExtension",
            dataType: r4:Extension,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.modifierExtension"
        },
        "presentedForm" : {
            name: "presentedForm",
            dataType: r4:Attachment,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.presentedForm"
        },
        "language" : {
            name: "language",
            dataType: r4:code,
            min: 0,
            max: 1,
            isArray: false,
            path: "DiagnosticReport.language",
            valueSet: "http://hl7.org/fhir/ValueSet/languages"
        },
        "media" : {
            name: "media",
            dataType: USCoreDiagnosticReportProfileNoteExchangeMedia,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.media"
        },
        "conclusion" : {
            name: "conclusion",
            dataType: string,
            min: 0,
            max: 1,
            isArray: false,
            path: "DiagnosticReport.conclusion"
        },
        "result" : {
            name: "result",
            dataType: r4:Reference,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.result"
        },
        "specimen" : {
            name: "specimen",
            dataType: r4:Reference,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.specimen"
        },
        "id" : {
            name: "id",
            dataType: string,
            min: 0,
            max: 1,
            isArray: false,
            path: "DiagnosticReport.id"
        },
        "text" : {
            name: "text",
            dataType: r4:Narrative,
            min: 0,
            max: 1,
            isArray: false,
            path: "DiagnosticReport.text"
        },
        "issued" : {
            name: "issued",
            dataType: r4:instant,
            min: 0,
            max: 1,
            isArray: false,
            path: "DiagnosticReport.issued"
        },
        "basedOn" : {
            name: "basedOn",
            dataType: r4:Reference,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.basedOn"
        },
        "identifier" : {
            name: "identifier",
            dataType: r4:Identifier,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.identifier"
        },
        "performer" : {
            name: "performer",
            dataType: r4:Reference,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.performer"
        },
        "effectivePeriod" : {
            name: "effectivePeriod",
            dataType: r4:Period,
            min: 0,
            max: 1,
            isArray: false,
            path: "DiagnosticReport.effective[x]"
        },
        "resultsInterpreter" : {
            name: "resultsInterpreter",
            dataType: r4:Reference,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.resultsInterpreter"
        },
        "conclusionCode" : {
            name: "conclusionCode",
            dataType: r4:CodeableConcept,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.conclusionCode",
            valueSet: "http://hl7.org/fhir/ValueSet/clinical-findings"
        },
        "encounter" : {
            name: "encounter",
            dataType: r4:Reference,
            min: 0,
            max: 1,
            isArray: false,
            path: "DiagnosticReport.encounter"
        },
        "contained" : {
            name: "contained",
            dataType: r4:Resource,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.contained"
        },
        "effectiveDateTime" : {
            name: "effectiveDateTime",
            dataType: r4:dateTime,
            min: 0,
            max: 1,
            isArray: false,
            path: "DiagnosticReport.effective[x]"
        },
        "meta" : {
            name: "meta",
            dataType: r4:Meta,
            min: 0,
            max: 1,
            isArray: false,
            path: "DiagnosticReport.meta"
        },
        "implicitRules" : {
            name: "implicitRules",
            dataType: r4:uri,
            min: 0,
            max: 1,
            isArray: false,
            path: "DiagnosticReport.implicitRules"
        },
        "category" : {
            name: "category",
            dataType: r4:CodeableConcept,
            min: 1,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.category",
            valueSet: "http://hl7.org/fhir/ValueSet/diagnostic-service-sections"
        },
        "imagingStudy" : {
            name: "imagingStudy",
            dataType: r4:Reference,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            path: "DiagnosticReport.imagingStudy"
        },
        "status" : {
            name: "status",
            dataType: USCoreDiagnosticReportProfileNoteExchangeStatus,
            min: 1,
            max: 1,
            isArray: false,
            path: "DiagnosticReport.status",
            valueSet: "http://hl7.org/fhir/ValueSet/diagnostic-report-status"
        }
    },
    serializers: {
        'xml: r4:fhirResourceXMLSerializer,
        'json: r4:fhirResourceJsonSerializer
    }
}
public type USCoreDiagnosticReportProfileNoteExchange record {|
    *r4:DomainResource;

    RESOURCE_NAME_USCOREDIAGNOSTICREPORTPROFILENOTEEXCHANGE resourceType = RESOURCE_NAME_USCOREDIAGNOSTICREPORTPROFILENOTEEXCHANGE;

    r4:Extension[] extension?;
    r4:CodeableConcept code;
    r4:Reference subject;
    r4:Extension[] modifierExtension?;
    r4:Attachment[] presentedForm?;
    r4:code language?;
    USCoreDiagnosticReportProfileNoteExchangeMedia[] media?;
    string conclusion?;
    r4:Reference[] result?;
    r4:Reference[] specimen?;
    string id?;
    r4:Narrative text?;
    r4:instant issued?;
    r4:Reference[] basedOn?;
    r4:Identifier[] identifier?;
    r4:Reference[] performer?;
    r4:Period effectivePeriod?;
    r4:Reference[] resultsInterpreter?;
    r4:CodeableConcept[] conclusionCode?;
    r4:Reference encounter?;
    r4:Resource[] contained?;
    r4:dateTime effectiveDateTime?;
    r4:Meta meta?;
    r4:uri implicitRules?;
    @constraint:Array {
        minLength: {
            value: 1,
            message: "Validation failed for $.DiagnosticReport.category constraint. This field must be an array containing at least one item."
        },
        maxLength: {
            value: 1,
            message: "Validation failed for $.DiagnosticReport.category constraint. This field must be an array containing at most one item."
        }
    }
    r4:CodeableConcept[] category;
    r4:Reference[] imagingStudy?;
    USCoreDiagnosticReportProfileNoteExchangeStatus status;
    r4:Element ...;
|};

# USCoreDiagnosticReportProfileNoteExchangeStatus enum
public enum USCoreDiagnosticReportProfileNoteExchangeStatus {
   CODE_STATUS_FINAL = "final",
   CODE_STATUS_PRELIMINARY = "preliminary",
   CODE_STATUS_PARTIAL = "partial"
}

# FHIR USCoreDiagnosticReportProfileNoteExchangeMedia datatype record.
#
# + extension - May be used to represent additional information that is not part of the basic definition of the element. To make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer can define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension.
# + modifierExtension - May be used to represent additional information that is not part of the basic definition of the element and that modifies the understanding of the element in which it is contained and/or the understanding of the containing element's descendants. Usually modifier elements provide negation or qualification. To make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer can define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension. Applications processing a resource are required to check for modifier extensions. Modifier extensions SHALL NOT change the meaning of any elements on Resource or DomainResource (including cannot change the meaning of modifierExtension itself).
# + link - Reference to the image source.
# + comment - A comment about the image. Typically, this is used to provide an explanation for why the image is included, or to draw the viewer's attention to important features.
# + id - Unique id for the element within a resource (for internal references). This may be any string value that does not contain spaces.
@r4:DataTypeDefinition {
    name: "USCoreDiagnosticReportProfileNoteExchangeMedia",
    baseType: (),
    elements: {
        "extension": {
            name: "extension",
            dataType: r4:Extension,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            description: "May be used to represent additional information that is not part of the basic definition of the element. To make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer can define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension.",
            path: "DiagnosticReport.media.extension"
        },
        "modifierExtension": {
            name: "modifierExtension",
            dataType: r4:Extension,
            min: 0,
            max: int:MAX_VALUE,
            isArray: true,
            description: "May be used to represent additional information that is not part of the basic definition of the element and that modifies the understanding of the element in which it is contained and/or the understanding of the containing element's descendants. Usually modifier elements provide negation or qualification. To make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer can define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension. Applications processing a resource are required to check for modifier extensions. Modifier extensions SHALL NOT change the meaning of any elements on Resource or DomainResource (including cannot change the meaning of modifierExtension itself).",
            path: "DiagnosticReport.media.modifierExtension"
        },
        "link": {
            name: "link",
            dataType: r4:Reference,
            min: 1,
            max: 1,
            isArray: false,
            description: "Reference to the image source.",
            path: "DiagnosticReport.media.link"
        },
        "comment": {
            name: "comment",
            dataType: string,
            min: 0,
            max: 1,
            isArray: false,
            description: "A comment about the image. Typically, this is used to provide an explanation for why the image is included, or to draw the viewer's attention to important features.",
            path: "DiagnosticReport.media.comment"
        },
        "id": {
            name: "id",
            dataType: string,
            min: 0,
            max: 1,
            isArray: false,
            description: "Unique id for the element within a resource (for internal references). This may be any string value that does not contain spaces.",
            path: "DiagnosticReport.media.id"
        }
    },
    serializers: {
        'xml: r4:complexDataTypeXMLSerializer,
        'json: r4:complexDataTypeJsonSerializer
    }
}
public type USCoreDiagnosticReportProfileNoteExchangeMedia record {|
    *r4:BackboneElement;

    r4:Extension[] extension?;
    r4:Extension[] modifierExtension?;
    r4:Reference link;
    string comment?;
    string id?;
|};

# FHIR USCoreDiagnosticReportProfileNoteExchangeCategoryUs_core datatype record.
#
@r4:DataTypeDefinition {
    name: "USCoreDiagnosticReportProfileNoteExchangeCategoryUs_core",
    baseType: (),
    elements: {
    },
    serializers: {
        'xml: r4:complexDataTypeXMLSerializer,
        'json: r4:complexDataTypeJsonSerializer
    }
}
public type USCoreDiagnosticReportProfileNoteExchangeCategoryUs_core record {|
    *r4:CodeableConcept;

|};

