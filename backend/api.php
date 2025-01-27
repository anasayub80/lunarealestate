<?php
include("connection.php");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json");
header("Access-Control-Allow-Headers: Content-Type");
// 
function compressImage($source, $destination, $quality)
{
    $info = getimagesize($source);
    if ($info['mime'] == 'image/jpeg') {
        $image = imagecreatefromjpeg($source);
    } elseif ($info['mime'] == 'image/gif') {
        $image = imagecreatefromgif($source);
    } elseif ($info['mime'] == 'image/png') {
        $image = imagecreatefrompng($source);
    }
    imagejpeg($image, $destination, $quality);
}
// 
function imagecheck($imagetype)
{
    if ($imagetype == "JPG" || $imagetype == "jpg" || $imagetype == "PNG" || $imagetype == "png" || $imagetype == "jpeg" || $imagetype == "JPEG" || $imagetype == "") {
        return true;
    } else {
        return false;
    }
}
//usage
switch ($_GET['page']) {
        // Insert Property Data 
    case 'addProperty':
        $files = array();
        // Property Steps
        switch ($_POST['tab']) {
            case "basic_info":
                
                if(isset($_POST['formid'])){
                    $formid =     htmlentities(mysqli_real_escape_string($con, $_POST['formid']));
                    $onwerName =  htmlentities(mysqli_real_escape_string($con, $_POST['ownerName']));
                    $phone =  htmlentities(mysqli_real_escape_string($con, $_POST['phone']));
                    $update = mysqli_query($con, "UPDATE `house_details` SET `ownerName`='$onwerName',`phone`='$phone' WHERE `id` = '$formid'");
                    if($update){    
                        $select = mysqli_query($con, "SELECT * FROM `house_details` WHERE `id` = '$formid'");
                        $fetch  = mysqli_fetch_array($select);
                        echo json_encode(array('status' => "success", 'msg' => "Successfully Inserted", 'formid' => $formid,'detailType' => $fetch['detailType']));
                    }else{
                        
                    }
                }else{
                $user_id =  htmlentities($_POST['user_id']);
                $date = date("jS - M - Y");
                $onwerName =  htmlentities(mysqli_real_escape_string($con, $_POST['ownerName']));
                $phone =  htmlentities(mysqli_real_escape_string($con, $_POST['phone']));
                $title =     htmlentities(mysqli_real_escape_string($con, $_POST['title']));
                $location =  htmlentities(mysqli_real_escape_string($con, $_POST['location']));
                $query = mysqli_query($con, "INSERT INTO `house_details`(`user_id`, `detailType`, `ownerName`, `phone`, `date`,`title`,`location`) VALUES ('$user_id','0','$onwerName','$phone','$date','$title','$location')");
                if ($query) {

                    $select = mysqli_query($con, "SELECT * FROM `house_details` WHERE `user_id` =  '$user_id' ORDER BY `id` DESC LIMIT 1");
                    $fetch  = mysqli_fetch_array($select);
                    echo json_encode(array('status' => "success", 'msg' => "Successfully Inserted", 'formid' => $fetch['id'], 'detailType' => "0"));
                } else {

                    echo json_encode(array('status' => "warning", 'msg' => "Database Error"));
                }
                    
                }
                break;
            case "property_info":
                $formid =     htmlentities(mysqli_real_escape_string($con, $_POST['formid']));
               
                $bedrooms =  htmlentities(mysqli_real_escape_string($con, $_POST['bedrooms']));
                $bathrooms = htmlentities(mysqli_real_escape_string($con, $_POST['bathrooms']));
                $areaSize =  htmlentities(mysqli_real_escape_string($con, $_POST['areasize']));
                $stories =   htmlentities(mysqli_real_escape_string($con, $_POST['stories']));
                $squarefootage =   htmlentities(mysqli_real_escape_string($con, $_POST['squarefootage']));

                $query = mysqli_query($con, "UPDATE `house_details` SET `bedrooms`='$bedrooms',`bathrooms`='$bathrooms',`areaSize`='$areaSize',`stories`='$stories',`squarefootage`='$squarefootage' WHERE `id` = '$formid'");

                if ($query) {
                  $select = mysqli_query($con, "SELECT * FROM `house_details` WHERE `id` = '$formid'");
                  $fetch  = mysqli_fetch_array($select);
                  echo json_encode(array('status' => "success", 'msg' => "Successfully Inserted", 'formid' => $formid,'detailType' => $fetch['detailType']));
                } else {

                    echo json_encode(array('status' => "warning", 'msg' => "Database Error"));
                }
                break;
              case "survey_info":
                $formid =     htmlentities(mysqli_real_escape_string($con, $_POST['formid']));
                $assiteNewHome =  htmlentities(mysqli_real_escape_string($con, $_POST['assitnewhome']));
                $backedTaxowed =  htmlentities(mysqli_real_escape_string($con, $_POST['backedtaxowed']));
                $basement =  htmlentities(mysqli_real_escape_string($con, $_POST['basement']));
                $dryer =  htmlentities(mysqli_real_escape_string($con, $_POST['dryer']));
                $existingMorgage =  htmlentities(mysqli_real_escape_string($con, $_POST['existingMorgage']));
                $foundation =  htmlentities(mysqli_real_escape_string($con, $_POST['foundation']));
                $gasUtilityavail =  htmlentities(mysqli_real_escape_string($con, $_POST['gasUtilityavail']));
                $helpmorgage =  htmlentities(mysqli_real_escape_string($con, $_POST['helpmorgage']));
                $isProp =  htmlentities(mysqli_real_escape_string($con, $_POST['isProp']));
                $lockbox =  htmlentities(mysqli_real_escape_string($con, $_POST['lockbox']));
                $lop =  htmlentities(mysqli_real_escape_string($con, $_POST['lop']));
                $newHome =  htmlentities(mysqli_real_escape_string($con, $_POST['newhome']));
                $owfinance =  htmlentities(mysqli_real_escape_string($con, $_POST['owfinance']));
                $userRange =  htmlentities(mysqli_real_escape_string($con, $_POST['range']));
                $sewer =  htmlentities(mysqli_real_escape_string($con, $_POST['sewer']));
                $survery =  htmlentities(mysqli_real_escape_string($con, $_POST['survery']));
                $washer =  htmlentities(mysqli_real_escape_string($con, $_POST['washer']));
                $waterOn =  htmlentities(mysqli_real_escape_string($con, $_POST['waterOn']));

                $query = mysqli_query($con, "UPDATE `house_details` SET  `assiteNewHome`='$assiteNewHome',`backedTaxowed`='$backedTaxowed',`basement`='$basement',`dryer`='$dryer',`existingMorgage`='$existingMorgage',`foundation`='$foundation',`gasUtilityavail`='$gasUtilityavail',`helpmorgage`='$helpmorgage',`isProp`='$isProp',`lockbox`='$lockbox',`lop`='$lop',`newHome`='$newHome',`owfinance`='$owfinance',`userRange`='$userRange',`sewer`='$sewer',`survery`='$survery',`washer`='$washer',`waterOn`= '$waterOn' WHERE `id` = '$formid'");

                if ($query) {
                  $select = mysqli_query($con, "SELECT * FROM `house_details` WHERE `id` = '$formid'");
                  $fetch  = mysqli_fetch_array($select);
                  echo json_encode(array('status' => "success", 'msg' => "Successfully Inserted", 'formid' => $formid,'detailType' => $fetch['detailType']));
                } else {

                    echo json_encode(array('status' => "warning", 'msg' => "Database Error"));
                }

                break;    
            case 'image':
                    $formid = htmlentities(mysqli_real_escape_string($con, $_POST['formid']));
                     $select = mysqli_query($con, "SELECT * FROM `form_images` where `form_id` = '$formid'");
                    if (mysqli_num_rows($select) > 0) {
                        while($fetch_check = mysqli_fetch_array($select)){
                            $scan_pix = $fetch_check['images'];
                            $file_path = "../uploads/house_details/";
                            $pix_handle = opendir($file_path);
                                while ($pix_file = readdir($pix_handle)) {
                                    if ($pix_file == $scan_pix) {
                                        unlink($file_path . "/" . $pix_file);
                                    }
                                }
                        closedir($pix_handle);
                        }
                            $delt_old = mysqli_query($con, "DELETE FROM `form_images` WHERE `form_id` = '$formid'");
                    } else {
                        $delt_old = true;
                    }
                    if ($delt_old) {
                        if (is_array($_FILES['gallery']['name'])) {
                            foreach ($_FILES['gallery']['tmp_name'] as $key => $val) {
                                $gallery = date('dmYHis') . str_replace(" ", "", basename($_FILES["gallery"]["name"][$key]));
                                $gallery_type = str_replace("", "", basename($_FILES["gallery"]["type"][$key]));
                                $path_gallery = "../uploads/house_details/" . $gallery;
                                if (!imagecheck($gallery_type)) {
                                    echo "image";
                                    exit();
                                } else {
                                    move_uploaded_file($_FILES["gallery"]["tmp_name"][$key], $path_gallery);
                                }
                                $insertGallery = mysqli_query($con, "INSERT INTO `form_images`(`images`, `form_id`) VALUES ('$gallery','$formid')");
                            }
    
                            if ($insertGallery) {
                               $select = mysqli_query($con, "SELECT * FROM `house_details` WHERE `id` = '$formid'");
                                $fetch  = mysqli_fetch_array($select);
                                echo json_encode(array('status' => "success", 'msg' => "Successfully Inserted", 'formid' => $formid,'detailType' => $fetch['detailType']));
                            } else {
                                echo json_encode(array('status' => "warning", 'msg' => "Database Error"));
                            }
                        } else {
                            echo json_encode(array('status' => "warning", 'msg' => "Image must be in Array"));
                        }
                    } else {
                        echo json_encode(array('status' => "warning", 'msg' => "Old Image not deleting"));
                    }
                 break;       
            case 'survey_more':
                $formid = htmlentities(mysqli_real_escape_string($con, $_POST['formid']));
                $lockboxPlace =  htmlentities(mysqli_real_escape_string($con, $_POST['lockboxPlace']));
                $lopExplain =  htmlentities(mysqli_real_escape_string($con, $_POST['lopExplain']));
                $payMethod =  htmlentities(mysqli_real_escape_string($con, $_POST['paymethod']));
                $rating =  htmlentities(mysqli_real_escape_string($con, $_POST['rating']));
                $taxAmount =  htmlentities(mysqli_real_escape_string($con, $_POST['taxAmount']));
                $timeFrame =  htmlentities(mysqli_real_escape_string($con, $_POST['timeFrame']));
                $fastcash =  htmlentities(mysqli_real_escape_string($con, $_POST['fastcash']));
                $query = mysqli_query($con, "UPDATE `house_details` SET  `detailType` = '1' , `lopExplain`='$lopExplain',`lockboxPlace`='$lockboxPlace',`payMethod`='$payMethod',`rating`='$rating',`taxAmount`='$taxAmount',`timeFrame`='$timeFrame',`fastcash` = '$fastcash' WHERE `id` = '$formid'");

                if ($query) {
                    echo json_encode(array('status' => "success", 'msg' => "Successfully Inserted", 'formid' => $formid, 'detailType' => "1"));
                } else {

                    echo json_encode(array('status' => "warning", 'msg' => "Database Error"));
                }


                break;

            
            default:
              echo json_encode(array('status' => "warning", 'msg' => "Tab not found"));
            break;
        }

    break;
 case "saveSurvey":
    // Receive and decode the JSON from Flutter app
    $json = file_get_contents('php://input');
    $data = json_decode($json, true); // Decode JSON into an associative array

    // Check if the necessary data exists
    if (isset($data['formid']) && isset($data['userid']) && isset($data['questions_and_answers'])) {
        // Sanitize and escape input data
        $formid = htmlentities(mysqli_real_escape_string($con, $data['formid']));
        $userid = htmlentities(mysqli_real_escape_string($con, $data['userid']));

        // Insert general survey info into `survey_info` table
        $survey_query = mysqli_query($con, "INSERT INTO survey_info (formid, userid) 
                                            VALUES ('$formid', '$userid')");

        if ($survey_query) {
            // Get the survey_info_id after inserting
            $survey_info_id = mysqli_insert_id($con);

            // Loop through questions and insert them into `survey_questions` and `survey_answers`
            foreach ($data['questions_and_answers'] as $question_data) {
                // Check if question and answers are present
                if (isset($question_data['question']) && isset($question_data['answers'])) {
                    $question = htmlentities(mysqli_real_escape_string($con, $question_data['question']));

                    // Insert the question into `survey_questions`
                    $insert_question = mysqli_query($con, "INSERT INTO survey_questions (survey_info_id, question) 
                                                           VALUES ('$survey_info_id', '$question')");

                    if ($insert_question) {
                        $survey_question_id = mysqli_insert_id($con);  // Get the ID of the inserted question

                        // Loop through the answers and insert them into `survey_answers`
                        foreach ($question_data['answers'] as $answer_data) {
                            // Check if 'answer' and 'selectedAnswer' are present in answer data
                            if (isset($answer_data['answer']) && isset($answer_data['selectedAnswer'])) {
                                $answer = htmlentities(mysqli_real_escape_string($con, $answer_data['answer']));
                                $selected_answer = $answer_data['selectedAnswer'] ? 1 : 0;  // Convert boolean to 1 or 0

                                // Insert the answer into `survey_answers`
                                $insert_answer = mysqli_query($con, "INSERT INTO survey_answers (survey_question_id, answer, selectedAnswer) 
                                                                     VALUES ('$survey_question_id', '$answer', '$selected_answer')");
                            } else {
                                echo json_encode(array('status' => "warning", 'msg' => "Missing 'answer' or 'selectedAnswer' for one of the answers"));
                                exit;
                            }
                        }
                    }
                } else {
                    echo json_encode(array('status' => "warning", 'msg' => "Missing 'question' or 'answers' for one of the questions"));
                    exit;
                }
            }

            // Check if everything was inserted correctly
            if (isset($insert_answer) && $insert_answer) {
                // Fetch the survey info details
                $select = mysqli_query($con, "SELECT * FROM survey_info WHERE formid = '$formid'");
                $fetch = mysqli_fetch_array($select);

                echo json_encode(array(
                    'status' => "success", 
                    'msg' => "Successfully Inserted", 
                    'formid' => $formid,
                    // 'detailType' => $fetch['detailType']
                ));
            } else {
                echo json_encode(array('status' => "warning", 'msg' => "Error inserting answers"));
            }
        } else {
            echo json_encode(array('status' => "warning", 'msg' => "Error inserting survey info"));
        }
    } else {
        echo json_encode(array('status' => "error", 'msg' => "Missing required data: formid, userid, or questions_and_answers"));
    }
    break;

    case 'deleteProperty':
        $formid = htmlentities(mysqli_real_escape_string($con, $_POST['formid']));
       
         $delete = mysqli_query($con, "DELETE FROM `house_details` WHERE `id` = '$formid'");
        if ($delete) {
            $select = mysqli_query($con, "SELECT * FROM `form_images` where `form_id` = '$formid'");
            if (mysqli_num_rows($select) > 0) {
                while($fetch_check = mysqli_fetch_array($select))
                {
                $scan_pix = $fetch_check['images'];
                $file_path = "../uploads/house_details/";
                $pix_handle = opendir($file_path);
                while ($pix_file = readdir($pix_handle)) {
                    if ($pix_file == $scan_pix) {
                        unlink($file_path . "/" . $pix_file);
                    }
                }
                closedir($pix_handle);
                }
                $delete = mysqli_query($con, "DELETE FROM `form_images` WHERE `form_id` = '$formid'"); 
            }
            
        }
        if ($delete) {
                    echo json_encode(array('status' => "success", 'msg' => "Successfully Property Deleted"));
        }
        else {
            echo json_encode(array('status' => "warning", 'msg' => "Something Wrong in Database"));
        }
    
    break;

    case 'fetchHouse':
        $user_id =  htmlentities($_POST['user_id']);
        $select = mysqli_query($con, "SELECT * FROM `house_details` WHERE `user_id` = '$user_id' ORDER BY `id` DESC");
        if (mysqli_num_rows($select)) {
            $i = 0;
            $response = array();
            while ($fetch = mysqli_fetch_array($select)) {

                $select_img = mysqli_query($con, "SELECT * FROM `form_images` WHERE  `form_id` = '" . $fetch['id'] . "' ORDER BY `id` DESC LIMIT 1");

                if (mysqli_num_rows($select_img) > 0) {
                    $fetch_img =  mysqli_fetch_array($select_img);
                    $img = $fetch_img['images'];
                } else {
                    $img = 'default.png';
                }
                $type = ($fetch['detailType'] == '1' ? "Complete" : "Incomplete");
                $response[$i]['id'] = $fetch['id'];
                $response[$i]['title'] = ($fetch['title'] == "" ? $fetch['ownerName']: $fetch['title']);
                $response[$i]['location'] = ($fetch['location'] == "" ? $fetch['phone'] : $fetch['location']);
                $response[$i]['date'] = $fetch['date'];
                $response[$i]['detailType'] = $type;
                $response[$i]['image'] = $url . 'uploads/house_details/' . $img;

                $i++;
            }
            echo json_encode($response);
        } else {
            echo json_encode(array('status' => "warning", 'msg' => "no data found"));
        }
        break;
    case 'houseDetails':
        $formid = htmlentities(mysqli_real_escape_string($con, $_POST['formid']));
        $response = array();
        $i = 0;
        if (empty($formid)) {
            echo json_encode(array('status' => "warning", 'msg' => "id not found"));
            exit();
        }
        $query = mysqli_query($con, "SELECT * FROM `house_details` WHERE id = '$formid'");
        if (mysqli_num_rows($query) > 0) {
            $fetch = mysqli_fetch_array($query);
            $response[$i]['status'] = 'success';
            $response[$i]['id'] = $fetch['id'];
            $response[$i]['user_id'] = $fetch['user_id'];
            $response[$i]['detailType'] = $fetch['detailType'];
            $response[$i]['ownerName'] = $fetch['ownerName'];
            $response[$i]['phone'] = $fetch['phone'];
            $response[$i]['date'] = $fetch['date'];
            $response[$i]['title'] = $fetch['title'];
            $response[$i]['location'] = $fetch['location'];
            $response[$i]['bedrooms'] = $fetch['bedrooms'] == ''? '--': $fetch['bedrooms'];
            $response[$i]['bathrooms'] =  $fetch['bathrooms'] == ''? '--': $fetch['bathrooms'] ;
            $response[$i]['areaSize'] =  $fetch['areaSize'] == ''? '--': $fetch['areaSize'] ;
            $response[$i]['stories'] = $fetch['stories'] == ''? '--': $fetch['stories'];
            $response[$i]['propertyUnit'] = $fetch['propertyUnit'] == ''? '--': $fetch['propertyUnit'] ;
            $response[$i]['assiteNewHome'] = $fetch['assiteNewHome'] == ''? '--': $fetch['assiteNewHome'];
            $response[$i]['backedTaxowed'] =  $fetch['backedTaxowed'] == ''? '--': $fetch['backedTaxowed'];
            $response[$i]['basement'] = $fetch['basement'] == ''? '--': $fetch['basement'];
            $response[$i]['dryer'] = $fetch['dryer'] == ''? '--': $fetch['dryer']; 
            $response[$i]['existingMorgage'] = $fetch['existingMorgage'] == ''? '--': $fetch['existingMorgage'];
            $response[$i]['foundation'] = $fetch['foundation'] == ''? '--': $fetch['foundation']; 
            $response[$i]['gasUtilityavail'] = $fetch['gasUtilityavail'] == ''? '--': $fetch['gasUtilityavail']; 
            $response[$i]['helpmorgage'] = $fetch['helpmorgage'] == ''? '--': $fetch['helpmorgage']; 
            $response[$i]['isProp'] = $fetch['isProp'] == ''? '--': $fetch['isProp']; 
            $response[$i]['lockbox'] = $fetch['lockbox'] == ''? '--': $fetch['lockbox']; 
            $response[$i]['lop'] =  $fetch['lop'] == ''? '--': $fetch['lop']; 
            $response[$i]['newHome'] = $fetch['newHome'] == ''? '--': $fetch['newHome']; 
            $response[$i]['owfinance'] = $fetch['owfinance'] == ''? '--': $fetch['owfinance'];
            $response[$i]['userRange'] = $fetch['userRange'] == ''? '--': $fetch['userRange']; 
            $response[$i]['sewer'] = $fetch['sewer'] == ''? '--': $fetch['sewer'];
            $response[$i]['survery'] = $fetch['survery'] == ''? '--': $fetch['survery']; 
            $response[$i]['washer'] = $fetch['washer'] == ''? '--': $fetch['washer']; 
            $response[$i]['waterOn'] = $fetch['waterOn'] == ''? '--': $fetch['waterOn'];
            $response[$i]['lopExplain'] = $fetch['lopExplain'] == ''? '--': $fetch['lopExplain'];
            $response[$i]['survery'] = $fetch['lockboxPlace'] == ''? '--': $fetch['lockboxPlace'];
            $response[$i]['payMethod'] = $fetch['payMethod'] == ''? '--': $fetch['payMethod'];
            $response[$i]['rating'] = $fetch['rating'] == ''? '--': $fetch['rating'];
            $response[$i]['taxAmount'] = $fetch['taxAmount'] == ''? '--': $fetch['taxAmount'];
            $response[$i]['timeFrame'] = $fetch['timeFrame'] == ''? '--': $fetch['timeFrame'];
            $response[$i]['squarefootage'] = $fetch['squarefootage'] == ''? '--': $fetch['squarefootage'];
            $response[$i]['fastcash'] = $fetch['fastcash'] == ''? '--': $fetch['fastcash'];
            echo json_encode($response);
        } else {
            echo json_encode(array('status' => "warning", 'msg' => "no data found"));
        }

    break;
    case'propgallery':
       
        if (empty($_POST['formid'])) {
            echo json_encode(array('status' => "warning", 'msg' => "id not found"));
            exit();
        }
        
        $formid = htmlentities(mysqli_real_escape_string($con, $_POST['formid'])); 
        $response=array();
        $i = 0;
        
        $query = mysqli_query($con, "SELECT * FROM `form_images` WHERE form_id = '$formid'");
        if (mysqli_num_rows($query) > 0) {
            
            while($fetch = mysqli_fetch_array($query)){ 
                $response[$i]['imageId'] = $fetch['id'];
                $response[$i]['gallery'] = $url.'uploads/house_details/'.$fetch['images'];
                $i++;
            }
          echo json_encode($response);
        }else{
            echo json_encode(array('status' => "warning", 'msg' => "no data found"));
        }
    break;    
    case 'update':
        
        $id =  htmlentities(mysqli_real_escape_string($con, $_POST['id']));
        $column =  htmlentities(mysqli_real_escape_string($con, $_POST['column']));
        $value =  htmlentities(mysqli_real_escape_string($con, $_POST['value'])); 
        $table =  htmlentities(mysqli_real_escape_string($con, $_POST['table'])); 
    
        if(isset($id) && isset($column) && isset($value) && isset($table)){
            
            $update = mysqli_query($con, "UPDATE `$table` SET `$column` = '$value' WHERE `id` = '$id'");
            if ($update) {
                echo json_encode(array('status' => "success", 'msg' => "Successfully Updated"));
            } else {
               echo json_encode(array('status' => "warning", 'msg' => "Failed to Updated"));
            }
        
        }else{
            echo json_encode(array('status' => "warning", 'msg' => "Parameters Error"));
        }

        break;
    case 'login':
        if (isset($_POST['token'])) {
            if ($_POST['token'] != "C8xWxGvIue37SwP2MEU7W5oKE32fm7Z3JxHfeK897a8eE0SdLl") {

                exit();
            }
            $files = array();
            $email = $_REQUEST['email'];
            $password = md5(htmlspecialchars($_REQUEST['password']));
            $select = mysqli_query($con, "SELECT * from `users` where `email` = '$email' and `password` = '$password'");
            $user = array();
            if (mysqli_num_rows($select) > 0) {
                $fetch = mysqli_fetch_array($select);
                if ($fetch['role_id'] == 2) {
                    $role = "admin";
                } else if ($fetch['role_id'] == 3) {
                    $role = "user";
                }
                if($fetch['profile'] == ''){
                    $pofile = "user.png";
                }else{
                    $pofile =$fetch['profile'];
                }
                
                $files = array(
                    'status' => "success",
                    'msg' => "Successfully Login",
                    "user" => array(
                        'id' => $fetch['id'],
                        'name' => $fetch['name'],
                        'email' => $fetch['email'],
                        'phone' => $fetch['phone'],
                        'phone_verified' => $fetch['phone_verified'],
                        'profile' => $url . 'uploads/users/' .$pofile,
                        'role' => $role,
                    )
                );
                echo json_encode($files);
            } else {
                echo json_encode(array(
                    'status' => "warning",
                    'msg' => "Your Username Or Password Wrong"
                ));
            }
        } else {
            echo json_encode(array(
                'status' => "warning",
                'msg' => "Security Token Not Found"
            ));
        }
        break;

   case 'fetchusers':
       
            $limit = htmlspecialchars($_POST['limit']);
            $select = mysqli_query($con,"SELECT * FROM `users` WHERE role_id != '1' LIMIT $limit,10");
            $i = 0;
            if(mysqli_num_rows($select) >0 ){
                while($row = mysqli_fetch_array($select)){
                    if($row['profile'] == ''){
                        $pofile = "user.png";
                    }else{
                        $pofile =$row['profile'];
                    }
                
                    $response[$i]['id'] = $row['id'];
                    $response[$i]['name'] = $row['name'];
                    $response[$i]['email'] = $row['email'];
                    $response[$i]['phone'] = $row['phone'];
                    $response[$i]['profile'] = $url.'uploads/users/'.$pofile;
                    
                    $i++;
                }
                
                echo json_encode($response);
            }else{
                 echo json_encode(array('status'=>"warning",'msg'=>"Data not found"));
            }
        break;
         case 'delete':
        
        $id =  htmlentities(mysqli_real_escape_string($con, $_POST['id'])); 
        $column =  htmlentities(mysqli_real_escape_string($con, $_POST['column'])); 
        $table =  htmlentities(mysqli_real_escape_string($con, $_POST['table']));
    
        if(isset($id) && isset($column)  && isset($table)){
            
            $update = mysqli_query($con, "DELETE FROM `$table` WHERE `$column` = '$id'");
            if ($update) {
                echo json_encode(array('status' => "success", 'msg' => "Successfully Delete"));
            } else {
               echo json_encode(array('status' => "warning", 'msg' => "Failed to Delete"));
            }
        
        }else{
            echo json_encode(array('status' => "warning", 'msg' => "Parameters Error"));
        }

        break;
    case 'signup':
        $name = htmlspecialchars($_POST['name']);
        $phone = htmlspecialchars($_POST['phone']);
        $email = htmlspecialchars($_POST['email']);
        $profile = 'default.png';
        $pswd = htmlspecialchars(md5($_POST['password']));
        if ($phone != "" && $name != "" && $email != "" && $pswd != "") {

            $check_email = mysqli_query($con, "SELECT * FROM `users` where `email` = '$email'");
            if (mysqli_num_rows($check_email) > 0) {
                echo json_encode(array(
                    "status" => "warning",
                    "res" => "Email Alrady Exist, please login"
                ));
                exit();
            } else {
                $insert = mysqli_query($con, "INSERT INTO `users`(`name`, `phone`,`profile`, `email`, `password`,`role_id`,`status`) VALUES ('$name','$phone','$profile','$email','$pswd','3','1')");
              if ($insert) {
                // echo json_encode(array("status" => "success", "res" => "Sucessfully Signup"));
                 $select = mysqli_query($con, "SELECT * from `users` where `email` = '$email'");
            $user = array();
            if (mysqli_num_rows($select) > 0) {
                $fetch = mysqli_fetch_array($select);
                if ($fetch['role_id'] == 2) {
                    $role = "admin";
                } else if ($fetch['role_id'] == 3) {
                    $role = "user";
                }
                if($fetch['profile'] == ''){
                    $pofile = "user.png";
                }else{
                    $pofile =$fetch['profile'];
                }
                
                $files = array(
                    'status' => "success",
                    'msg' => "Successfully Signup",
                    "user" => array(
                        'id' => $fetch['id'],
                        'name' => $fetch['name'],
                        'email' => $fetch['email'],
                        'phone' => $fetch['phone'],
                        'phone_verified' => $fetch['phone_verified'],
                        'profile' => $url . 'uploads/users/' .$pofile,
                        'role' => $role,
                    )
                );
                echo json_encode($files);
            } else {
                echo json_encode(array(
                    'status' => "warning",
                    'msg' => "Your Username Or Password Wrong"
                ));
            }
            } else {
                echo json_encode(array("status" => "warning", "msg" => "Something Wrong On Database"));
            }
            }
        
        } else {
            echo json_encode(array(
                "status" => "success",
                "msg" => "Please Fill All Signup Fields"
            ));
        }
        break;
    
        case 'forgot':
     
            $files = array();
            $user_email = $_POST['email'];
            if ($user_email == "") {
            $files = array(
                'status' => "error",
                'msg' => "Email is Required"
            );
            echo json_encode($files);
            exit();
        }
            $check_email = mysqli_query($con, "SELECT * FROM users where email='$user_email' and status=1");
            $fetch = mysqli_fetch_array($check_email);
            $emailuser = $fetch['email'];
            $name = $fetch['name'];
            $userid = $fetch['id'];
            $phone = $fetch['phone'];
            $userid_enc = base64_encode($fetch['id']);
            $rand = random_int(100000, 999999);
            $logo = $url.'uploads/setting/'.$settinginfo['website_logo'];
            $update = mysqli_query($con, "UPDATE `users` SET `code`='$rand' WHERE id='$userid'");
            if (mysqli_num_rows($check_email) > 0) {
            ob_start();
            ?>
<!doctype html>
<html>

<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Forgot Password</title>
    <style>
    .text-center {
        text-align: center !important;
    }

    .text-white {
        color: white !important;
    }

    .text-theme {
        color: #B48717 !important;
    }

    .bg-dark {
        background-color: #262626 !important;
    }

    .bg-theme {
        background-color: #B48717 !important;
    }

    .bg-white {
        background-color: white !important;
    }

    .w-100 {
        width: 100% !important;
    }

    .p-0 {
        padding: 0 !important;
    }

    .m-0 {
        margin: 0 !important;
    }

    .code-box {
        padding: 0px 15px;
        letter-spacing: 10px;
        margin: 20px auto;
        font-family: sans-serif;
        font-weight: bold;
        font-size: 30px;
        border-radius: 10px;
        border: 2px solid #ffbf00;
        width: fit-content;
        color: #ffbf00;
        background-color: white;
        text-align: center;
    }

    .footer {
        background-color: #B48717;
        text-align: center;
        font-size: 15px;
        padding: 10px;
        color: #fff !important;
    }

    .footer a {
        color: #fff !important;
    }

    .main-box {
        max-width: 600px;
        margin: 0 auto;
        border-radius: 10px;
        overflow: hidden;
    }

    .header {
        background-color: #000;
        border-bottom: solid #939292 1px;
        margin-bottom: 10px;
        align-items: center;
        display: flex;
    }

    .header a {
        width: 30%;
        padding: 0px 10px;

    }

    .header img {
        width: 100%;
        margin: 5px 0;

    }

    .header h4 {
        width: 70%;
        color: #fff;
        font-size: 20px;
        margin: auto 0;
    }
    </style>
</head>

<body class="p-0 m-0 w-100">
    <div class="bg-dark w-100 main-box">
        <div class="header" style="align-items: center;">
            <a href="https://lunaenterprises.info/"><img src="<?=$logo?>"></a>
            <h4>Reset Your Password</h4>
        </div>
        <h1 class="text-center text-white m-0">
            Hi <?=$name?>
        </h1>
        <a class="text-center text-white m-0" href="javascript:void(0)"
            style="color:#fff !important;display:block"><?=$emailuser?></a>
        <div class="code-box" style="background-color:#fff !important;">
            <?=$rand?>
        </div>
        <div class="footer">
            Regards <a href="https://lunaenterprises.info/">https://lunaenterprises.info/</a>
        </div>
    </div>

</body>

</html>
<?php
            $html = ob_get_contents();
            ob_end_clean();
            $message = $html;
            $subject = "Forgot Password";
            $headers  = 'MIME-Version: 1.0' . "\r\n";
            $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
            // Create email headers
            $headers .= 'From:'.CONNECT_EMAIL_CLIENT."\r\n" .
                'Reply-To:'.CONNECT_EMAIL_CLIENT."\r\n" .
                'X-Mailer: PHP/' . phpversion();
            $to = $emailuser;
            if(mail($to, $subject, $message, $headers)) {
                $files = array('status' => "success",'msg' => "Email Successfully Sent Check your Mail and change the password",'code' => "$rand",'uid'=>"$userid",'phone'=>"$phone");
            } else {
                $files = array('status' => "error",'msg' => "There is something error on Application please contact to admin");
            }
            }else {
            $files["data"] = array(
                'status' => "error",
                'msg' => "This email not found please contact the support"
            );
        }
            echo json_encode($files);
        break;
        case 'changePassword':
            $email = htmlspecialchars($_POST['email']);
            $newpswd = htmlspecialchars(md5($_POST['newpswd']));
             $update = mysqli_query($con, "UPDATE `users` SET `password`='$newpswd' WHERE  email='$email'");
            if($update){
            echo json_encode(array(
                            "status" => "success",
                            'msg' => "Password Reset Successfully"
                        ));
            }else{
            echo json_encode(array(
                            "status" => "warning",
                            'msg' => "Failed to Reset the password"
                        ));
            }
            break;
    case 'deleteAccount':
        $userId = $_POST['id'];
        $HouseDetails = mysqli_query($con,"SELECT * FROM `house_details` WHERE `user_id` = '$userId'");
        if(mysqli_num_rows($HouseDetails)>0){
        $fetchHouseDetails = mysqli_fetch_array($HouseDetails);
        $formid = $fetchHouseDetails['id'];
         
        // Delete User Property data in "house_details" table
        $delete = mysqli_query($con, "DELETE FROM `house_details` WHERE `id` = '$formid'");
        if ($delete) {
            $select = mysqli_query($con, "SELECT * FROM `form_images` where `form_id` = '$formid'");
            if (mysqli_num_rows($select) > 0) {
                while($fetch_check = mysqli_fetch_array($select))
                {
                $scan_pix = $fetch_check['images'];
                $file_path = "../uploads/house_details/";
                $pix_handle = opendir($file_path);
                while ($pix_file = readdir($pix_handle)) {
                    if ($pix_file == $scan_pix) {
                        unlink($file_path . "/" . $pix_file);
                    }
                }
                closedir($pix_handle);
                }
                $delete = mysqli_query($con, "DELETE FROM `form_images` WHERE `form_id` = '$formid'"); 
            }
            
        }
        }
        
        //  Inset User details in "deletedAccounts" Table 
        $user = mysqli_query($con,"SELECT * FROM `users` WHERE `id` = '$userId'");
       
        $fetchUser = mysqli_fetch_array($user);
        $uemail = $fetchUser['email'];
        $name = $fetchUser['name'];
        $upassword = $fetchUser['password'];
        $insert = mysqli_query($con,"INSERT INTO `deletedAccounts`(`user_id`, `name`,`email`, `password`) VALUES ('$userId','$name','$uemail','$upassword')");
       
        // Delete User data in "users" table
        $delete = mysqli_query($con,"DELETE FROM `users` WHERE `id` = '$userId'");
        if($delete){
           echo json_encode(array(
                "status" => "success",
                'msg' => "Account Delete Successfully"
            ));
        } else {
            
            echo json_encode(array(
                "status" => "warning",
                'msg' => "Something Error on Database"
            ));
        }
    break;
    case 'profile':
        if (isset($_POST['token'])) {
            if ($_POST['token'] != "C8xWxGvIue37SwP2MEU7W5oKE32fm7Z3JxHfeK897a8eE0SdLl") {

                exit();
            }
            $id = htmlspecialchars($_POST['userid']);
            $name = htmlspecialchars($_POST['name']);
            $email = htmlspecialchars($_POST['email']);
            $phone = htmlspecialchars($_POST['phone']);

            $check_email = mysqli_query($con, "SELECT * FROM `users` WHERE `email` = '$email' AND `id` != '$id'");
            if (mysqli_num_rows($check_email) > 0) {
                echo json_encode(array("status" => "warning", 'msg' => "Email Already Exist"));
                exit();
            } else {
                if (isset($_FILES["profile"])) {
                    $image = date('dmYHis') . str_replace(" ", "", basename($_FILES["profile"]["name"]));
                    $picture_type = str_replace("", "", basename($_FILES["profile"]["type"]));
                    $path_picture = "../uploads/users/" . $image;
                    $selectUser = mysqli_query($con, "SELECT * FROM users where id='$id'");
                    $fetch_check = mysqli_fetch_array($selectUser);
                    if ($picture_type != "") {
                        $path_pix = "../uploads/users/" . $image;
                        $scan_pix = $fetch_check['profile'];
                        $file_path = "../uploads/users/";
                        $pix_handle = opendir($file_path);
                        while ($pix_file = readdir($pix_handle)) {
                            if ($pix_file == $scan_pix) {
                                unlink($file_path . "/" . $pix_file);
                            }
                        }
                        closedir($pix_handle);
                        if (!imagecheck($picture_type)) {
                            echo json_encode(array(
                                "status" => "warning",
                                'msg' => "Image File Incorrect"
                            ));
                            exit();
                        }

                        mysqli_query($con, "UPDATE `users` SET `profile`='$image'  where id='$id' ");
                        move_uploaded_file($_FILES["profile"]["tmp_name"], $path_picture);
                    }
                }
                $insert = mysqli_query($con, "UPDATE `users` SET `name`='$name',`email`='$email', `phone` = '$phone'  WHERE  id='$id'");
                if ($insert) {
                    $select_user = mysqli_query($con, "SELECT * FROM `users` WHERE id = '$id'");
                    $fetch_user = mysqli_fetch_array($select_user);
                    $file = array();
                    $user = array();
                    if (mysqli_num_rows($select_user) > 0) {
                        // if ($fetch_user['role_id'] == 1) {
                        //     $role = "admin";
                        // } else if ($fetch_user['role_id'] == 3) {
                        //     $role = "user";
                        // }
                         if ($fetch_user['role_id'] == 2) {
                             $role = "admin";
                        } else if ($fetch_user['role_id'] == 3) {
                            $role = "user";
                        }else{
                            $role = $fetch_user['role_id'];
                        }
                        $files = array(
                            'status' => "success",
                            'msg' => "Successfully Updated",
                            "user" => array(
                                'id' => $fetch_user['id'],
                                'name' => $fetch_user['name'],
                                'phone' => $fetch_user['phone'],
                                'email' => $fetch_user['email'],
                                'role' => $role,
                                'profile' => $url . 'uploads/users/' . $fetch_user['profile'],

                            )
                        );
                        echo json_encode($files);
                    } else {
                        echo json_encode(array(
                            "status" => "warning",
                            'msg' => "User not found in database"
                        ));
                    }
                } else {
                    echo json_encode(array(
                        "status" => "warning",
                        'msg' => "Something Error on Database"
                    ));
                }
            }
        } else {
            echo json_encode(array(
                'status' => "warning",
                'msg' => "Security Token Not Found"
            ));
        }
        break;
     
        // Addmin API
        case 'fetchPropperty':
            if(!isset($_POST['type'])){
                  echo json_encode(array('status'=>"warning",'msg'=>"Type not found"));
                  exit();
            }
            $type = htmlspecialchars($_POST['type']);
            $limit = htmlspecialchars($_POST['limit']);
            $i = 0;
            // Check Property Type
            if($type == "sold"){
                $query = mysqli_query($con , "SELECT house_details.*,users.email as email FROM `house_details` JOIN `users` ON house_details.user_id = users.id WHERE house_details.detailType = '3' ORDER BY `id` DESC LIMIT $limit,10");
            }
            elseif($type == "unsold"){
                $query = mysqli_query($con , "SELECT house_details.*,users.email as email FROM `house_details` JOIN `users` ON house_details.user_id = users.id WHERE house_details.detailType != '3' ORDER BY `id` DESC LIMIT $limit,10");
            }else{
                echo json_encode(array('status'=>"warning",'msg'=>"Wrong Type Error"));
                exit();
            }
            
            // check if query true
            if($query){
                
                // check data
                if(mysqli_num_rows($query)){
                    
                    // fetch data
                    while($fetch = mysqli_fetch_array($query)){
                        // SELECT Image
                        $select_img = mysqli_query($con, "SELECT * FROM `form_images` WHERE  `form_id` = '" . $fetch['id'] . "' ORDER BY `id` DESC LIMIT 1");

                        if (mysqli_num_rows($select_img) > 0) {
                            $fetch_img =  mysqli_fetch_array($select_img);
                            $img = $fetch_img['images'];
                        } else {
                            $img = 'default.png';
                        }
                        $type = ($fetch['detailType'] == '0' ? "incomplete" : ($fetch['detailType'] == '1' ? 'Complete' : 'Sold'));
                        $response[$i]['s_no'] = $i;
                        $response[$i]['id'] = $fetch['id'];
                        $response[$i]['title'] = ($fetch['title'] == "" ? $fetch['ownerName']: $fetch['title']);
                        $response[$i]['location'] = ($fetch['location'] == "" ? $fetch['phone'] : $fetch['location']);
                        $response[$i]['date'] = $fetch['date'];
                        $response[$i]['detailType'] = $type;
                        $response[$i]['phone'] = $fetch['phone'];
                        $response[$i]['email'] = $fetch['email'];
                        $response[$i]['image'] = $url . 'uploads/house_details/' . $img; 
                        $i++;
                    }
                echo json_encode($response);
                
                }else{
                     echo json_encode(array('status'=>"warning",'msg'=>"no more data"));
                }
            }else{
                    echo json_encode(array('status'=>"warning",'msg'=>"Query Error"));
            }
            
            
            
        break;
}




function generateRandomString($length = 160)
{
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}
?>