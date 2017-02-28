
<sec:authorize
	access="hasRole('CPR') ">

	<div class="dropdown-ajax-menu btn-group">
		<button type="button" class="btn dropdown-toggle"
			data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
			<i class="fa fa-circle"></i> <i class="fa fa-circle"></i> <i
				class="fa fa-circle"></i>
		</button>
		<ul class="dropdown-menu-v2">

			

			<sec:authorize
				access="(hasRole('CPR')) 
									or (hasRole('CPR') and hasRole('USER') )">
				<li><a ng-click="showEvolutionCPRAction()"
					class="navbar-header-inwi navbar-header">
						Evolutions</a></li>
			</sec:authorize>
		


		</ul>
	</div>
	<button type="button" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="toggle-icon">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </span>
                        </button>
</sec:authorize>