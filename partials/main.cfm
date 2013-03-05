<div id="maincontent">
	<div class="row">
		<div class="span10" >
			<h2>What is <span class="green">this?</span></h2>
			<p>	The aim of the <strong>Software Definition Framework</strong> is to provide a simple tool
				to assist in the definition of basic functional websites for Businesses. The key objectives of this project
				is to give the business the ability to quickly capture and manage System requirements using a single tool.
				Including, the ability to validate requirements using feature maps and Wireframes (features to come later). 
				At all times all the objects, controls, and services, can be quickly referenced back to the original 
				requirements. Finally it should be intuitive and amazingly simple and fun to use. 
				<a class="readm" ng-click="showIntro = !showIntro" >Read more...</a>
			</p>
			<div ng-show="showIntro" >
				<p> It is somewhat based on Agile development methodology where the customer is involved in 
				creating "user stories" (Requirements) and prioritising them to before they are worked on by developers. 
				A "user story" is a simple statement about what a user wants to do with a feature of the software. This 
				method of capturing requirements throughout a project is an alternative to writing lengthy requirements 
				specifications all up-front.
				</p>
				<p> The Requirements should focus on who, what and why of a given feature, not how.</p>
				<p> The Guidelines for Requirements Gathering are;</p>
				<p> 
					<ul>
						<li>1. The Customer is responsible for formulating the requirements. Each individual requirement represents a single feature of the solution.</li>
						<li>2. Each requirement shall be made as one or two sentences in everyday language of the customer.</li>
						<li>3. The requirement group will be used to group requirements into logical areas.</li>
						<li>4. if the developer and customer find that the description is lacking is some way (too large, complicated, imprecise) it is rewritten until satisfactory.</li>
						<li>5. Requirements must be prioritised by the customer.</li>
						<li>6. The developer is responsible for breaking down the requirements into tasks and providing estimates.</li>
						<li>7. Sign-off by both the customer and the developer signifies Requirements Gathering milestone complete.</li>
					</ul>
				</p>
			</div>	
		</div>	
	</div> <!--- introduction --->
	<div class="row" >
		<div class="span4">
			<h2><span class="green">Feature</span> Maps</h2>
			<p>	Feature Maps are a simple visual representation of the requirements as feature blocks 
			including the navigation between them. Feature maps are an excellent way of reviewing groups of features
			and the user navigation from feature to feature. It can help to quickly identify missing features or 
			feature duplication.<br />
			<a class="readm" ng-click="showFeature = !showFeature">Read more...</a>
			</p>
			<div ng-show="showFeature" >
				<p> Each feature block is cross-referenced at all times with the requirements and are named 
				using verbNoun usage captured with the Requirement. Feature blocks are marked with relative complexity (Easy, Medium, Complex & Special Case ).</p>
				<p><strong>Definitions</strong></p>
				<p>
					<ul>
						<li>Easy: <i>I know eaxctly how to do this and can do it in half a day.</i></li>
						<li>Medium:<i>I know exactly how to do this, but it will be some work.</i> </li>
						<li>Complex:<i>Somehow we will implement this feature.</i> </li>
						<li>Special Case: <i>I am not sure we can do this.</i></li> 
					</ul>
				</p> 	
			</div>
		</div>
		<div class="span4">
			<h2>What's in a <span class="green">Project</span> anyway?</h2>
			<p>	This tool allows you to create new projects which your requirements can be associated to. 
			Requirements can be further categorised using <strong>Groupings</strong>. A project should cover the development or enhancement of a single solution while a Grouping will be limited to a functional area. 
			<a class="readm" ng-click="showProject = !showProject" >Read more...</a></p>
			<div ng-show="showProject" >
				<p> While it may at times be difficult to review the entire system Requirements for a given Project
 				in one go the Groupings allow you to focus on specific areas of related Requirements.</p>
				<p> Finally, the Framework allows for the association of Projects so that if you have a Programme
 				(collection of Projects) you can quickly and easily monitor the progress overall.</p> 	
			</div>
		</div>
		<div class="span2 well">
			<h2>Latest <span class="green">News</span></h2>
			<p>	
				<span class="date">20.02.2013</span><br />
				AngularJS Conversion <br />
			</p>	
		</div> 
	</div>	
	
	<div class="row">
		<div class="span10"	>
			<h2>Activity <span class="green">Statistics</span></h2>
			<p>	When you move away from lengthy requirements documents initially it can seem harder to tell how your project is really progressing. In an iterative development framework such as this one the best ways to establish the health of your project is in the use of statistics which detail the level of activity.</p>
			<div class="pull-right span2 well">
				<ul>
					<li>New Requirements</li>
					<li>Updates/Changes</li>
					<li>Testing
						<ul>
							<li> Tests Created</li>
							<li> Bugs Found </li>
							<li> Tests Passed </li>
						</ul>
					</li>
				</ul>
			</div>
			<p> The key to a successful project is ensuring that there is regular activity. From this you can quickly ascertain the level of involvement by the business, the general phase of the project and whether you are progressing to a release candidate.</p>
		</div>
	</div> <!--- pad --->
</div>	