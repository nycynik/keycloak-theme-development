<#macro loginLayout>
<!DOCTYPE html>
<html class="h-full bg-gray-50">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="robots" content="noindex, nofollow">
		<#if properties.meta?has_content>
			<#list properties.meta?split(' ') as meta>
				<meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
			</#list>
		</#if>
		<title>${msg("loginTitle",(realm.displayName!''))}</title>
		<link rel="icon" href="${url.resourcesPath}/img/YOUR_IMG" />
		
		<script src="${url.resourcesPath}/js/index.global.js"></script>
		<link rel="stylesheet" href="${url.resourcesPath}/css/styles.css" />
		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
		<link
		href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
		rel="stylesheet"
		/>
	</head>
	<body class="h-full flex flex-col font-poppins">
		<header class="bg-grey">
			<nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" aria-label="Top">

			</nav>
		</header>

		<div class="h-full flex flex-col justify-center py-12 px-2 sm:px-6 lg:px-8">
			<div class="sm:mx-auto sm:w-full sm:max-w-md">
				<img class="mx-auto h-12 w-auto" src="${url.resourcesPath}/img/YOUR_IMG.svg" alt="" />
				<h1 class="mt-6 text-center text-header2 tracking-header2 font-semibold text-grey">
					${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}
				</h1>
				<p class="mt-2 text-paragraph tracking-paragraph text-grey">
					<#nested "description">
				</p>
			</div>

			<div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
			    <div id="back-div" class="bg-gradient-to-r from-blue-500 to-purple-500 rounded-[26px] py-1">
					<div class="border-[20px] border-transparent rounded-[20px] dark:bg-gray-900 bg-white shadow-lg xl:p-10 2xl:p-10 lg:p-10 md:p-10 sm:p-2 m-2">
						<#nested "main">
						<div
							class="text-gray-500 flex text-center flex-col mt-4 items-center text-sm"
						>
							<p class="cursor-default">
							By signing in, you agree to our
							<br/>
							<a
								class="group text-blue-400 transition-all duration-100 ease-in-out"
								href="https://mikelynchgames.com/terms"
							>
								<span
								class="cursor-pointer bg-left-bottom bg-gradient-to-r from-blue-400 to-blue-400 bg-[length:0%_2px] bg-no-repeat group-hover:bg-[length:100%_2px] transition-all duration-500 ease-out"
								>
								Terms of Service
								</span>
							</a>
							, 
							<a
								class="group text-blue-400 transition-all duration-100 ease-in-out"
								href="https://mikelynchgames.com/cookies"
							>
								<span
								class="cursor-pointer bg-left-bottom bg-gradient-to-r from-blue-400 to-blue-400 bg-[length:0%_2px] bg-no-repeat group-hover:bg-[length:100%_2px] transition-all duration-500 ease-out"
								>
								Cookie Policy
								</span>
							</a>
							, and
							<br/>
							<a
								class="group text-blue-400 transition-all duration-100 ease-in-out"
								href="https://mikelynchgames.com/privacy"
							>
								<span
								class="cursor-pointer bg-left-bottom bg-gradient-to-r from-blue-400 to-blue-400 bg-[length:0%_2px] bg-no-repeat group-hover:bg-[length:100%_2px] transition-all duration-500 ease-out"
								>
								Privacy Policy
								</span>
							</a>
							</p>
						</div>
					</div>
				</div>
			</div>

		</div>
		<footer class="bg-gray-300">
			
		</footer>
	</body>
</html>
</#macro>
