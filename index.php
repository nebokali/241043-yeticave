<?php
    require_once('boot.php');

    $connect = mysqli_connect('localhost', 'root', '', 'yeticave');
    mysqli_set_charset($connect, "utf8");
    if ($connect == false) {
        print("Ошибка подключения: " . mysqli_connect_error());
    }
    else {
        $sql = 'SELECT * FROM category';
        $result = mysqli_query($connect, $sql);
        if ($result) {
            $categories = mysqli_fetch_all($result, MYSQLI_ASSOC);
        }

        $sql = 'SELECT lot_name, start_price, img_url, creation_date, c.category_name FROM lot l
                JOIN category c
                    ON l.category_id = c.id
                WHERE date_close > NOW()  ORDER BY creation_date DESC;';
        if ($res = mysqli_query($connect, $sql)) {
            $lots = mysqli_fetch_all($res, MYSQLI_ASSOC);
            $content = include_template('index.php', [
                'lots' => $lots,
                'categories' => $categories,
                'deadline' => $deadline
            ]);
        }
    }

    $layout_content = include_template('layout.php', [
        'content'    => $page_content,
        'categories' => $categories,
        'title'      => 'YetiCave - Главная страница',
        'user_name' => $user_name,
        'categories' => $categories
    ]);

    print($layout_content); 
?>
