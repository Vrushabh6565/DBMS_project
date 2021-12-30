
Create Database Exam;
Use Exam;
create table department
	(	
		dep_name		varchar(20),
		building      	varchar(20),
		budget 			numeric(12),
		primary key (dep_name)
	);

create table student
	( id		varchar(10),
	  name		varchar(30),
	  email		varchar(30),
	  dep      varchar(20),
	  DOB 		varchar(20),
	  gender      varchar(5),
	  pass		varchar(30) not null,
	  sem 		varchar(1),
	  flag 		varchar(1),
	 primary key (id),
	 foreign key (dep) references department(dep_name) 
	 		on delete cascade
	);
	
create table professor
	( id			varchar(10),
	  name		varchar(30),
	  email		varchar(30),
	  dep      varchar(20),
	  DOB 		varchar(20),
	  gender      varchar(5),
	  pass		varchar(30) not null,
	 primary key (id),
	 foreign key (dep) references department(dep_name) on delete cascade
	);
	
create table administrator
	( id			varchar(10),
	  name		varchar(30),
	  email		varchar(30),
	  DOB 		varchar(20),
	  gender      varchar(5),
	  pass		varchar(30) not null,
	 primary key (id)
	);
	
create table course
	(	id			varchar(10),
		name		varchar(30),
		dep      	varchar(20),
		credits 	numeric(2),
		primary key (id),
		foreign key (dep) references department(dep_name) on delete cascade
	);
	
create table teaches
	(	course_id 	varchar(10),
		prof_id 	varchar(10),
		semester	numeric(1),
		primary key (course_id , prof_id ),
		foreign key (course_id) references course(id) on delete cascade,
		foreign key (prof_id) references professor(id) on delete cascade
	);

create table enrolled
	(	course_id 	varchar(10),
		s_id 	varchar(10),
		sem		varchar(1),
		attendance varchar(5),
		primary key (course_id , s_id ,sem),
		foreign key (course_id) references course(id) on delete cascade,
		foreign key (s_id) references student(id) on delete cascade
		
	);	
		
create table fees
	(  	s_id 		varchar(10),
		ID			varchar(20),
		amount		numeric(10),
		primary key (s_id , ID),
		foreign key (s_id) references student(id) on delete cascade
	);

create table feedback
	(	s_id		varchar(10),
		prof_id		varchar(10),
		sem			varchar(1),
		course_id 	varchar(10),
		message 	varchar(200),
		primary key (s_id , prof_id , sem , course_id) ,
		foreign key (s_id) references student(id) on delete cascade,
		foreign key (course_id) references course(id) on delete cascade,
		foreign key (prof_id) references student(id) on delete cascade
		
	);
	
create table exam
	(	exam_id varchar(10),
		course_id 	varchar(10),
		sem			varchar(1),
		d_ate	varchar(10),
		time	varchar(20),
		classroom	varchar(20),
		supervisor varchar(10),
		primary key (exam_id),
		foreign key (course_id) references course(id) on delete cascade,
		foreign key (supervisor) references professor(id) on delete cascade
	);
	
create table result 
	(	exam_id varchar(10),
		s_id 	varchar(10),
		grade 	numeric(10),
		
		primary key (exam_id,s_id),
		foreign key (exam_id) references exam(exam_id) on delete cascade,
		foreign key (s_id) references student(id) on delete cascade
	);

		
Insert into administrator values( "9403836118" , "Abhijeet" , "admin.comp@coep.ac.in","27/08/01" , "Male","Admin");
Insert into department values("Computer" , "Main Building" , 24555)


