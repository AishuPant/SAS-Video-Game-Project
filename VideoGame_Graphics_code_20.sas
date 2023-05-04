/* create a libname for the course (read only) shared folder  */
LIBNAME classlib "~/my_shared_file_links/kelbick10/";
/* create a libname for my own created folder  */
LIBNAME mylib "/home/u62166666/MySASData";
/* create a libname for my formats, and tell SAS to search for formats there */
LIBNAME myfmts "~/MyFormats";
options fmtsearch = (myfmts);

/* Specific Question 4 (Aishwarya Pant)*/
/* Do certain genres perform better in different markets? */

/* First Stack Columns */

proc sort data=MYLIB.VG1 out=Mylib.VG1_tmp;
	by Genre;
run;

data Mylib.VG1_tmp;
	set Mylib.VG1_tmp;
	_Case_=_n_;
run;

proc transpose data=Mylib.VG1_tmp out=Mylib.VG1_Stacked(drop=_Label_ 
		rename=(col1= Sales)) name= Region;
	var NA_Sales JP_Sales EU_Sales Other_Sales;
	by _Case_ Genre;
run;

proc delete data=Mylib.VG1_tmp;
run;

proc sgplot data = mylib.VG1_STACKED;
  title 'Sales by Genre and Region';
  vbar Genre / response= Sales group= Region groupdisplay=cluster;
  xaxis display=(nolabel);
  yaxis grid  label='Sales (in millions)';
  run;
	