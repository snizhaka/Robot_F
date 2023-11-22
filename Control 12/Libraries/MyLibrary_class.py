"""
Using this library you can:
- findout cantent of directory
- verify if file you need exists
- calculate the md5 hash for file you want
- compare two md5 hashes
"""
from robot.api.deco import keyword
import os
import hashlib
import logging

class MyLibrary_class:
    __all__= ['read_directory','check_that_file_exists','calculate_md5','compare_md5_hashes']
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
 
    @keyword('Content of directory')
    def read_directory(self,dir_path):
        """
        The keyword helps you see the contents of the neded directory.
    
         * Parameter:
         - dir_path  path to neded directory

         Keyword _returns_ list of files and directories
        """
        content = os.listdir("%s" %dir_path)
        print("List of files and directories",content)
        logging.debug("banana_reading")
        return(content)
    
    @keyword('File exists')
    def check_that_file_exists(self,content_of_directory,name_file):
        """
        The keyword helps you see if the file you specified exists
    
         * Parameter:
         - content_of_directory  you should run 'Content of directory' first
         - name_file   name of file for verification

         Keyword _prints_ information 'File exists' or 'File does not exists',
         depending on availability. And return True or False value 
        """
        if name_file in content_of_directory:
            print("File exist")
            exists = True
        else:
            print("File does not exist")
            exists = False
        logging.debug("banana_checking") 
        return(exists)
    
    @keyword('Calculate ${file_path} md5')
    def calculate_md5(self,file_path):
        """
        The keyword helps you calculate md5 hash for file
    
         * Parameter:
         - file_path    path to file for calculating

         Keyword _returns_ hash for file you set
        """
        calculated_md5 = hashlib.md5(open('%s'%file_path,'rb').read()).hexdigest()
        print("MD5 for file is ",calculated_md5)
        logging.debug("banana_calculating")
        return(calculated_md5)
    
    @keyword('Compare')
    def compare_md5_hashes(self,actual_md5,expected_md5):
        """
        The keyword helps you compare md5 hashes for file
    
         * Parameters:
         - actual_md5    calculated hash by keyword
         - expected_md5  hash for comparing

         Keyword _prints_ information 'md5 hashes are the same' or 'md5 hashes are different'
         And return True or False value
        """
        if actual_md5 == expected_md5:
            print('md5 hashes are the same')
            same = True

        else:
            print('md5 hashes are different')
            same = False
        logging.debug("banana_comparing")
        return(same)
