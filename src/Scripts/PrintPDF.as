// ActionScript file
//print pdf using AlivePDF library
//This requires a create_PDF.php file on server
	
	//Alivepdf
	import org.alivepdf.saving.Method;
	import org.alivepdf.layout.Size;
	import org.alivepdf.layout.Unit;
	import org.alivepdf.layout.Orientation;
	import org.alivepdf.pdf.PDF;
	
	private var myPDF:PDF;
	public function generatePDF(cont:DisplayObject):void
	{
		myPDF=new PDF(Orientation.PORTRAIT,Unit.MM,Size.A4);
		myPDF.addPage();
		
		//CONTROL, x pos, y pos, x strentch, y stretch
		//the control needs to be inside a layout control to not get cut off
		myPDF.addImage(cont, 0, 0, 100, 100, ".PNG", 100, 1,"FIT_TO_PAGE");
		//myPDF.addImage(cht1, 0, 0, 100, 100, ".PNG", 100, 1,"FIT_TO_PAGE");
		//myPDF.addImage(dGrid, 0, 60, 100, 100, ".PNG", 100, 1,"FIT_TO_PAGE");	
		
		//saving
		myPDF.save(Method.REMOTE,"http://tabasco.sannet.gov/jodi/create_PDF.php","ATTACHMENT", "testCTD.pdf")
	}
	
	private function getBitmapData(target:UIComponent):BitmapData   
	{    
		var bd : BitmapData = new BitmapData( target.width, target.height );    
		var m : Matrix = new Matrix();    
		bd.draw( target, m );    
		return bd;   
	} 