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
import ballerina/log;

const FHIR_IG = "uscore610";

# Initializer for the module
# + return - returns error if error occurred
function init() returns r4:FHIRError? {
    // Anything to initialize should happen here here

    //update terminology processor
    // TODO: https://github.com/wso2-enterprise/open-healthcare/issues/1047
    r4:InMemoryTerminologyLoader terminologyLoader = new(FHIR_CODE_SYSTEMS, FHIR_VALUE_SETS);
    r4:Terminology terminology = check terminologyLoader.load();

    readonly & r4:IGInfoRecord baseIgRecord = {
        title: "uscore610",
        name: "uscore610",
        terminology: terminology,
        profiles: {
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-problems-health-concerns": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-problems-health-concerns",
                resourceType: "Condition",
                modelType: USCoreConditionProblemsHealthConcernsProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference",
                resourceType: "DocumentReference",
                modelType: USCoreDocumentReferenceProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-note": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-note",
                resourceType: "DiagnosticReport",
                modelType: USCoreDiagnosticReportProfileNoteExchange
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-blood-pressure": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-blood-pressure",
                resourceType: "Observation",
                modelType: USCoreBloodPressureProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-specimen": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-specimen",
                resourceType: "Specimen",
                modelType: USCoreSpecimenProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-smokingstatus": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-smokingstatus",
                resourceType: "Observation",
                modelType: USCoreSmokingStatusProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-location": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-location",
                resourceType: "Location",
                modelType: USCoreLocation
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-clinical-result": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-clinical-result",
                resourceType: "Observation",
                modelType: USCoreObservationClinicalResultProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-vital-signs": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-vital-signs",
                resourceType: "Observation",
                modelType: USCoreVitalSignsProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab",
                resourceType: "DiagnosticReport",
                modelType: USCoreDiagnosticReportProfileLaboratoryReporting
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-simple-observation": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-simple-observation",
                resourceType: "Observation",
                modelType: USCoreSimpleObservationProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitionerrole": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitionerrole",
                resourceType: "PractitionerRole",
                modelType: USCorePractitionerRoleProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-servicerequest": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-servicerequest",
                resourceType: "ServiceRequest",
                modelType: USCoreServiceRequestProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-weight": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-weight",
                resourceType: "Observation",
                modelType: USCoreBodyWeightProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-coverage": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-coverage",
                resourceType: "Coverage",
                modelType: USCoreCoverageProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-immunization": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-immunization",
                resourceType: "Immunization",
                modelType: USCoreImmunizationProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationdispense": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationdispense",
                resourceType: "MedicationDispense",
                modelType: USCoreMedicationDispenseProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure",
                resourceType: "Procedure",
                modelType: USCoreProcedureProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-sexual-orientation": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-sexual-orientation",
                resourceType: "Observation",
                modelType: USCoreObservationSexualOrientationProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-implantable-device": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-implantable-device",
                resourceType: "Device",
                modelType: USCoreImplantableDeviceProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-occupation": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-occupation",
                resourceType: "Observation",
                modelType: USCoreObservationOccupationProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/pediatric-bmi-for-age": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/pediatric-bmi-for-age",
                resourceType: "Observation",
                modelType: USCorePediatricBMIforAgeObservationProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-goal": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-goal",
                resourceType: "Goal",
                modelType: USCoreGoalProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-head-circumference": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-head-circumference",
                resourceType: "Observation",
                modelType: USCoreHeadCircumferenceProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-careplan": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-careplan",
                resourceType: "CarePlan",
                modelType: USCoreCarePlanProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner",
                resourceType: "Practitioner",
                modelType: USCorePractitionerProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medication": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medication",
                resourceType: "Medication",
                modelType: USCoreMedicationProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-bmi": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-bmi",
                resourceType: "Observation",
                modelType: USCoreBMIProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization",
                resourceType: "Organization",
                modelType: USCoreOrganizationProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/head-occipital-frontal-circumference-percentile": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/head-occipital-frontal-circumference-percentile",
                resourceType: "Observation",
                modelType: USCorePediatricHeadOccipitalFrontalCircumferencePercentileProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-pregnancyintent": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-pregnancyintent",
                resourceType: "Observation",
                modelType: USCoreObservationPregnancyIntentProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-relatedperson": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-relatedperson",
                resourceType: "RelatedPerson",
                modelType: USCoreRelatedPersonProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest",
                resourceType: "MedicationRequest",
                modelType: USCoreMedicationRequestProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-height": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-height",
                resourceType: "Observation",
                modelType: USCoreBodyHeightProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-temperature": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-temperature",
                resourceType: "Observation",
                modelType: USCoreBodyTemperatureProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-screening-assessment": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-screening-assessment",
                resourceType: "Observation",
                modelType: USCoreObservationScreeningAssessmentProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-provenance": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-provenance",
                resourceType: "Provenance",
                modelType: USCoreProvenance
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter",
                resourceType: "Encounter",
                modelType: USCoreEncounterProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-encounter-diagnosis": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition-encounter-diagnosis",
                resourceType: "Condition",
                modelType: USCoreConditionEncounterDiagnosisProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-pregnancystatus": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-pregnancystatus",
                resourceType: "Observation",
                modelType: USCoreObservationPregnancyStatusProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-heart-rate": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-heart-rate",
                resourceType: "Observation",
                modelType: USCoreHeartRateProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient",
                resourceType: "Patient",
                modelType: USCorePatientProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-questionnaireresponse": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-questionnaireresponse",
                resourceType: "QuestionnaireResponse",
                modelType: USCoreQuestionnaireResponseProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-allergyintolerance": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-allergyintolerance",
                resourceType: "AllergyIntolerance",
                modelType: USCoreAllergyIntolerance
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-careteam": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-careteam",
                resourceType: "CareTeam",
                modelType: USCoreCareTeam
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/pediatric-weight-for-height": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/pediatric-weight-for-height",
                resourceType: "Observation",
                modelType: USCorePediatricWeightForHeightObservationProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-respiratory-rate": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-respiratory-rate",
                resourceType: "Observation",
                modelType: USCoreRespiratoryRateProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab",
                resourceType: "Observation",
                modelType: USCoreLaboratoryResultObservationProfile
            },
            "http://hl7.org/fhir/us/core/StructureDefinition/us-core-pulse-oximetry": {
                url: "http://hl7.org/fhir/us/core/StructureDefinition/us-core-pulse-oximetry",
                resourceType: "Observation",
                modelType: USCorePulseOximetryProfile
            }
        },
        searchParameters: [USCORE_IG_SEARCH_PARAMS_1, USCORE_IG_SEARCH_PARAMS_2]
    };
    r4:FHIRImplementationGuide baseImplementationGuide = new(baseIgRecord);
    check fhirRegistry.addImplementationGuide(baseImplementationGuide);

    log:printDebug("FHIR R4 USCore Module initialized.");
}

# This empty function is used to initialize the module by other modules/packages.
public isolated function initialize() {};
