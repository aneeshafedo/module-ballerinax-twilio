// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/log;
import ballerinax/twilio;

configurable string accountSId = ?;
configurable string authToken = ?;
configurable string fromMobile = ?;
configurable string toMobile = ?;

public function main() returns error? {
    //Twilio Client configuration
    twilio:ConnectionConfig twilioConfig = {
        twilioAuth: {
            accountSId: accountSId,
            authToken: authToken
        }
    };

    //Twilio Client
    twilio:Client twilioClient = check new (twilioConfig);

    //Send whatsapp remote function is called by the twilio client
    twilio:WhatsAppResponse response = check twilioClient->sendWhatsAppMessage(fromNo = fromMobile, toNo = toMobile,
            message = "Test Whatsapp");
    log:printInfo("Message Detail: " + response.toString());
}
