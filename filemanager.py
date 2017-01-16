import bottle
from bottle import route, run, template, static_file, view, get, request
from os import listdir, pardir, remove
from os.path import isfile, join,abspath, exists
import glob

global globalpath

@get('/<filename:re:.*\.ico>')
def javascripts(filename):
    return static_file(filename, root='static')
@get('/<filename:re:.*\.js>')
def javascripts(filename):
    return static_file(filename, root='static')
@get('/<filename:re:.*\.css>')
def css(filename):
    return static_file(filename, root='static')

@route('/download/<filename:path>')
def download(filename):
    resp = static_file(filename, root=globalpath, download=filename)
    #resp.set_header("Content-Disposition", "attachment")
    return resp

@route('/delete/<filename:path>')
def deleteFile(filename):
    pathtofile = globalpath + filename
    remove(pathtofile)
    if globalpath == "/home/pi/root/":
        return files()
    else:
        parts = globalpath.split('/')
        del parts[:4]
        del parts[-1]
        last = "/".join(parts)
        return files2(last)

@route('/upload/', method='POST')
def upload():
    file = request.files.get('file')
    if not file == None:
        if not exists(globalpath + file.filename):
            file.save(globalpath)
            if globalpath == "/home/pi/root/":
                return files()
            else:
                parts = globalpath.split('/')
                del parts[:4]
                del parts[-1]
                last = "/".join(parts)
                return files2(last)
        else:
            return "-1"
    else:
        return "-2"


@route("/<url:re:.+>")
def files2(url):
    path = "/home/pi/root/"
    global globalpath
    path += url + "/"
    globalpath = path
    all = []
    #path= abspath(path)

    for f in listdir(path):
        if not isfile(join(path, f)):
            f=f+"/"
        all.append(join(f))
    filelist =[]
    folderlist = []
    foldersandfiles = []
    for name in all:
        if name.endswith("/"):
            folderlist.append(name)
        else:
            filelist.append(name)

    foldersandfiles.append(folderlist)
    foldersandfiles.append(filelist)
    output = template("newpage", files=foldersandfiles)
    return output

@route("/")
def files():
    global globalpath
    path = "/home/pi/root/"
    globalpath = path
    #onlyfiles=[f for f in listdir(projectPath+'/' + projectName) if isfile(join(projectPath+'/' + projectName, f))]
    all = []
   #path= abspath(path)

    for f in listdir(path):
        if not isfile(join(path, f)):
            f=f+"/"
        all.append(join(f))
    filelist =[]
    folderlist = []
    foldersandfiles = []
    for name in all:
        if name.endswith("/"):
            folderlist.append(name)
        else:
            filelist.append(name)

    foldersandfiles.append(folderlist)
    foldersandfiles.append(filelist)
    output = template("home", files=foldersandfiles)
    return output

if __name__ == '__main__':
    bottle.run(host="0.0.0.0")
else:
    app = application = bottle.Bottle()

