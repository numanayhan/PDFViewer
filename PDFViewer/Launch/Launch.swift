//
//  Launch.swift
//  PDFViewer
//
//  Created by numan ayhan on 9.05.2022.
//

import UIKit

class Launch: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        //create directory
        let documentsPath = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        let logsPath = documentsPath.appendingPathComponent("data")
        print(logsPath!)
        
        do{
        try FileManager.default.createDirectory(atPath: logsPath!.path, withIntermediateDirectories: true, attributes: nil)

        }catch let error as NSError{
        print("Unable to create directory",error)
        }
        
        let file = "file1.txt"
        let text = "some text"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
        let fileURL = dir.appendingPathComponent(file)
        //writing

        do{
        try text.write(to: fileURL, atomically: false, encoding: .utf8)
        }catch{
        print("cant write…")
        }
        }
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
        let file = "file1.txt"
        let fileURL = dir.appendingPathComponent(file)

        //reading

        do{
        let text = try String(contentsOf: fileURL, encoding: .utf8)
        print(text)
        }catch{
        print("cant read…")
        }
        }
        
        //Move File
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
        let oldPath = dir.appendingPathComponent("ileMove.txt")
        let newPath = dir.appendingPathComponent("data/fileMove.txt")
        let fileManager = FileManager.default
        do{
        try fileManager.moveItem(at: oldPath, to: newPath)
        }catch{
        print("cant move the file…")
        }
        }
        
        //copy file
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
        let originalFile = dir.appendingPathComponent("file1.txt")
        let copyFile = dir.appendingPathComponent("copy.txt")

        let fileManager = FileManager.default
        do{
        try fileManager.copyItem(at: originalFile, to: copyFile)
        }catch{
        print("can’t copy")
        }
        }
        
        //File permissions
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent("file1.txt"){
        let filePath = pathComponent.path
        let fileManager = FileManager.default

        if fileManager.fileExists(atPath: filePath){
        print("File Available")
        }else{
        print("File not available")
        }

        var filePermission:NSString = ""
        if (fileManager.isWritableFile(atPath: filePath)){
        filePermission = filePermission.appending("file is writable") as NSString
        }
        if(fileManager.isReadableFile(atPath: filePath)){
        filePermission = filePermission.appending("file is readable") as NSString
        }
        if(fileManager.isExecutableFile(atPath: filePath)){
        filePermission = filePermission.appending("file is executable") as NSString
        }
        print(filePermission)
        }
        
        
        //check file contents are same or not
        let path2 = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url2 = NSURL(fileURLWithPath: path2)
        let fileManager = FileManager.default
        if let pathComponent1 = url2.appendingPathComponent("file1.txt"){
        if let pathComponent2 = url2.appendingPathComponent("file2.txt"){
        let filePath1 = pathComponent1.path
        let filePath2 = pathComponent2.path
        print(try! fileManager.contentsEqual(atPath: filePath1, andPath: filePath2))

        }
        }
        let path3 = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url3 = NSURL(fileURLWithPath: path3)
        let filePath3 = url3.path
        let fileManager3 = FileManager.default
        print(try! fileManager.contentsOfDirectory(atPath: filePath3!))




        
    }
     

}
