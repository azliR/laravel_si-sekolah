@extends('layouts.main')
@section('title', 'List Siswa')

@section('content')
    <section class="section custom-section">
        <div class="section-body">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between">
                            <h4>Absensi mapel {{ $jadwal->mapel->nama_mapel }} kelas {{ $kelas->nama_kelas }} pada
                                hari {{ $jadwal->hari }}</h4>
                        </div>
                        <div class="card-body">
                            @if ($message = Session::get('success'))
                                <div class="alert alert-success alert-dismissible show fade">
                                    <div class="alert-body">
                                        <button class="close" data-dismiss="alert">
                                            <span>&times;</span>
                                        </button>
                                        {{ $message }}
                                    </div>
                                </div>
                            @endif
                            <div class="form-group">
                                <label for="sampai_jam">Tanggal</label>
                                <input class="form-control" type="text" name="sampai_jam" id="time2"
                                       @error('sampai_jam') is-invalid @enderror"
                                placeholder="{{ __('Nama Jurusan') }}" value="{{ $jadwal->sampai_jam ?? '' }}" />
                            </div>
                            <button class="btn btn-primary">
                                <i class="nav-icon fas fa-save"></i>&nbsp; Simpan Absensi
                            </button>
                            <br><br>
                            <div class="table-responsive">
                                <table class="table table-striped" id="table-2">
                                    <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Nama Siswa</th>
                                        <th>NIS</th>
                                        <th>Kelas</th>
                                        <th>Aksi</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach ($siswa as $result => $data)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $data->nama }}</td>
                                            <td>{{ $data->nis }}</td>
                                            <td>{{ $data->kelas->nama_kelas }}</td>
                                            <td>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="keterangan"
                                                           id="hadir" value="hadir">
                                                    <label class="form-check-label" for="hadir">
                                                        Hadir
                                                    </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="keterangan"
                                                           id="izin" value="izin">
                                                    <label class="form-check-label" for="izin">
                                                        Izin
                                                    </label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="keterangan"
                                                           id="alfa" value="alfa">
                                                    <label class="form-check-label" for="alfa">
                                                        Alfa
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('script')
    <script>
        $('#time1').datepicker({
            format: 'dd-mm-yyyy',
        });

    </script>
@endpush
