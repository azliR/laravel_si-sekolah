<?php

namespace App\Http\Controllers;

use App\Models\Absensi;
use App\Models\Guru;
use App\Models\Jadwal;
use App\Models\Kelas;
use App\Models\Mapel;
use App\Models\Siswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AbsensiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $guru = Guru::where('user_id', Auth::user()->id)->first();
        $jadwal = Jadwal::where('mapel_id', $guru->mapel_id)->get();

        return view('pages.guru.absensi.index', compact('jadwal',));
    }

    public function absensi($id_jadwal, $tanggal)
    {
        $jadwal = Jadwal::find($id_jadwal);
        $siswa = Siswa::where('kelas_id', $jadwal->kelas_id)->get();
        $kelas = Kelas::find($jadwal->kelas_id);
        $absensi = Absensi::where('jadwal_id', $id_jadwal)->where('tanggal', $tanggal)->get();
        $all_absensi = Absensi::where('jadwal_id', $id_jadwal)->get();
        $all_absensi = $all_absensi->unique('tanggal');
        return view('pages.guru.absensi.absensi', compact('siswa', 'kelas', 'jadwal', 'absensi', 'all_absensi', 'tanggal'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();

        // 'id', 'jadwal_id', 'siswa_id', 'keterangan', 'tanggal', 'created_at', 'updated'
        $this->validate($request, [
            'jadwal_id' => 'required',
            'siswa_id' => 'required',
            'keterangan' => 'required',
            'tanggal' => 'required',
        ], [
        ]);

        Absensi::create([
            'kelas_id' => $data['kelas_id'],
            'mapel_id' => $data['mapel_id'],
            'hari' => $data['hari'],
            'dari_jam' => $data['dari_jam'],
            'sampai_jam' => $data['sampai_jam'],
        ]);

        return redirect()->back()->with('success', 'Absensi berhasil dibuat');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        abort(404);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $absensi = Absensi::find($id);
        $mapel = Mapel::orderBy('nama_mapel', 'desc')->get();
        $kelas = Kelas::orderBy('nama_kelas', 'desc')->get();

        $hari = ['senin', 'selasa', 'rabu', 'kamis', 'jumat'];

        return view('pages.admin.absensi.edit', compact('absensi', 'mapel', 'kelas', 'hari'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = $request->all();

        $absensi = Absensi::findOrFail($id);
        $absensi->update($data);

        return redirect()->route('absensi.index')->with('success', 'Absensi berhasil diperbaharui');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $absensi = Absensi::find($id);
        $absensi->delete();

        return redirect()->back()->with('success', 'Absensi berhasil dihapus');
    }
}
