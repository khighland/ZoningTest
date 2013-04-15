/**
 * Service1Service.as
 * This file was auto-generated from WSDL by the Apache Axis2 generator modified by Adobe
 * Any change made to this file will be overwritten when the code is re-generated.
 */
 /**
  * Usage example: to use this service from within your Flex application you have two choices:
  * Use it via Actionscript only
  * Use it via MXML tags
  * Actionscript sample code:
  * Step 1: create an instance of the service; pass it the LCDS destination string if any
  * var myService:Service1= new Service1();
  * Step 2: for the desired operation add a result handler (a function that you have already defined previously)  
  * myService.addProcessRequestEventListener(myResultHandlingFunction);
  * Step 3: Call the operation as a method on the service. Pass the right values as arguments:
  * myService.ProcessRequest(myf,myfilename);
  *
  * MXML sample code:
  * First you need to map the package where the files were generated to a namespace, usually on the <mx:Application> tag, 
  * like this: xmlns:srv="org.cityofencinitas.*"
  * Define the service and within its tags set the request wrapper for the desired operation
  * <srv:Service1 id="myService">
  *   <srv:ProcessRequest_request_var>
  *		<srv:ProcessRequest_request f=myValue,filename=myValue/>
  *   </srv:ProcessRequest_request_var>
  * </srv:Service1>
  * Then call the operation for which you have set the request wrapper value above, like this:
  * <mx:Button id="myButton" label="Call operation" click="myService.ProcessRequest_send()" />
  */
package org.cityofencinitas
{
	import mx.rpc.AsyncToken;
	import flash.events.EventDispatcher;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.events.FaultEvent;
	import flash.utils.ByteArray;
	import mx.rpc.soap.types.*;

    /**
     * Dispatches when a call to the operation ProcessRequest completes with success
     * and returns some data
     * @eventType ProcessRequestResultEvent
     */
    [Event(name="ProcessRequest_result", type="org.cityofencinitas.ProcessRequestResultEvent")]
    
	/**
	 * Dispatches when the operation that has been called fails. The fault event is common for all operations
	 * of the WSDL
	 * @eventType mx.rpc.events.FaultEvent
	 */
    [Event(name="fault", type="mx.rpc.events.FaultEvent")]

	public class Service1 extends EventDispatcher implements IService1
	{
    	private var _baseService:BaseService1;
        
        /**
         * Constructor for the facade; sets the destination and create a baseService instance
         * @param The LCDS destination (if any) associated with the imported WSDL
         */  
        public function Service1(destination:String=null,rootURL:String=null)
        {
        	_baseService = new BaseService1(destination,rootURL);
        }
        
		//stub functions for the ProcessRequest operation
          

        /**
         * @see IService1#ProcessRequest()
         */
        public function processRequest(f:flash.utils.ByteArray,filename:String):AsyncToken
        {
         	var _internal_token:AsyncToken = _baseService.processRequest(f,filename);
            _internal_token.addEventListener("result",_ProcessRequest_populate_results);
            _internal_token.addEventListener("fault",throwFault); 
            return _internal_token;
		}
        /**
		 * @see IService1#ProcessRequest_send()
		 */    
        public function processRequest_send():AsyncToken
        {
        	return processRequest(_ProcessRequest_request.f,_ProcessRequest_request.filename);
        }
              
		/**
		 * Internal representation of the request wrapper for the operation
		 * @private
		 */
		private var _ProcessRequest_request:ProcessRequest_request;
		/**
		 * @see IService1#ProcessRequest_request_var
		 */
		[Bindable]
		public function get processRequest_request_var():ProcessRequest_request
		{
			return _ProcessRequest_request;
		}
		
		/**
		 * @private
		 */
		public function set processRequest_request_var(request:ProcessRequest_request):void
		{
			_ProcessRequest_request = request;
		}
		
	  		/**
		 * Internal variable to store the operation's lastResult
		 * @private
		 */
        private var _processRequest_lastResult:String;
		[Bindable]
		/**
		 * @see IService1#ProcessRequest_lastResult
		 */	  
		public function get processRequest_lastResult():String
		{
			return _processRequest_lastResult;
		}
		/**
		 * @private
		 */
		public function set processRequest_lastResult(lastResult:String):void
		{
			_processRequest_lastResult = lastResult;
		}
		
		/**
		 * @see IService1#addProcessRequest()
		 */
		public function addprocessRequestEventListener(listener:Function):void
		{
			addEventListener(ProcessRequestResultEvent.ProcessRequest_RESULT,listener);
		}
			
		/**
		 * @private
		 */
        private function _ProcessRequest_populate_results(event:ResultEvent):void
		{
			var e:ProcessRequestResultEvent = new ProcessRequestResultEvent();
		            e.result = event.result as String;
		                       e.headers = event.headers;
		             processRequest_lastResult = e.result;
		             dispatchEvent(e);
	        		}
		
		//service-wide functions
		/**
		 * @see IService1#getWebService()
		 */
		public function getWebService():BaseService1
		{
			return _baseService;
		}
		
		/**
		 * Set the event listener for the fault event which can be triggered by each of the operations defined by the facade
		 */
		public function addService1FaultEventListener(listener:Function):void
		{
			addEventListener("fault",listener);
		}
		
		/**
		 * Internal function to re-dispatch the fault event passed on by the base service implementation
		 * @private
		 */
		 
		 private function throwFault(event:FaultEvent):void
		 {
		 	dispatchEvent(event);
		 }
    }
}
