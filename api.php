<?php

$g_link = false;
// common db access functions 
function db_connect() {
	global $g_link;
    if( $g_link )
        return $g_link;	
    // Yeah, using deprecated API ...
    //  TODO: consider rewor
	// Connecting, selecting database
	$g_link = mysql_connect('localhost:3306', 'henrik', 'pGUCLCpIxD80YbrO9bZx')
	    or die('Could not connect: ' . mysql_error());

	mysql_set_charset('utf8',$g_link);
	mysql_select_db('henrik') or die('Could not select database');
}

function db_close() {
    global $g_link;
    if( $g_link != false )
        mysql_close($g_link);
    $g_link = false;
}

function db_fetch($query) {
	db_connect();
	$result =array();
	$qresult = mysql_query($query) or die('Query failed: ' . mysql_error());

	while ($line = mysql_fetch_assoc($qresult)) {
		array_push($result, $line);
	}	


	return $result;
}

function db_exec($query) {
	db_connect();

	$qresult = mysql_query($query) or die('Query failed: ' . mysql_error());
	return mysql_affected_rows();
}


function db_getCategories() {
	$categories = db_fetch('SELECT * FROM categories');
	$ingredients = db_fetch('SELECT i.*, m.Name as MeasurementName FROM ingredients i left join measurements m on i.MeasurementID = m.MeasurementID');

	foreach($categories as $i => $v)
		$categories[$i]['Ingredients'] = array();

	foreach($ingredients as $i => $v ){ 
		$categoryId = $v['CategoryID'];
		foreach($categories as $ic => $vc)
			if ($vc['CategoryID'] == $categoryId) {
				array_push($categories[$ic]['Ingredients'], $v);
				break;
			}
		
	}
	return $categories;
}

function db_getCourseById($id) {
	$courses = db_fetch(sprintf('SELECT * FROM coursemain where CourseID = %d', $id));
	$details = db_fetch(sprintf('SELECT d.*,
		i.Name as IngredientName,
		i.MeasurementID,
		m.Name as MeasurementName,
		c.Name as CategoryName,
		c.Icon as CategoryIcon
		FROM coursedetail d 
		inner join ingredients i on d.IngredientID = i.IngredientID 
		inner join categories c on d.CategoryID = c.CategoryID 
		left join measurements m on i.MeasurementID = m.MeasurementID
		where d.CourseID = %d', $id));

	foreach($courses as $i => $v){
		$courses[$i]['Details'] = array();	
		$courses[$i]['PrimaryIngredients'] = array();

		db_exec(sprintf('insert into courseusage (CourseID) values(%d)', $v['CourseID']));
	}

	foreach($details as $i => $v ){ 
		$courseId = $v['CourseID'];
		foreach($courses as $ic => $vc)
			if ($vc['CourseID'] == $courseId) {
				array_push($courses[$ic]['Details'], $v);
				if ($v['PrimaryYesNo'] == 1)
					array_push($courses[$ic]['PrimaryIngredients'], $v);				
				break;
			}
	}	

	return $courses[0];
}

function db_getCourseByIngridients($ingredientIds) {
	// try to keep args safe
	$inStatement = array();
	foreach ($ingredientIds as $i => $id) {
		array_push($inStatement, sprintf('%d', $id));
	}

	$inStatement= implode(', ', $inStatement);

	// fetch courses 
	$courses = db_fetch(sprintf('SELECT c.* 
	FROM coursemain c 
	inner join coursedetail d on c.CourseID = d.CourseID 
	where d.IngredientID in (%s)', $inStatement));

	// fetch details
	$details = db_fetch(sprintf('SELECT d.*,
		i.Name as IngredientName,
		i.MeasurementID,
		m.Name as MeasurementName,
		c.Name as CategoryName,
		c.Icon as CategoryIcon
		FROM coursedetail d 
		inner join ingredients i on d.IngredientID = i.IngredientID 
		inner join categories c on d.CategoryID = c.CategoryID 
		left join measurements m on i.MeasurementID = m.MeasurementID
		where d.IngredientID in (%s)', $inStatement));

	foreach($courses as $i => $v) {
		$courses[$i]['Details'] = array();	
		$courses[$i]['PrimaryIngredients'] = array();
	}

	foreach($details as $i => $v ){ 
		$courseId = $v['CourseID'];
		foreach($courses as $ic => $vc)
			if ($vc['CourseID'] == $courseId) {
				array_push($courses[$ic]['Details'], $v);
				if ($v['PrimaryYesNo'] == 1)
					array_push($courses[$ic]['PrimaryIngredients'], $v);
				break;
			}
	}	

	return $courses;
}

function db_getLastUsedCourses() {

	// fetch courses 
	$courses = db_fetch('SELECT c.* 
		FROM coursemain c 
		inner join (SELECT CourseID, count(*) as rating FROM courseusage Group by CourseID ) r on c.CourseID = r.CourseID 
		order by rating desc 
		limit 12');

	// fetch details
	$details = db_fetch('SELECT d.*,
		i.Name as IngredientName,
		i.MeasurementID,
		m.Name as MeasurementName,
		c.Name as CategoryName,
		c.Icon as CategoryIcon
		FROM coursedetail d 
		inner join (SELECT CourseID, count(*) rating FROM `courseusage` Group by CourseID ) r on d.CourseID = r.CourseID 
		inner join ingredients i on d.IngredientID = i.IngredientID 
		inner join categories c on d.CategoryID = c.CategoryID 
		left join measurements m on i.MeasurementID = m.MeasurementID
		');

	foreach($courses as $i => $v) {
		$courses[$i]['Details'] = array();	
		$courses[$i]['PrimaryIngredients'] = array();
	}

	foreach($details as $i => $v ){ 
		$courseId = $v['CourseID'];
		foreach($courses as $ic => $vc)
			if ($vc['CourseID'] == $courseId) {
				array_push($courses[$ic]['Details'], $v);
				if ($v['PrimaryYesNo'] == 1)
					array_push($courses[$ic]['PrimaryIngredients'], $v);
				break;
			}
	}	

	return $courses;
}


function routeApiRequst() {
	$query = $_GET['q'];
	switch ($query) {
		case 'categories':
			return db_getCategories() ;
			break;
		case 'course':
			return db_getCourseById($_GET['id']) ;
			break;
		case 'lastusedcourses':
			return db_getLastUsedCourses() ;
			break;
		case 'findcourses':
			return db_getCourseByIngridients(json_decode($_GET['ingredients']));
			break;

		default:
			
			break;
	}
}

$result = routeApiRequst();
$result = json_encode($result/*, JSON_UNESCAPED_UNICODE*/);
print ($result);

db_close();
?>