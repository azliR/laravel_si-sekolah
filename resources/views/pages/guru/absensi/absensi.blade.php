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
                                <label for="kelas_id">Lihat absensi sebelumnya</label>
                                <select id="kelas_id" name="kelas_id"
                                        class="select2 form-control @error('kelas_id') is-invalid @enderror">
                                    <option value="">-- Pilih tanggal --</option>
                                    @foreach ($all_absensi as $data )
                                        <option value="{{ $data->id }}">{{ $data->tanggal }}</option>
                                    @endforeach
                                </select>
                            </div>
                            @if($tanggal == date("dmY"))
                                <div class="form-group">
                                    <label for="tanggal">Tanggal</label>
                                    <input class="form-control" type="date" name="tanggal" id="tanggal"/>
                                </div>
                            @endif
                            <form action="{{ route('absensi.store',$jadwal->id, $tanggal) }}"
                                  method="POST">
                                <button type="submit" class="btn btn-primary"><i class="nav-icon fas fa-save"></i>&nbsp;
                                    Simpan absensi
                                </button>
                                <input type="hidden" name="jadwal_id" value="{{ $jadwal->id }}">
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
                                            <input type="hidden" name="{{$data->id}}_siswa" value="{{ $data }}">
                                            <tr>
                                                <td>{{ $loop->iteration }}</td>
                                                <td>{{ $data->nama }}</td>
                                                <td>{{ $data->nis }}</td>
                                                <td>{{ $data->kelas->nama_kelas }}</td>
                                                <td>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio"
                                                               name="{{$data->id}}_keterangan"
                                                               id="{{$data->id}}_hadir"
                                                               value="hadir" {{ count($absensi->where('id', $data->id))==0 ? "" : "checked" }}>
                                                        <label class="form-check-label" for="{{$data->id}}_hadir">
                                                            Hadir
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio"
                                                               name="{{$data->id}}_keterangan"
                                                               id="{{$data->id}}_izin" value="izin">
                                                        <label class="form-check-label" for="{{$data->id}}_izin">
                                                            Izin
                                                        </label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio"
                                                               name="{{$data->id}}_keterangan"
                                                               id="{{$data->id}}_alfa" value="alfa">
                                                        <label class="form-check-label" for="{{$data->id}}_alfa">
                                                            Alfa
                                                        </label>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('script')
    <script>
        document.getElementById('tanggal').valueAsDate = new Date();
    </script>
@endpush
