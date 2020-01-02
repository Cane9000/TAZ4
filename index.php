<html

  <?php
         if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $comment = ($_POST["comment"]);
         }
   ?>

   <head>
      <title>The Andy Zone</title>
   </head>

   <body>
      
      <a href="stream.php">Streamer</a>
      <br>
      <a href="killer.php">Kill</a>
     
         <h2>Edit Config</h2>

            <form method = "post"
         
      
               <table>

                  <tr>
                     <td><textarea name = "comment" text" rows = "30" cols = "40"><?php echo (file_get_contents( "www-config.txt" ));?></textarea></td>
                  </tr>
                  <br>
                  <tr>
                     <td>
                        <input type = "submit" name = "submit" value = "Save">
                     </td>
                  </tr>
               </table>
            </form>
      
   <?php
      $myfile = fopen("www-config.txt", "w") or die("Unable to open file!");
      fwrite($myfile, $comment)or die("Unable to write to file!");
         
      echo "<h2>Saved Config</h2>";
      echo nl2br(file_get_contents( "www-config.txt" )); 
   ?>

   </body>
</html>

