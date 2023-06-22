<?php

namespace App\Http\Controllers;

use App\Models\Guru;
use App\Models\Jadwal;
use App\Models\Kelas;
use App\Models\Mapel;
use App\Models\Siswa;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function admin()
    {
        $siswa = Siswa::count();
        $guru = Guru::count();
        $kelas = Kelas::count();
        $mapel = Mapel::count();
        $siswaBaru = Siswa::orderByDesc('id')->take(5)->orderBy('id')->first();

        return view('pages.admin.dashboard', compact('siswa', 'guru', 'kelas', 'mapel', 'siswaBaru'));
    }

    public function guru()
    {
        $guru = Guru::where('user_id', Auth::user()->id)->first();
        $jadwal = Jadwal::where('mapel_id', $guru->mapel_id)->get();
        $kelas_wali = Kelas::where('guru_id', $guru->id)->first();
        $hari = Carbon::now()->locale('id')->isoFormat('dddd');
        $hari = strtolower($hari);

        return view('pages.guru.dashboard', compact('guru', 'jadwal', 'hari', 'kelas_wali'));
    }

    public function siswa()
    {
        $siswa = Siswa::where('nis', Auth::user()->nis)->first();
        $kelas = Kelas::findOrFail($siswa->kelas_id);
        $jadwal = Jadwal::where('kelas_id', $kelas->id)->get();
        $hari = Carbon::now()->locale('id')->isoFormat('dddd');
        return view('pages.siswa.dashboard', compact('siswa', 'kelas', 'jadwal', 'hari'));
    }
}
