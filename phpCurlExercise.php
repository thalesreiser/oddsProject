<?php

    $url = "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml?5105e8233f9433cf70ac379d6ccc5775";
  
    function get_data($url) {
        $ch = curl_init();
        $timeout = 5;
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
        $data = curl_exec($ch);
        curl_close($ch);
        return $data;
    }

    $str=get_data($url);
    $straux=str_replace('<Cube', '', $str);
    $strout=strip_tags($straux);
    $li=explode('>', $strout);

    array_shift($li);
    array_shift($li);
  
    $imp=implode($li);
    echo $imp;
    $exp=explode(" ",$imp);
    print_r($exp);

    $odd[]=null;
    $even[]=null;

    foreach ($exp as $k => $v) {
        if ($k % 2 == 0) {
            $even[] = $v;
        }
        else {
            $odd[] = $v;
        }
    }

    $columns=['currency', 'rate'];
    $row=[$odd, $even];
    
    $arr=array_combine($columns, $row);
    print_r($arr);
    $fp = fopen('file.csv', 'w');

    foreach ($arr as $fields) {
        fputcsv($fp, $fields);
    }
    fclose($fp);
?>