load data
infile 'C:\myjsp\MyWeb\WebContent\MyWebSQL\zipcode_20130201.csv'
replace into table tbl_post	 -- 테이블의 내용을 새로 채우겠다.
fields terminated by ','	 -- ','로 구분하겠다?
trailing nullcols		 -- 널 값이 있을 수 있다.
( zipcode char,
  sido    char,
  gugun   char,
  dong    char,
  bunji   char,
  seq     integer external       -- 오직 숫자만 입력받기 위해
)