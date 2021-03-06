<?php
    require_once('boot.php');

    $page_content = include_template('index.php',[
        'items' => $items, 
        'categories' => $categories,
        'deadline' => $deadline
    ]);
    $layout_content = include_template('layout.php', [
        'content'    => $page_content,
        'categories' => $categories,
        'title'      => 'YetiCave - Главная страница'
    ]);

    print($layout_content); 
?>
