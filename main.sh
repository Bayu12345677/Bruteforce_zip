#!/bin/bash

# author : Bayu riski A.M (speedrun)
# tools  : bruteforce zip
# language : Bash

# bash moderen
. lib/moduler.sh

# depencies
Bash.import: util/IO.FUNC util/io.class
Bash.import: util/IO.SYSTEM.var util/IO.TYPE
Bash.import: util/pipe util/tryCatch

# cek paket yg belum di install
var::array: depen = { "figlet" "toilet" "curl" "ncurses-utils" "unzip" }

# cek
	for donload in "${depen[@]}"; do
		try {
			command -v "$donload" &> /dev/null
		} catch {
			try {
				apt install "${donload}"
			} catch {
				println_info " gagal menginstall ($donload) tolong cek internet anda"; exit 34
			};
		};
	done

Namespace: main.sh
{
     # warna
       bi=$(mode.bold: biru)    cy=$(mode.bold: cyan)
         ij=$(mode.bold: hijau)  hi=$(mode.normal: hitam)
           me=$(mode.bold: merah)  un=$(mode.bold: ungu)
             ku=$(mode.bold: kuning) pu=$(mode.bold: putih)
               m=$(mode.bold: pink)    st=$(default.color)
               
        # fungsi bobol       
		def: brute_zip(){
			var jumlah : $(cat $2 | wc -l)
			var urutkan : 0

			while ((urutkan<=jumlah)); do
				let urutkan++
				burute=$(cat $2 | tail +$urutkan | head -1)
				Tulis.strN "${ku}[${pu}$(date +%H:%M:%S)${ku}]${me} [${ij}INFO${me}]${pu} mencoba ${me}-${ij}>${pu} $burute${st}"
				if (unzip -P "$burute" "$1" &> /dev/null); then
					Tulis.strN "${ku}[${pu}$(date +%H:%M:%S)${ku}]${st} ${ku}[${ij}INFO${ku}]${me}-${ij}>${ku} [${pu}files${me}:${pu}$1${ku}] [${pu}pass${me}:${pu}$burute${ku}]${un} (${ku}hasil${me}:${ij}berhasil${un})${st}\n"
					println_info " zip berhasil di bobol"
					println_info " silakan ketik ls untul melihat\n"
					exit 0
				else
					Tulis.strN "${ku}[${pu}$(date +%H:%M:%S)${ku}]${st} ${ku}[${ij}INFO${ku}]${me}-${ij}>${ku} [${pu}files${me}:${pu}$1${ku}] [${pu}pass${me}:${pu}$burute${ku}]${un} (${ku}hasil${me}:${me}gagal${un})${st}\n"
				fi
			done; echo
				#try {
				#	[[ -z "$s" ]]; {
				#		println_info " proses telah selesai"
				#		println_info " zip berhasil di bobol"
				#		println_info " ketikan ${ku}ls${st} untuk melihat nya\n";
				#	}
				#} catch {
				#	println_info " proses telah selesai"
				#	println_info " gagal membobol zip"
				#	println_info " silakan atur password list nya lagi agar akurat\n"
				#}
				
		};

	def: main(){
		stty sane; shopt -s checkwinsize
		Tulis.str "${cy}"
		toilet -f slant -F border "Brute force zip";
		Tulis.str "${st}\n"
		Tulis.strN "${ku}[${me}•${ij}•${ku}]${st} Tools brute force zip"
		Tulis.strN "${ku}[${me}•${ij}•${ku}]${st} language ${me}:${st} Bash"
		Tulis.strN "${ku}=====================================================================${st}"
		Tulis.strN "${ku}[${ij}•${me}•${ku}]${pu} Author ${me}:${pu} Bayu riski A.M${st}"
		Tulis.strN "${ku}[${ij}•${me}•${ku}]${pu} github ${me}:${pu} Bayu12345677${st}"
		Tulis.strN "${ku}[${ij}•${me}•${ku}]${pu} lang   ${me}:${pu} Bash (bourne again shell)${st}"
		Tulis.strN "${ku}======================================================================"
		Tulis.strN "${ku}[${ij}\$${ku}]${pu} Donasi  ${me}:${pu} 085731184377 ${me}(${pu}dana ${me}/${pu} pulsa${me})${st}"
		Tulis.strN "${ku}[${cy}?${ku}]${pu} Contact ${me}:${pu} 085731184377 ${me}(${pu}whatsapp${me})${st}"
		Tulis.strN "${ku}[${me}!${ku}]${pu} Dilarang mempalsukan nama author di source ini${st}"
		Tulis.strN "${ku}=======================================================================${st}"
		Tulis.str "\n"
		Tulis.str "${ku}[${me}•${ij}•${ku}]${pu} masukan file nya ${me}:${st} "; read piles
		Tulis.str "${cy}[${me}•${ij}•${cy}]${pu} masukan password list nya ${me}:${st} "; read list_pass

		# cek input
			echo
		if [[ -z "$piles" ]]; then
			println_info " input tidak boleh kosong bre\n"; exit 3
		fi;

			if [[ -z "$list_pass" ]]; then
				println_info " passworld list gak boleh kosong\n"; exit 2
			fi;

			if [[ ! -f "$piles" ]]; then
				println_info " file $piles tidak di temukan"
				echo; exit 2
			elif [[ ! -f "$list_pass" ]]; then
				println_info " File $list_pass tidak di temukan"
				echo; exit 2
			fi
		var prame_a : "🕛🕐🕑🕒🕓🕔🕕🕖🕗🕘🕙🕚"

		for x in {1..6}; do
			for ((i = 0; i < ${#prame_a}; i++)); do
				sleep 0.1s
				Tulis.str "\r${m}[${ij}•${me}•${m}]${pu} menyiapkan fungsi membobol zip ${prame_a:i:1}"
			done
		done; echo

		var prame_b : "🕛🕐🕑🕒🕓🕔🕕🕖🕗🕘🕙🕚"

		for x in {1..6}; do
			for ((i = 0; i < ${#prame_b}; i++)); do
				sleep 0.1s
				Tulis.str "\r${cy}[${ij}•${me}•${cy}]${pu} memulai membobol zip ${prame_b:i:1}"
			done
		done; echo; echo
		    brute_zip "$piles" "$list_pass"
	}; xdg-open "https://youtu.be/G7CwHRd8h-s"
		var this : $(IO.func)
		
		[[ ! -z "$this" ]] && {
			$this.NAME main
				clear; main
		}; %% cek main
}
