<?xml version="1.0" encoding="UTF-8"?><wsdl:definitions xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:tns="http://tempuri.org/" targetNamespace="http://tempuri.org/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://tempuri.org/">
      <s:element name="HelloWorld">
        <s:complexType/>
      </s:element>
      <s:element name="HelloWorldResponse">
        <s:complexType>
          <s:sequence>
            <s:element maxOccurs="1" minOccurs="0" name="HelloWorldResult" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ProcessRequest">
        <s:complexType>
          <s:sequence>
            <s:element maxOccurs="1" minOccurs="0" name="f" type="s:base64Binary"/>
            <s:element maxOccurs="1" minOccurs="0" name="filename" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ProcessRequestResponse">
        <s:complexType>
          <s:sequence>
            <s:element maxOccurs="1" minOccurs="0" name="ProcessRequestResult" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="HelloWorldSoapOut">
    <wsdl:part element="tns:HelloWorldResponse" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="ProcessRequestSoapIn">
    <wsdl:part element="tns:ProcessRequest" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="ProcessRequestSoapOut">
    <wsdl:part element="tns:ProcessRequestResponse" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:message name="HelloWorldSoapIn">
    <wsdl:part element="tns:HelloWorld" name="parameters">
    </wsdl:part>
  </wsdl:message>
  <wsdl:portType name="Service1Soap">
    <wsdl:operation name="HelloWorld">
      <wsdl:input message="tns:HelloWorldSoapIn">
    </wsdl:input>
      <wsdl:output message="tns:HelloWorldSoapOut">
    </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ProcessRequest">
      <wsdl:input message="tns:ProcessRequestSoapIn">
    </wsdl:input>
      <wsdl:output message="tns:ProcessRequestSoapOut">
    </wsdl:output>
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="Service1Soap" type="tns:Service1Soap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http"/>
    <wsdl:operation name="HelloWorld">
      <soap:operation soapAction="http://tempuri.org/HelloWorld" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ProcessRequest">
      <soap:operation soapAction="http://tempuri.org/ProcessRequest" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="Service1Soap12" type="tns:Service1Soap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http"/>
    <wsdl:operation name="HelloWorld">
      <soap12:operation soapAction="http://tempuri.org/HelloWorld" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ProcessRequest">
      <soap12:operation soapAction="http://tempuri.org/ProcessRequest" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="Service1">
    <wsdl:port binding="tns:Service1Soap12" name="Service1Soap12">
      <soap12:address location="http://encuploadservice.cityofencinitas.org/EncUploadService/service1.asmx"/>
    </wsdl:port>
    <wsdl:port binding="tns:Service1Soap" name="Service1Soap">
      <soap:address location="http://encuploadservice.cityofencinitas.org/EncUploadService/service1.asmx"/>
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>