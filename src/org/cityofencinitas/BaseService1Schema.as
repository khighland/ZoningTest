package org.cityofencinitas
{
	 import mx.rpc.xml.Schema
	 public class BaseService1Schema
	{
		 public var schemas:Array = new Array();
		 public var targetNamespaces:Array = new Array();
		 public function BaseService1Schema():void
		{
			 var xsdXML0:XML = <s:schema xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:tns="http://tempuri.org/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" attributeFormDefault="unqualified" elementFormDefault="qualified" targetNamespace="http://tempuri.org/">
    <s:element name="HelloWorld">
        <s:complexType/>
    </s:element>
    <s:element name="HelloWorldResponse">
        <s:complexType>
            <s:sequence>
                <s:element minOccurs="0" name="HelloWorldResult" type="s:string"/>
            </s:sequence>
        </s:complexType>
    </s:element>
    <s:element name="ProcessRequest">
        <s:complexType>
            <s:sequence>
                <s:element minOccurs="0" name="f" type="s:base64Binary"/>
                <s:element minOccurs="0" name="filename" type="s:string"/>
            </s:sequence>
        </s:complexType>
    </s:element>
    <s:element name="ProcessRequestResponse">
        <s:complexType>
            <s:sequence>
                <s:element minOccurs="0" name="ProcessRequestResult" type="s:string"/>
            </s:sequence>
        </s:complexType>
    </s:element>
</s:schema>
;
			 var xsdSchema0:Schema = new Schema(xsdXML0);
			schemas.push(xsdSchema0);
			targetNamespaces.push(new Namespace('','http://tempuri.org/'));
		}
	}
}