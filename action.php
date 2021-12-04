<?

require_once('koneksi.php');

// status tidak error
$error=0;

// Memvalidasi inputan
if (isset($_POST['idBarang'])) {
	$idBarang=$_POST['idBarang'];
}
else {$error=1;} //status error

if (isset($_POST['namaBarang'])) {
	$namaBarang=$_POST['namaBarang'];
}
else {$error=1;} //status error

if (isset($_POST['harga'])) {
	$harga=$_POST['harga'];
}
else {$error=1;} //status error

// mnegatasi jika terdapat error pada input

if ($error==1) {
	echo "Terjadi kesalahan pada proses input data";
	exit();
}

// mengambil data file upload
$files=$_FILES['foto'];
$path="upload/";


// menangani file upload
// name disini nama dari file nya, bukan dari input name
// tmp_name adalah nama sementara
if (!empty($files['name'])) {
	$filepath=$path.$files['name'];
	$upload=move_uploaded_file($files['tmp_name'], $filepath);
}
else{
	$filepath="";
	$upload= false;
}

// menangani error saat mengupload
if ($upload = false ) {
	$siswa['foto']='upload/default.jpg';
}

// Menyiapkan Query MySQL untuk dieksekusi
$query="INSERT INTO barang(id_barang,nama_barang,harga,foto) VALUES ('{$idBarang}','{$namaBarang}','{$harga}','{$filepath}') ";

// mengeksekusi MySQL Query
$insert=mysqli_query($mysqli, $query);

// menangani ketika error pada saat eksekusi query
if ($insert == false) {
	echo "Error dalam menambah data.<a href='index.php'>Kembali</a>";
}
else{
	header("Location: index.php");
}

?>