/* create a libname for the course (read only) shared folder  */
LIBNAME classlib "~/my_shared_file_links/kelbick10/";
/* create a libname for my own created folder  */
LIBNAME mylib "/home/u62122441/STAT5740HW/Project";
/* create a libname for my formats, and tell SAS to search for formats there */
LIBNAME myfmts "~/MyFormats";
options fmtsearch = (myfmts);

PROC IMPORT DATAFILE="/home/u62122441/STAT5740HW/Project/vgsales.csv"
	DBMS=CSV
	OUT=mylib.videogames;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=mylib.videogames; RUN;
