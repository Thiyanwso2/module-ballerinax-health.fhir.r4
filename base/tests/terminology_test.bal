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

import ballerina/test;

@test:Config {
    groups: ["coding", "create_coding", "successful_scenario"]
}
function createCoding1() {
    code code = "inactive";
    Coding|FHIRError actualCoding = terminologyProcessor.createCoding("http://hl7.org/fhir/account-status", code);
    Coding expectedCoding = {system: "http://hl7.org/fhir/account-status", code: "inactive", display: "Inactive"};
    test:assertEquals(actualCoding, expectedCoding);
}

@test:Config {
    groups: ["coding", "create_coding", "failure_scenario"]
}
function createCoding2() {
    code code = "inactive2";
    string system = "http://hl7.org/fhir/account-status";
    Coding|FHIRError actualCoding = terminologyProcessor.createCoding(system, code);
    test:assertEquals((<FHIRError>actualCoding).message(), string `Code : ${code} not found in system : ${system}`);
}

@test:Config {
    groups: ["coding", "create_coding", "failure_scenario"]
}
function createCoding3() {
    code code = "inactive";
    string incorrectSystem = "http://hl7.org/fhir/account-status1";
    Coding|FHIRError actualCoding = terminologyProcessor.createCoding(incorrectSystem, code);
    test:assertEquals((<FHIRError>actualCoding).message(), string `Unknown ValueSet or CodeSystem : ${incorrectSystem}`);
}

@test:Config {
    groups: ["coding", "create_coding", "failure_scenario"]
}
function createCoding4() {
    code code = "inactive";
    string system = "http://hl7.org/fhir/account-status";
    string incorrectVersion = "5.3.0";
    Coding|FHIRError actualCoding = terminologyProcessor.createCoding(system, code, version = incorrectVersion);
    test:assertEquals((<FHIRError>actualCoding).message(), string `Unknown ValueSet or CodeSystem : ${system}`);
}

@test:Config {
    groups: ["codeableconcept", "create_codeableconcept", "successful_scenario"]
}
function createCodeableconcept1() {
    code code = "inactive";
    string system = "http://hl7.org/fhir/account-status";

    CodeableConcept|FHIRError actualCC = terminologyProcessor.createCodeableConcept(system, code);
    CodeableConcept expectedCC = {
        coding: [
            {system: "http://hl7.org/fhir/account-status", code: "inactive", display: "Inactive"}
        ],
        text: "This account is inactive and should not be used to track financial information."
    };
    test:assertEquals(actualCC, expectedCC);
}

@test:Config {
    groups: ["codeableconcept", "create_codeableconcept", "failure_scenario"]
}
function createCodeableconcept2() {
    code incorrectCode = "inactive2";
    string system = "http://hl7.org/fhir/account-status";

    CodeableConcept|FHIRError actualCC = terminologyProcessor.createCodeableConcept(system, incorrectCode);
    test:assertEquals((<FHIRError>actualCC).message(), string `Code : ${incorrectCode} not found in system : ${system}`);
}

@test:Config {
    groups: ["codeableconcept", "create_codeableconcept", "failure_scenario"]
}
function createCodeableconcept3() {
    code code = "inactive";
    string incorrectSystem = "http://hl7.org/fhir/account-status2";

    CodeableConcept|FHIRError actualCC = terminologyProcessor.createCodeableConcept(incorrectSystem, code);
    test:assertEquals((<FHIRError>actualCC).message(), string `Unknown ValueSet or CodeSystem : ${incorrectSystem}`);
}

@test:Config {
    groups: ["codeableconcept", "create_codeableconcept", "failure_scenario"]
}
function createCodeableconcept4() {
    code code = "inactive";
    string system = "http://hl7.org/fhir/account-status";
    string incorrectVersion = "5.3.0";

    CodeableConcept|FHIRError actualCC = terminologyProcessor.createCodeableConcept(system, code, version = incorrectVersion);
    test:assertEquals((<FHIRError>actualCC).message(), string `Unknown ValueSet or CodeSystem : ${system}`);
}

@test:Config {
    groups: ["codesystem", "get_by_id_codesystem", "successful_scenario"]
}
function getByIdCodeSystemTest1() {
    string id = "action-condition-kind";
    string version = "4.3.0";

    CodeSystem expectedCS = returnCodeSystemData("action-condition-kind");

    CodeSystem|FHIRError actualCS = terminologyProcessor.getCodeSystemById(id, version);
    test:assertEquals(actualCS, expectedCS);
}

@test:Config {
    groups: ["codesystem", "get_by_id_codesystem", "successful_scenario"]
}
function getByIdCodeSystemTest2() {
    string id = "action-condition-kind";

    CodeSystem expectedCS = returnCodeSystemData("action-condition-kind");
    CodeSystem|FHIRError actualCS = terminologyProcessor.getCodeSystemById(id);
    test:assertEquals(actualCS, expectedCS);
}

@test:Config {
    groups: ["codesystem", "get_by_id_codesystem", "failure_scenario"]
}
function getByIdCodeSystemTest3() {
    string id = "action-condition-kind";
    string incorrectVersion = "5.3.0";

    CodeSystem|FHIRError actualCS = terminologyProcessor.getCodeSystemById(id, incorrectVersion);
    FHIRError err = <FHIRError>actualCS;
    test:assertEquals(err.message(), string `Unknown version: '${incorrectVersion}'`, "Mismatching error message");
    test:assertEquals(err.detail().issues[0].diagnostic, string `There is CodeSystem in the registry with Id: '${id}' but can not find version: '${incorrectVersion}' of it`, "Mismatching error diagonistic");
}

@test:Config {
    groups: ["codesystem", "get_by_id_codesystem", "failure_scenario"]
}
function getByIdCodeSystemTest4() {
    string incorrectId = "account-status2";
    string version = "5.3.0";

    CodeSystem|FHIRError codeSystem4 = terminologyProcessor.getCodeSystemById(incorrectId, version);
    test:assertEquals((<FHIRError>codeSystem4).message(), string `Unknown CodeSystem: '${incorrectId}'`);
}

@test:Config {
    groups: ["valueset", "get_by_id_valueset", "successful_scenario"]
}
function getByIdValueSetTest1() {
    string id = "relationship";
    string version = "4.3.0";

    ValueSet expectedVS = returnValueSetData(id);
    ValueSet|FHIRError|ValueSet[] actaulVS = terminologyProcessor.getValueSetById(id, version);
    test:assertEquals(actaulVS, expectedVS);
}

@test:Config {
    groups: ["valueset", "get_by_id_valueset", "successful_scenario"]
}
function getByIdValueSetTest2() {
    string id = "relationship";

    ValueSet expectedVS = returnValueSetData(id);
    ValueSet|FHIRError|ValueSet[] actaulVS = terminologyProcessor.getValueSetById(id);
    test:assertEquals(actaulVS, expectedVS);
}

@test:Config {
    groups: ["valueset", "get_by_id_valueset", "failure_scenario"]
}
function getByIdValueSetTest3() {
    string id = "relationship";
    string incorrectVersion = "5.3.0";

    ValueSet|FHIRError|ValueSet[] actaulVS = terminologyProcessor.getValueSetById(id, incorrectVersion);
    FHIRError err = <FHIRError>actaulVS;
    test:assertEquals(err.message(), string `Unknown version: '${incorrectVersion}'`, "Mismatching error message");
    test:assertEquals(err.detail().issues[0].diagnostic, string `There is ValueSet in the registry with Id: '${id}' but can not find version: '${incorrectVersion}' of it`, "Mismatching error diagonistic");
}

@test:Config {
    groups: ["valueset", "get_by_id_valueset", "failure_scenario"]
}
function getByIdValueSetTest4() {
    string incorrectId = "relationship2";
    string version = "4.3.0";

    ValueSet|FHIRError|ValueSet[] actaulVS = terminologyProcessor.getValueSetById(incorrectId, version);
    test:assertEquals((<FHIRError>actaulVS).message(), string `Unknown ValueSet: '${incorrectId}'`);
}

@test:Config {
    groups: ["codesystem", "search_codesystem", "successful_scenario"]
}
function searchCodeSystemTest1() {
    string id = "action-condition-kind";
    map<string[]> searchParameters = {"url": ["http://hl7.org/fhir/action-condition-kind"]};

    CodeSystem[]|FHIRError actualCS = terminologyProcessor.searchCodeSystems(searchParameters);
    CodeSystem expectedCS = returnCodeSystemData(id);
    if actualCS is CodeSystem[] {
        test:assertEquals(actualCS.length(), 1);
        test:assertEquals(actualCS[0], expectedCS);
    } else {
        test:assertEquals(actualCS, expectedCS);
    }
}

@test:Config {
    groups: ["codesystem", "search_codesystem", "successful_scenario"]
}
function searchCodeSystemTest2() {
    string id = "action-condition-kind";
    map<string[]> searchParameters = {"_id": ["action-condition-kind"]};

    CodeSystem[]|FHIRError actualCS = terminologyProcessor.searchCodeSystems(searchParameters);
    CodeSystem expectedCS = returnCodeSystemData(id);
    if actualCS is CodeSystem[] {
        test:assertEquals(actualCS.length(), 1);
        test:assertEquals(actualCS[0], expectedCS);
    } else {
        test:assertEquals(actualCS, expectedCS);
    }
}

@test:Config {
    groups: ["codesystem", "search_codesystem", "successful_scenario"]
}
function searchCodeSystemTest3() {
    map<string[]> searchParameters = {"version": ["4.3.0"], "_count": ["300"]};

    CodeSystem[]|FHIRError actualCS = terminologyProcessor.searchCodeSystems(searchParameters);
    if actualCS is CodeSystem[] {
        test:assertEquals(actualCS.length(), 276);
    } else {
        test:assertFail(actualCS.message());
    }
}

@test:Config {
    groups: ["codesystem", "search_codesystem", "successful_scenario"]
}
function searchCodeSystemTest4() {
    map<string[]> searchParameters = {"version": ["4.3.0"], "_offset": ["200"], "_count": ["300"]};

    CodeSystem[]|FHIRError actualCS = terminologyProcessor.searchCodeSystems(searchParameters);
    if actualCS is CodeSystem[] {
        test:assertEquals(actualCS.length(), 76);
    } else {
        test:assertFail(actualCS.message());
    }
}

@test:Config {
    groups: ["codesystem", "search_codesystem", "successful_scenario"]
}
function searchCodeSystemTest5() {
    map<string[]> searchParameters = {"status": ["active"], "_offset": ["0"], "_count": ["50"]};

    CodeSystem[]|FHIRError actualCS = terminologyProcessor.searchCodeSystems(searchParameters);
    if actualCS is CodeSystem[] {
        test:assertEquals(actualCS.length(), 34);
    } else {
        test:assertFail(actualCS.message());
    }
}

@test:Config {
    groups: ["codesystem", "search_codesystem", "successful_scenario"]
}
function searchCodeSystemTest6() {
    map<string[]> searchParameters = {"status": ["active"], "_offset": ["50"], "_count": ["50"]};

    CodeSystem[]|FHIRError actualCS = terminologyProcessor.searchCodeSystems(searchParameters);
    if actualCS is CodeSystem[] {
        test:assertEquals(actualCS.length(), 0);
    } else {
        test:assertFail(actualCS.message());
    }
}

@test:Config {
    groups: ["valueset", "search_valueset", "successful_scenario"]
}
function searchValueSetTest1() {
    string id = "relationship";
    map<string[]> searchParameters = {"url": ["http://hl7.org/fhir/ValueSet/relationship"]};

    ValueSet[]|FHIRError actualVS = terminologyProcessor.searchValueSets(searchParameters);
    ValueSet expectedVS = returnValueSetData(id);
    if actualVS is ValueSet[] {
        test:assertEquals(actualVS.length(), 1);
        test:assertEquals(actualVS[0], expectedVS);
    } else {
        test:assertEquals(actualVS, expectedVS);
    }
}

@test:Config {
    groups: ["valueset", "search_valueset", "successful_scenario"]
}
function searchValueSetTest2() {
    string id = "relationship";
    map<string[]> searchParameters = {"url": ["http://hl7.org/fhir/ValueSet/relationship"]};

    ValueSet[]|FHIRError actualVS = terminologyProcessor.searchValueSets(searchParameters);
    ValueSet expectedVS = returnValueSetData(id);
    if actualVS is ValueSet[] {
        test:assertEquals(actualVS.length(), 1);
        test:assertEquals(actualVS[0], expectedVS);
    } else {
        test:assertEquals(actualVS, expectedVS);
    }
}

@test:Config {
    groups: ["valueset", "search_valueset", "successful_scenario"]
}
function searchValueSetTest3() {
    map<string[]> searchParameters = {"version": ["4.3.0"], "_count": ["300"]};

    ValueSet[]|FHIRError actualVS = terminologyProcessor.searchValueSets(searchParameters);
    if actualVS is ValueSet[] {
        test:assertEquals(actualVS.length(), 283);
    } else {
        test:assertFail(actualVS.message());
    }
}

@test:Config {
    groups: ["valueset", "search_valueset", "successful_scenario"]
}
function searchValueSetTest4() {
    map<string[]> searchParameters = {"version": ["4.3.0"], "_offset": ["200"], "_count": ["300"]};

    ValueSet[]|FHIRError actualVS = terminologyProcessor.searchValueSets(searchParameters);
    if actualVS is ValueSet[] {
        test:assertEquals(actualVS.length(), 83);
    } else {
        test:assertFail(actualVS.message());
    }
}

@test:Config {
    groups: ["valueset", "search_valueset", "successful_scenario"]
}
function searchValueSetTest5() {
    map<string[]> searchParameters = {"status": ["active"], "_offset": ["0"], "_count": ["50"]};

    ValueSet[]|FHIRError actualVS = terminologyProcessor.searchValueSets(searchParameters);
    if actualVS is ValueSet[] {
        test:assertEquals(actualVS.length(), 36);
    } else {
        test:assertFail(actualVS.message());
    }
}

@test:Config {
    groups: ["valueset", "search_valueset", "successful_scenario"]
}
function searchValueSetTest6() {
    map<string[]> searchParameters = {"status": ["active"], "_offset": ["50"], "_count": ["50"]};

    ValueSet[]|FHIRError actualVS = terminologyProcessor.searchValueSets(searchParameters);
    if actualVS is ValueSet[] {
        test:assertEquals(actualVS.length(), 0);
    } else {
        test:assertFail(actualVS.message());
    }
}

@test:Config {
    groups: ["codesystem", "codesystem_lookup", "successful_scenario"]
}
function codeSystemLookupTest1() {
    code code = "inactive";
    CodeSystemConcept[]|CodeSystemConcept|FHIRError actualConcept = terminologyProcessor
                                                .codeSystemLookUp(code, system = "http://hl7.org/fhir/account-status");
    CodeSystem expectedCS = returnCodeSystemData("account-status");

    foreach CodeSystemConcept c in <CodeSystemConcept[]>expectedCS.concept {
        if c.code == code {
            test:assertEquals(actualConcept, c);
        }
    }
}

@test:Config {
    groups: ["codesystem", "codesystem_lookup", "successful_scenario"]
}
function codeSystemLookupTest2() returns error? {
    Coding coding = check terminologyProcessor.createCoding("http://hl7.org/fhir/account-status", "inactive");
    CodeSystemConcept[]|CodeSystemConcept|FHIRError actualConcept = terminologyProcessor
                                                .codeSystemLookUp(coding, system = "http://hl7.org/fhir/account-status");
    CodeSystem expectedCS = returnCodeSystemData("account-status");

    foreach CodeSystemConcept c in <CodeSystemConcept[]>expectedCS.concept {
        if c.code == coding.code {
            test:assertEquals(actualConcept, c);
        }
    }
}

@test:Config {
    groups: ["codesystem", "codesystem_lookup", "successful_scenario"]
}
function codeSystemLookupTest3() returns error? {
    code code = "inactive";
    CodeableConcept codeableConcept = check terminologyProcessor.createCodeableConcept("http://hl7.org/fhir/account-status", code);
    CodeSystemConcept[]|CodeSystemConcept|FHIRError actualConcept = terminologyProcessor
                                                .codeSystemLookUp(codeableConcept, system = "http://hl7.org/fhir/account-status");
    CodeSystem expectedCS = returnCodeSystemData("account-status");

    foreach CodeSystemConcept c in <CodeSystemConcept[]>expectedCS.concept {
        if c.code == code {
            test:assertEquals(actualConcept, c);
        }
    }
}

@test:Config {
    groups: ["codesystem", "codesystem_lookup", "failure_scenario"]
}
function codeSystemLookupTest4() returns error? {
    code code = "inactive";
    string system = "http://hl7.org/fhir/account-status2|4.3.0";
    CodeSystemConcept[]|CodeSystemConcept|FHIRError actualConcept = terminologyProcessor
                                                .codeSystemLookUp(code, system = system);

    test:assertEquals((<FHIRError>actualConcept).message(),
            string `Cannot find a CodeSystem for the provided system URL: ${system}`);
}

@test:Config {
    groups: ["codesystem", "codesystem_lookup", "failure_scenario"]
}
function codeSystemLookupTest5() returns error? {
    code code = "inactive";
    CodeSystemConcept[]|CodeSystemConcept|FHIRError actualConcept = terminologyProcessor
                                                .codeSystemLookUp(code);

    test:assertEquals((<FHIRError>actualConcept).message(), "Can not find a CodeSystem");
    test:assertEquals((<FHIRError>actualConcept).detail().issues[0].diagnostic, "Either CodeSystem record or system URL should be provided as input");
}

@test:Config {
    groups: ["codesystem", "codesystem_lookup", "failure_scenario"]
}
function codeSystemLookupTest6() returns error? {
    code code = "inactive2";
    string id = "account-status";
    CodeSystemConcept[]|CodeSystemConcept|FHIRError actualConcept = terminologyProcessor
                                                .codeSystemLookUp(code, system = "http://hl7.org/fhir/account-status");

    test:assertEquals((<FHIRError>actualConcept).message(), string `Can not find any valid concepts for the code: "${code}" in CodeSystem: "${id}"`);
}

@test:Config {
    groups: ["valueset", "valueset_lookup", "successful_scenario"]
}
function valueSetLookupTest1() {
    code code = "1";
    CodeSystemConcept[]|CodeSystemConcept|FHIRError actualConcept = terminologyProcessor
                                                .valueSetLookUp(code, system = "http://hl7.org/fhir/ValueSet/relationship");
    CodeSystem expectedVS = returnCodeSystemData("relationship");

    foreach CodeSystemConcept c in <CodeSystemConcept[]>expectedVS.concept {
        if c.code == code {
            test:assertEquals(actualConcept, c);
        }
    }
}

@test:Config {
    groups: ["valueset", "valueset_lookup", "successful_scenario"]
}
function valueSetLookupTest2() returns error? {
    Coding coding = check terminologyProcessor.createCoding("http://hl7.org/fhir/relationship", "1");
    CodeSystemConcept[]|CodeSystemConcept|FHIRError actualConcept = terminologyProcessor
                                                .valueSetLookUp(coding, system = "http://hl7.org/fhir/ValueSet/relationship");
    CodeSystem expectedVS = returnCodeSystemData("relationship");

    foreach CodeSystemConcept c in <CodeSystemConcept[]>expectedVS.concept {
        if c.code == coding.code {
            test:assertEquals(actualConcept, c);
        }
    }
}

@test:Config {
    groups: ["valueset", "valueset_lookup", "successful_scenario"]
}
function valueSetLookupTest3() returns error? {
    code code = "start";
    CodeableConcept codeableConcept = check terminologyProcessor.createCodeableConcept("http://hl7.org/fhir/action-condition-kind", code);
    CodeSystemConcept[]|CodeSystemConcept|FHIRError actualConcept = terminologyProcessor
                                                .valueSetLookUp(codeableConcept, system = "http://hl7.org/fhir/ValueSet/action-condition-kind");
    CodeSystem expectedVS = returnCodeSystemData("action-condition-kind");

    foreach CodeSystemConcept c in <CodeSystemConcept[]>expectedVS.concept {
        if c.code == code {
            test:assertEquals(actualConcept, c);
        }
    }
}

@test:Config {
    groups: ["valueset", "valueset_lookup", "failure_scenario"]
}
function valueSetLookupTest4() returns error? {
    code code = "1";
    string system = "http://hl7.org/fhir/ValueSet/relationship2|4.3.0";
    CodeSystemConcept[]|CodeSystemConcept|FHIRError actualConcept = terminologyProcessor
                                                .valueSetLookUp(code, system = system);

    test:assertEquals((<FHIRError>actualConcept).message(),
            string `Cannot find a ValueSet for the provided system URL: ${system}`);
}

@test:Config {
    groups: ["valueset", "valueset_lookup", "failure_scenario"]
}
function valueSetLookupTest5() returns error? {
    code code = "1";
    CodeSystemConcept[]|CodeSystemConcept|FHIRError actualConcept = terminologyProcessor
                                                .valueSetLookUp(code);

    test:assertEquals((<FHIRError>actualConcept).message(), "Can not find a ValueSet");
    test:assertEquals((<FHIRError>actualConcept).detail().issues[0].diagnostic, "Either ValueSet record or system URL should be provided as input");
}

@test:Config {
    groups: ["valueset", "valueset_lookup", "failure_scenario"]
}
function valueSetLookupTest6() returns error? {
    code code = "test";
    string id = "relationship";
    CodeSystemConcept[]|CodeSystemConcept|FHIRError actualConcept = terminologyProcessor
                                                .valueSetLookUp(code, system = "http://hl7.org/fhir/ValueSet/relationship");

    test:assertEquals((<FHIRError>actualConcept).message(), string `Can not find any valid concepts for the code: "${code}" in ValueSet: "${id}"`);
}

@test:Config {
    groups: ["valueset", "valueset_expansion", "successful_scenario"]
}
function valueSetExpansionTest1() {
    ValueSet|FHIRError valueSet = terminologyProcessor.getValueSetById("relationship");
    map<string[]> searchParameters1 = {"valueSetVersion": ["4.3.0"], "_count": ["2"]};
    if valueSet is ValueSet {
        ValueSet|FHIRError actualVS = terminologyProcessor.
                                        valueSetExpansion(searchParameters1, system = "http://hl7.org/fhir/ValueSet/relationship");
        if actualVS is ValueSet {
            ValueSet expectedVS = returnValueSetData("expanded-relationship");
            ValueSetExpansion? expansion = actualVS.expansion;
            expectedVS.expansion.timestamp = (<ValueSetExpansion>expansion).timestamp;
            test:assertEquals(actualVS, expectedVS);
        }
    }
}

@test:Config {
    groups: ["valueset", "valueset_expansion", "successful_scenario"]
}
function valueSetExpansionTest2() {
    map<string[]> searchParameters = {"filter": ["account"]};
    ValueSet|FHIRError actualVS = terminologyProcessor.
                                        valueSetExpansion(searchParameters, system = "http://hl7.org/fhir/ValueSet/account-status");
    if actualVS is ValueSet {
        ValueSet expectedVS = returnValueSetData("expanded-account-status");
        ValueSetExpansion? expansion = actualVS.expansion;
        expectedVS.expansion.timestamp = (<ValueSetExpansion>expansion).timestamp;
        test:assertEquals(actualVS, expectedVS);
    }
}

@test:Config {
    groups: ["codesystem", "codesystem_subsume", "successful_scenario"]
}
function codesystemSubsumeTest1() returns error? {
    code codeA = "inactive";
    code codeB = "inactive";
    CodeSystem codeSystem = check terminologyProcessor.getCodeSystemById("account-status");
    string|FHIRError actaulResult = terminologyProcessor.subsumes(codeA, codeB, codeSystem);
    test:assertEquals(actaulResult, "equivalent");
}

@test:Config {
    groups: ["codesystem", "codesystem_subsume", "successful_scenario"]
}
function codesystemSubsumeTest2() returns error? {
    Coding codingA = check terminologyProcessor.createCoding("http://hl7.org/fhir/account-status", "inactive");
    Coding codingB = check terminologyProcessor.createCoding("http://hl7.org/fhir/account-status", "inactive");
    string|FHIRError actaulResult = terminologyProcessor.subsumes(codingA, codingB, system = "http://hl7.org/fhir/account-status");
    test:assertEquals(actaulResult, "equivalent");
}
