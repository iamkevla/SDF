<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

   <script type="text/javascript">
      moveListener = function()
      {
      if (ColdFusion.Window != null)
      { var w = ColdFusion.Window.getWindowObject('testWindow');
      w.on('move',setCoords,w);
      }
      }
      
      setCoords = function(ob,x,y)
      { document.myForm.Xcoord.value=x;
      	document.myForm.Ycoord.value=y;
      }
      

   </script>
</head>
<body onload="javascript:moveListener()">
   <CFWINDOW closable="true" initshow="true" name="testWindow">
      Test test
   </CFWINDOW>
<form id="myForm" name="myForm" >
<input name="Xcoord" type="textbox" value="" >
<input name="Ycoord" type="textbox" value="" >
</form>
</body>
</html>