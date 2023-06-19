<?php

use App\Http\Controllers\AbsensiController;
use App\Http\Controllers\GuruController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\JadwalController;
use App\Http\Controllers\JurusanController;
use App\Http\Controllers\KelasController;
use App\Http\Controllers\MapelController;
use App\Http\Controllers\MateriController;
use App\Http\Controllers\SiswaController;
use App\Http\Controllers\TugasController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    // check role and redirect

    if (Auth::check()) {
        if (Auth::user()->roles == 'admin') {
            return redirect()->route('admin.dashboard');
        } elseif (Auth::user()->roles == 'guru') {
            return redirect()->route('guru.dashboard');
        } elseif (Auth::user()->roles == 'siswa') {
            return redirect()->route('siswa.dashboard');
        }
    }
})->middleware('auth');

Auth::routes();


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::group(['middleware' => 'auth'], function () {
    Route::get('/profile', [UserController::class, 'edit'])->name('profile');
    Route::put('/update-profile', [UserController::class, 'update'])->name('update.profile');
    Route::get('/edit-password', [UserController::class, 'editPassword'])->name('ubah-password');
    Route::patch('/update-password', [UserController::class, 'updatePassword'])->name('update-password');
});

Route::group(['middleware' => ['auth', 'checkRole:guru']], function () {
    Route::get('/guru/dashboard', [HomeController::class, 'guru'])->name('guru.dashboard');
    Route::resource('absensi', AbsensiController::class);
    Route::get('/absensi/jadwal/{id_jadwal}/{tanggal}', [AbsensiController::class, 'absensi'])->name('absensi.absensi');
    Route::resource('materi', MateriController::class);
    Route::resource('tugas', TugasController::class);
    Route::get('/jawaban-download/{id}', [TugasController::class, 'downloadJawaban'])->name('guru.jawaban.download');
});
Route::group(['middleware' => ['auth', 'checkRole:siswa']], function () {
    Route::get('/siswa/dashboard', [HomeController::class, 'siswa'])->name('siswa.dashboard');
    Route::get('/siswa/materi', [MateriController::class, 'siswa'])->name('siswa.materi');
    Route::get('/materi-download/{id}', [MateriController::class, 'download'])->name('siswa.materi.download');
    Route::get('/siswa/tugas', [TugasController::class, 'siswa'])->name('siswa.tugas');
    Route::get('/tugas-download/{id}', [TugasController::class, 'download'])->name('siswa.tugas.download');
    Route::post('/kirim-jawaban', [TugasController::class, 'kirimJawaban'])->name('kirim-jawaban');
});
Route::group(['middleware' => ['auth', 'checkRole:admin']], function () {
    Route::get('/admin/dashboard', [HomeController::class, 'admin'])->name('admin.dashboard');
    Route::resource('jurusan', JurusanController::class);
    Route::resource('mapel', MapelController::class);
    Route::resource('guru', GuruController::class);
    Route::resource('kelas', KelasController::class);
    Route::resource('siswa', SiswaController::class);
    Route::resource('user', UserController::class);
    Route::resource('jadwal', JadwalController::class);
});
