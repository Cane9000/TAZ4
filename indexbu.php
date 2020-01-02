<html>
  

   <head>
      <title>The Andy Zone</title>
   </head>

   <body>
      
      <a href="stream.php">Streamer</a>
      <a href="killer.php">Kill</a>
     
    
   
     <?php
      

         // define variables and set to empty values
         

         if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $comment = ($_POST["comment"]);
         }

         #function test_input($data) {

         #   return $data;
         #}
      ?>

    

      <h2>Configuration File</h2>

      <form method = "post"
         
      
         <table>

             <tr>
               <td>Edit Config:</td>
               <td><textarea name = "comment" text" rows = "30" cols = "40"><?php echo (file_get_contents( "newfile.txt" ));?></textarea></td>
            </tr>
            
            <tr>
               <td>
                  <input type = "submit" name = "submit" value = "Save">
               </td>
            </tr>

         </table>
      </form>
      
      <?php
   
      $myfile = fopen("newfile.txt", "w") or die("Unable to open file!");
      fwrite($myfile, $comment)or die("Unable to write to file!");
      
      ?>

      <?php
         echo "<h2>Saved Config</h2>";

         echo nl2br(file_get_contents( "newfile.txt" )); // get the contents, and echo it out.
          #header("Refresh:0; url=index.php");
         

      ?>

   </body>

</html>

