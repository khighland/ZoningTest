// ActionScript file

	import mx.controls.DataGrid;
	
        /**
         * Simple script to convert a Datagrid to a HTML table and then 
         * pass it on to an external excel exporter
         *
         * @author: S.Radovanovic (With help of Tracy Spratt through the post on
         *          http://www.cflex.net/showFileDetails.cfm?ObjectID=298&Object=File&ChannelID=1)
         * 
         * modified by jluostarinen Quartic Solutions 0/06/09
         * 
         */   

        //Libs that are mostly used 
        //(only a number are necessary for the datagrid conversion and export)
    	import mx.controls.Alert;
    	import mx.core.UIComponent;
    	import mx.core.Container;
    	import mx.events.ItemClickEvent;
    	import mx.utils.ObjectProxy;
		import flash.errors.*;
		import flash.events.*;
		import flash.external.*;		
		import flash.net.URLLoader;
		import flash.net.URLVariables;
		import flash.net.URLRequest;
        
        //The location of the excel export file
        public var urlExcelExport:String = "http://"+PHP_SERVER+"/exportexcel.php";
        
    
        /**
         * Convert the datagrid to a html table
         * Styling etc. can be done externally
         * 
         * @param: dg Datagrid Contains the datagrid that needs to be converted
         * @returns: String
         */
        public function convertDGToHTMLTable(dg:DataGrid):String {
        	//Set default values
        	var font:String = dg.getStyle('fontFamily');
        	var size:String = dg.getStyle('fontSize');
        	var str:String = '';
        	var colors:String = '';
        	var style:String = 'style="font-family:'+font+';font-size:'+size+'pt;"';				
        	var hcolor:Array;
        	
        	//Retrieve the headercolor
        	if(dg.getStyle("headerColor") != undefined) {
        		hcolor = [dg.getStyle("headerColor")];
        	} else {
        		hcolor = dg.getStyle("headerColors");
        	}				
        	
        	//Set the htmltabel based upon knowlegde from the datagrid
        	str+= '<table width="'+dg.width+'"><thead><tr width="'+dg.width+'" style="background-color:#' +Number((hcolor[0])).toString(16)+'">';
        	
        	//Set the tableheader data (retrieves information from the datagrid header				
        	for(var i:int = 0;i<dg.columns.length;i++) {
        		colors = dg.getStyle("themeColor");
        			
        		if(dg.columns[i].headerText != undefined) {
        			str+="<th "+style+">"+dg.columns[i].headerText+"</th>";
        		} else {
        			str+= "<th "+style+">"+dg.columns[i].dataField+"</th>";
        		}
        	}
        	str += "</tr></thead><tbody>";
        	colors = dg.getStyle("alternatingRowColors");
        	
        	//Loop through the records in the dataprovider and 
        	//insert the column information into the table
        	for(var j:int =0;j<dg.dataProvider.length;j++) {					
        		str+="<tr width=\""+Math.ceil(dg.width)+"\">";
        			
        		for(var k:int=0; k < dg.columns.length; k++) {
        			
        			//Do we still have a valid item?						
        			if(dg.dataProvider.getItemAt(j) != undefined && dg.dataProvider.getItemAt(j) != null) {
        				
        				//Check to see if the user specified a labelfunction which we must
        				//use instead of the dataField
        				if(dg.columns[k].labelFunction != undefined) {
        					str += "<td width=\""+Math.ceil(dg.columns[k].width)+"\" "+style+">"+dg.columns[k].labelFunction(dg.dataProvider.getItemAt(j),dg.columns[k].dataField)+"</td>";
        					
        				} else {
        					//Our dataprovider contains the real data
        					//We need the column information (dataField)
        					//to specify which key to use.
        					str += "<td width=\""+Math.ceil(dg.columns[k].width)+"\" "+style+">"+dg.dataProvider.getItemAt(j)[dg.columns[k].dataField]+"</td>";
        				}
        			}
        		}
        		str += "</tr>";
        	}
        	str+="</tbody></table>";
        
        	return str;
        }
        
		/**
		 * Load a specific datagrid into Excel
		 * This method passes the htmltable string to an backend script which then
		 * offers the excel download to the user.
		 * The reason for not using a copy to clipboard and then javascript to
		 * insert it into Excel is that this mostly will fail because of the user
		 * setup (Webbrowser configuration).
		 * 
		 * @params: dg Datagrid The Datagrid that will be loaded into Excel
		 */
		public function DataGridToExcel(dg:DataGrid):void {

			if (dg.dataProvider)
			{
			//Pass the htmltable in a variable so that it can be delivered
			//to the backend script
			var variables:URLVariables = new URLVariables(); 
			variables.htmltable	= convertDGToHTMLTable(dg);
			
			//Setup a new request and make sure that we are 
			//sending the data through a post
			var u:URLRequest = new URLRequest(urlExcelExport);
			u.data = variables; //Pass the variables
			u.method = URLRequestMethod.POST; //Don't forget that we need to send as POST
			
			//Navigate to the script
			//We can use _self here, since the script will through a filedownload header
			//which results in offering a download to the user (and still remaining in you Flex app.)
            //navigateToURL(u,"_self");
            navigateToURL(u);
   }
   
   else
   		Alert.show("There is no data selected")
   }          
