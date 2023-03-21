		</div>
		<div class="bg-main2" style="height: 5px;"></div>
		<footer class="footer page-footer font-small blue-grey lighten-5 ">
			<div class="container text-left text-md-left py-3">
				<div class="row py-4 d-flex align-items-center">
					<div class="col-md-6 col-lg-6 text-center text-md-left mb-4 mb-md-0">
						<a href="https://validator.w3.org/check?uri=referer" target="_blank"><img src="<?php echo $site_statsurl;?>_source/images/HTML5.png" width="53" height="44" alt="Valid HTML 5" /></a>
					</div>
					<div class="col-md-6 col-lg-6 text-center text-md-right">
						<span class="copyright text-uppercase">
							Stupid dude island hobby projects © 2021-<?php echo date( "Y"); ?> <a class="alink-main2" href="https://hearthis.at/yani" target="_blank">Yani Da Bunny</a><br />
						</span>
					</div>
				</div>
			</div>
		</footer>
		<script>
			var dropdown = document.getElementsByClassName("dropdown-btn");
			var i;

			for (i = 0; i < dropdown.length; i++) {
			dropdown[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var dropdownContent = this.nextElementSibling;
			if (dropdownContent.style.display === "block") {
			dropdownContent.style.display = "none";
			} else {
			dropdownContent.style.display = "block";
			}
			});
			}
		</script>
		<script>
			function openNav() {
			document.getElementById("mySidebar").style.width = "100%";
			}
			function closeNav() {
			document.getElementById("mySidebar").style.width = "0";
			document.getElementById("main").style.marginLeft= "0";
			}
		</script>
	</body>
</html>
