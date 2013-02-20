<cfajaxproxy bind="javascript:doMultiply({first},{second})" />
<script>
function doMultiply(x,y) {
   document.getElementById("result").value = x*y;
}
</script>

<form>
<input id="first" size="3"> X <input id="second" size="3"> = <input id="result">

</form>