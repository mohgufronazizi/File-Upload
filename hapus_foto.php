<?

require_once('koneksi.php');

// menegcek dan mendapatkan data session
require_once('session_check.php');

if ($sessionStatus== false) {
	header("Location: index.php");
}

// mendapatkan NIS 
if (isset($_GET['id_barang'])) {
	$idBarang=$_GET['id_barang'];
}
else{
	echo "ID Barang tidak ditemukan! <a href='index.php'>Kembali</a>";
	exit();
}

// Query Get Data Siswa
$query="SELECT * FROM barang WHERE id_barang='$idBarang'";

// eksekusi Query
$result=mysqli_query($mysqli,$query);

// fetching data
foreach ($result as $barang) {
	$fotoLama=$barang['foto'];
}

if (!is_null($fotoLama) && !empty($fotoLama)) {

	$remove=true;
	if (file_exists($fotoLama)) {
		$remove=unlink($fotoLama);
	}
	if ($remove) {
		// menyiapkan Query
		$query="UPDATE barang SET foto = NULL WHERE id_barang='{$idBarang}'";

		// mengeksekusi MySQL Query
		$insert=mysqli_query($mysqli,$query);
	}
}
header("Location: form_edit.php?id_barang={$idBarang}");
?>