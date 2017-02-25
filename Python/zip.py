import os
import zipfile
 
def compress(zip_file, input_dir):
  f_zip = zipfile.ZipFile(zip_file, 'w')
  for root, dirs, files in os.walk(input_dir):
    for f in files:
      # ��ȡ�ļ����·������ѹ�����ڽ�����ͬ��Ŀ¼�ṹ
      abs_path = os.path.join(os.path.join(root, f))
      rel_path = os.path.relpath(abs_path, os.path.dirname(input_dir))
      f_zip.write(abs_path, rel_path, zipfile.ZIP_STORED)
 
def extract(zip_file, output_dir):
  f_zip = zipfile.ZipFile(zip_file, 'r')
 
  # ��ѹ�����ļ���ָ��Ŀ¼
  f_zip.extractall(output_dir)
 
  # �����ѹ�ļ���ָ��Ŀ¼
  for f in f_zip.namelist():
    f_zip.extract(f, os.path.join(output_dir, 'bak'))
 
def printdir(zip_file):
  f_zip = zipfile.ZipFile(zip_file, 'r')
  print '== printdir() ============================'
  f_zip.printdir()
  print
  print '== namelist() ============================'
  for f in f_zip.namelist():
    print f
 
if __name__ == '__main__':
  zip_file = 'readability.zip'
  compress(zip_file, os.path.join(os.getcwd(), 'readability'))
  printdir(zip_file)
  extract(zip_file, 'output')