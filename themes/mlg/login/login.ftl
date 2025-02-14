<#import "tailwind-template.ftl" as template>
<@template.loginLayout ; section>
	<#if section = "main">

		<div>
			<#if realm.password && social.providers??>
				<div>

					<div class="mt-1 grid grid-cols-1">
						<#list social.providers as p>
							<div class="mt-2">
								<a type="button" href="${p.loginUrl}" id="social-${p.alias}" class="w-full inline-flex justify-center py-2 px-4 border border-grey rounded-md shadow-sm bg-white text-sm font-medium text-gray-800 hover:bg-purple-500 hover:text-white">
									<#if p.providerId = "google">
										<img class="w-6 h-6" src="https://www.svgrepo.com/show/475656/google-color.svg" loading="lazy" alt="google logo">
										<span class="mx-8 px-2">Login with Google</span>
									<#elseif p.providerId = "github">
										<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
											<path fill-rule="evenodd" d="M10 0C4.477 0 0 4.484 0 10.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0110 4.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.203 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.942.359.31.678.921.678 1.856 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0020 10.017C20 4.484 15.522 0 10 0z" clip-rule="evenodd" />
										</svg>
										<span  class="mx-8 px-2">Login with Github</span>
									<#elseif p.providerId = "apple">
									<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="-1.5 0 20 20" width="100" height="100">
										<g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
											<g id="Dribbble-Light-Preview" transform="translate(-102.000000, -7439.000000)" fill="#000000">
												<g id="icons" transform="translate(56.000000, 160.000000)">
													<path d="M57.5708873,7282.19296 C58.2999598,7281.34797 58.7914012,7280.17098 58.6569121,7279 C57.6062792,7279.04 56.3352055,7279.67099 55.5818643,7280.51498 C54.905374,7281.26397 54.3148354,7282.46095 54.4735932,7283.60894 C55.6455696,7283.69593 56.8418148,7283.03894 57.5708873,7282.19296 M60.1989864,7289.62485 C60.2283111,7292.65181 62.9696641,7293.65879 63,7293.67179 C62.9777537,7293.74279 62.562152,7295.10677 61.5560117,7296.51675 C60.6853718,7297.73474 59.7823735,7298.94772 58.3596204,7298.97372 C56.9621472,7298.99872 56.5121648,7298.17973 54.9134635,7298.17973 C53.3157735,7298.17973 52.8162425,7298.94772 51.4935978,7298.99872 C50.1203933,7299.04772 49.0738052,7297.68074 48.197098,7296.46676 C46.4032359,7293.98379 45.0330649,7289.44985 46.8734421,7286.3899 C47.7875635,7284.87092 49.4206455,7283.90793 51.1942837,7283.88393 C52.5422083,7283.85893 53.8153044,7284.75292 54.6394294,7284.75292 C55.4635543,7284.75292 57.0106846,7283.67793 58.6366882,7283.83593 C59.3172232,7283.86293 61.2283842,7284.09893 62.4549652,7285.8199 C62.355868,7285.8789 60.1747177,7287.09489 60.1989864,7289.62485" id="apple-[#173]" />
												</g>
											</g>
										</g>
									</svg>
									<span  class="mx-8 px-2">Login with Apple</span>
									<#else>
										<span>${p.displayName!}</span>
									</#if>
								</a>
							</div>
						</#list>
					</div>

					<div class="mt-10 relative">
						<div class="absolute inset-0 flex items-center" aria-hidden="true">
							<div class="w-full border-t border-grey"></div>
						</div>
						<div class="relative flex justify-center text-sm">
							<span class="px-2 bg-white text-small tracking-paragraph text-grey"></span>
						</div>
					</div>
				</div>
			<#else>
				<div>
					<p class="text-paragraph text-paragraph tracking-paragraph text-grey">
						${kcSanitize(msg("Your Demo Login",(realm.displayNameHtml!'')))?no_esc}
					</p>
				</div>
			</#if>
			<div class="mt-10">
				<form class="space-y-6" id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
					<div>
						<label for="username" class="block text-paragraph tracking-paragraph text-grey text-grey">
							${msg("usernameOrEmail")}
						</label>
						<div class="mt-1 relative">
							<input tabindex="1" id="username" name="username" value="${(username!'')}" type="text" autofocus autocomplete="off" required class="appearance-none block w-full px-3 py-2 focus:outline-none text-paragraph tracking-paragraph border <#if messagesPerField.existsError('username','password')>border-orange placeholder-orange focus:ring-orange focus:border-orange<#else>border-gray-300 placeholder-gray-400 focus:ring-grey focus:border-grey</#if>" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>">
							<#if messagesPerField.existsError('username','password')>
								<div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
									<svg class="h-5 w-5 text-orange" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
										<path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
									</svg>
								</div>
							</#if>
						</div>
						<#if messagesPerField.existsError('username','password')>
							<p class="mt-2 text-paragraph tracking-paragraph text-orange" id="email-error" aria-live="polite">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
						</#if>
					</div>

					<div class="space-y-1">
					<label for="password" class="block text-paragraph tracking-paragraph text-grey text-grey">
						${msg("password")}
					</label>
					<div class="mt-1">
						<input tabindex="2" id="password" name="password" type="password" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" autocomplete="current-password" class="appearance-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-400 focus:outline-none focus:ring-grey focus:border-grey text-paragraph tracking-paragraph">
					</div>
					</div>
					<#if realm.rememberMe || realm.resetPasswordAllowed>
						<div class="flex items-center justify-between">
							<#if realm.rememberMe>
								<div class="flex items-center">
									<input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="h-4 w-4 text-grey focus:ring-grey border-grey rounded">
									<label for="rememberMe" class="ml-2 block text-small tracking-paragraph text-grey">
										${msg("rememberMe")}
									</label>
								</div>
							</#if>
							<#if realm.resetPasswordAllowed>
							<div>
								<a href="${url.loginResetCredentialsUrl}" tabindex="5" class="text-small tracking-paragraph text-grey">
									${msg("doForgotPassword")}
								</a>
							</div>
						</#if>
						</div>
					</#if>
					<div>
						<input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>>
						<button tabindex="4" type="submit" name="login" id="kc-login" class="
						w-full bg-linear-65 from-purple-500 to-pink-500 text-white py-3 rounded-xl hover:opacity-90 transition duration-200 transform hover:scale-105 shadow-lg hover:shadow-xl ease-in-out
						flex justify-center px-4 border-4 uppercase tracking-button text-button font-semibold
						">
							${msg("doLogIn")}
						</button>
					</div>
				</form>
			</div>
		</div>
    </#if>
</@template.loginLayout>
