<?php
    require_once('functions.php');

    include('templates/data.php');

    $page_content = include_template('index.php',[
        'items' => $items, 
        'categories' => $categories
    ]);
    $layout_content = include_template('layout.php', [
        'content'    => $page_content,
        'categories' => $categories,
        'title'      => 'YetiCave - Главная страница'
    ]);
?>