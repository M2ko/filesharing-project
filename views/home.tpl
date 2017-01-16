<!DOCTYPE html>
<html lang="en">
  <head>
    <script src="api.js"></script>
    <script src=jquery-3.1.0.js></script>
    <link rel='shortcut icon' type='image/x-icon' href='favicon.ico' />
    <link rel="stylesheet" href="styles.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </head>

<body>
<div id="topbar">
    <button onclick="addFolder()" id="addfolder" class="btn btn-sm btn-primary">Add Folder</button>
</div>
<div id="wrapper">
<div id="div1">
<h1>Folders</h1>
<!--<div id="folders">!-->
%for folder in files[0]:
    <p class="hover" id="{{folder}}" onclick="nextPage(this.id)">{{folder}}</p>
    <br>
    %end
%for file in files[1]:
    <p class="hover files" id="{{file}}" onclick="showButtons(this.id)">{{file}}</p>
    <br>
    %end
<!--</div>!-->

<div class="container" id="div2">
<div class="spinner"></div>

          <!-- Standar Form -->
          <h4 id="uploading" >Upload</h4>
          <form method="post" enctype="multipart/form-data" id="uploadform">
            <div class="form-inline">
              <div class="form-group">
                <input type="file" name="file" id="js-upload-files" multiple>
              </div>
              <button onclick="startUpload()" type="button" class="btn btn-sm btn-primary" id="submit" >Upload files</button>
            </div>
          </form>

          <!-- Drop Zone
          <h4>Or drag and drop files below</h4>
          <div class="upload-drop-zone" id="drop-zone">
            Just drag and drop files here
          </div>-->
    </div> <!-- /container -->
</div>
<button onclick="deleteFile()" class="hiddenbuttons btn-danger" id="delete">delete</button>
<button onclick="download()"class="hiddenbuttons btn-primary" id="download">download</button>
</div>
</body>
</html>
