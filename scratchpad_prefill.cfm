<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script type="text/javascript" language="javascript" >

	var myVerbs=new Array();
	myVerbs[0]="add";
	myVerbs[1]="edit";
	myVerbs[2]="delete";
	myVerbs[3]="view";
	
	function lookForVerb(x,y){
		if (y.value == ""){
			var v;
			for (v in myVerbs){
				y.value= x.match(myVerbs[v]);
				if (y.value != "" ){break;}					
			}
		}
	}
</script>
</head>
<body>

<cfform name="myform" >


<cftextarea name="requirement" onkeyup="javascript:lookForVerb(this.value, document.myform.verb);"  >This is a test</cftextarea>


<cfinput type="text" name ="verb" value="" >


</cfform>

		
</body>
</html>