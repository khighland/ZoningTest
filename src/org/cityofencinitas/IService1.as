
/**
 * Service.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
package org.cityofencinitas{
	import mx.rpc.AsyncToken;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;
               
    public interface IService1
    {
    	//Stub functions for the ProcessRequest operation
    	/**
    	 * Call the operation on the server passing in the arguments defined in the WSDL file
    	 * @param f
    	 * @param filename
    	 * @return An AsyncToken
    	 */
    	function processRequest(f:flash.utils.ByteArray,filename:String):AsyncToken;
        /**
         * Method to call the operation on the server without passing the arguments inline.
         * You must however set the _request property for the operation before calling this method
         * Should use it in MXML context mostly
         * @return An AsyncToken
         */
        function processRequest_send():AsyncToken;
        
        /**
         * The processRequest operation lastResult property
         */
        function get processRequest_lastResult():String;
		/**
		 * @private
		 */
        function set processRequest_lastResult(lastResult:String):void;
       /**
        * Add a listener for the processRequest operation successful result event
        * @param The listener function
        */
       function addprocessRequestEventListener(listener:Function):void;
       
       
        /**
         * The processRequest operation request wrapper
         */
        function get processRequest_request_var():ProcessRequest_request;
        
        /**
         * @private
         */
        function set processRequest_request_var(request:ProcessRequest_request):void;
                   
        /**
         * Get access to the underlying web service that the stub uses to communicate with the server
         * @return The base service that the facade implements
         */
        function getWebService():BaseService1;
	}
}