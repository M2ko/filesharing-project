
<div id="wrapper">
<h1 class="hover" id="lastpage" onclick="lastPage()"><--</h1>

<h2 id='path'></h2>
<div id="div1">
%for folder in files[0]:
    <p class="hover" id="{{folder}}" onclick="nextPage(this.id)">{{folder}}</p>
    <br>
    %end
%for file in files[1]:
    <p class="hover files" id="{{file}}" onclick="showButtons(this.id)">{{file}}</p>
    <br>
    %end


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
          </div> -->
    </div> <!-- /container -->
    </div>
    <button onclick="deleteFile() "class="hiddenbuttons btn-danger" id="delete">delete</button>
    <button onclick="download()"class="hiddenbuttons btn-primary" id="download">download</button>
</div>

