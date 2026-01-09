<?php

/** @var \Laravel\Lumen\Routing\Router $router */

// Cek apakah server hidup (Akses: http://localhost:8000)
$router->get('/', function () use ($router) {
    return "Server Lumen Berjalan! Versi: " . $router->app->version();
});

// GROUP API (Semua yang ada di sini otomatis berawalan /api)
$router->group(['prefix' => 'api'], function () use ($router) {
    
    // === AUTH ===
    $router->post('/register', 'AuthController@register');
    $router->post('/login', 'AuthController@login');

    // === PENGADUAN (CRUD) ===
    $router->get('/pengaduan', 'PengaduanController@index');
    $router->post('/pengaduan', 'PengaduanController@store');
    $router->get('/pengaduan/{id}', 'PengaduanController@show');
    $router->put('/pengaduan/{id}', 'PengaduanController@update');
    $router->delete('/pengaduan/{id}', 'PengaduanController@destroy');

// Route untuk Tanggapan
    $router->get('/tanggapan', 'TanggapanController@index'); // Ambil semua tanggapan
    $router->post('/tanggapan', 'TanggapanController@store'); // Kirim tanggapan baru
    $router->get('/tanggapan/pengaduan/{id}', 'TanggapanController@showByPengaduan'); // Lihat tanggapan per laporan

// Route untuk Log Status
    $router->get('/log-status', 'LogStatusController@index');
    $router->get('/log-status/pengaduan/{id}', 'LogStatusController@showByPengaduan');
    $router->post('/log-status', 'LogStatusController@store');

    // === PETUGAS (CRUD) ===
    // Pastikan baris ini ada! Inilah yang dicari browser Anda tadi.
    $router->get('/petugas', 'PetugasController@index');
    $router->post('/petugas', 'PetugasController@store');
    $router->put('/petugas/{id}', 'PetugasController@update');
    $router->delete('/petugas/{id}', 'PetugasController@destroy');

    // === KATEGORI (CRUD) ===
    $router->get('/kategori', 'KategoriController@index');
    $router->post('/kategori', 'KategoriController@store');
    $router->put('/kategori/{id}', 'KategoriController@update');
    $router->delete('/kategori/{id}', 'KategoriController@destroy');

    // === USERS (READ ONLY) ===
    $router->get('/users', 'UserController@index');
    $router->post('/users', 'UserController@store');
});