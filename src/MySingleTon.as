package {
	import EncComponents.Profiler;
	
	public class MySingleTon {   
	
		//This file is to hold all global variables on a singleton object	
    	//all variables accessible to all components using: MySingleTon.getInstance().variablename
  
		import mx.collections.*; 
		import mx.core.Application;
		import mx.controls.*;
		import com.esri.ags.layers.GraphicsLayer;
		
    	// Single Instance of MySingleTon
		private static var instance:MySingleTon;

	    //GLOBAL VARIABLES for the data
		//[Bindable] public var _userdata:XML = new XML();
		//[Bindable] public var _usersdata:XMLListCollection;
		//[Bindable] public var _resultdata:XML = new XML();
		//[Bindable] public var _resultsdata:XMLListCollection;
		//[Bindable] public var _filterAnom:Array = new Array();
		//[Bindable] public var _dGrid:DataGrid = new DataGrid();
 
 		//GLOBAL VARIALBES for the map selection
 		//[Bindable] public  var _map:String;
 		//[Bindable] public  var _queryLayer:String;
		//[Bindable] public  var _queryFields:String;	
		//[Bindable] public  var _queryExp:String;	
		//[Bindable] public  var _graphicsLayer:GraphicsLayer = new GraphicsLayer();
 		
	    public function MySingleTon (enforcer:SingletonEnforcer)
	    {
	    	if (enforcer == null)
	    	{
                      throw new Error( "You Can Only Have One MySingleTon" );
			}
		}

		// Returns the Single Instance
		public static function getInstance() : MySingleTon
		{
			if (instance == null)
			{
				instance = new MySingleTon ( new SingletonEnforcer );
			}
			return instance;
		}
	}
}

// Utility Class to Deny Access to Constructor
class SingletonEnforcer {}





		

			

