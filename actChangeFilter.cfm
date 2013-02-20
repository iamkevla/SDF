<cfset session.filtered = not session.filtered >

<cflocation url="#cgi.HTTP_REFERER#">