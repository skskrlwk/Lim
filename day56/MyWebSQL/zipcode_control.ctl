load data
infile 'C:\myjsp\MyWeb\WebContent\MyWebSQL\zipcode_20130201.csv'
replace into table tbl_post	 -- ���̺��� ������ ���� ä��ڴ�.
fields terminated by ','	 -- ','�� �����ϰڴ�?
trailing nullcols		 -- �� ���� ���� �� �ִ�.
( zipcode char,
  sido    char,
  gugun   char,
  dong    char,
  bunji   char,
  seq     integer external       -- ���� ���ڸ� �Է¹ޱ� ����
)