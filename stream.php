<html>
  

   <head>
      <title>The Andy Zone</title>
   </head>

   <body>
 

      <h2>FINISHED!</h2>

 
  <?php
   shell_exec(". /var/www/html/streamer.sh"); 
   $LS = shell_exec("ls");
   echo $LS;
   ?>
 

   </body>

</html>

