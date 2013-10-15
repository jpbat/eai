<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/movie_list">
<html>
	<head>
		<title>
			IMDB Crawler
		</title>
		<link href="http://fonts.googleapis.com/css?family=Ubuntu:400,400italic,700,700italic&amp;subset=latin,greek,cyrillic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="style.css" />
		<link rel="icon" type="image/png" href="favicon.png" />
		<script type="text/javascript" src="jquery.min.js"></script> 
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script> 

		<script type="text/javascript">
			function update(id) {
				$('div ul li').removeClass();
				$('#' + id).addClass('selected');
			}
		</script>

	</head>
	<body class="row-fluid">
		<div id="movieList" class="span10" style="width: 70%">
			<div id="all">
				<div class="category"><strong>&lt;-- All Movies --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie">
						<tr>
							<th>
								<h1><xsl:value-of select="name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="score = -1">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(duration)">
													<xsl:value-of select="duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Adventure">
				<div class="category"><strong>&lt;-- Adventure --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Adventure']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Animation">
				<div class="category"><strong>&lt;-- Animation --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Animation']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Biography">
				<div class="category"><strong>&lt;-- Biography --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Biography']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Comedy">
				<div class="category"><strong>&lt;-- Comedy --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Comedy']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Crime">
				<div class="category"><strong>&lt;-- Crime --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Crime']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Documentary">
				<div class="category"><strong>&lt;-- Documentary --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Documentary']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Drama">
				<div class="category"><strong>&lt;-- Drama --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Drama']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Family">
				<div class="category"><strong>&lt;-- Family --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Family']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Fantasy">
				<div class="category"><strong>&lt;-- Fantasy --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Fantasy']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Film-Noir">
				<div class="category"><strong>&lt;-- Film-Noir --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Film-Noir']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="History">
				<div class="category"><strong>&lt;-- History --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='History']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Horror">
				<div class="category"><strong>&lt;-- Horror --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Horror']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Music">
				<div class="category"><strong>&lt;-- Music --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Music']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Musical">
				<div class="category"><strong>&lt;-- Musical --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Musical']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Mystery">
				<div class="category"><strong>&lt;-- Mystery --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Mystery']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Romance">
				<div class="category"><strong>&lt;-- Romance --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Romance']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Sci-Fi">
				<div class="category"><strong>&lt;-- Sci-Fi --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Sci-Fi']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Short">
				<div class="category"><strong>&lt;-- Short --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Short']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Sport">
				<div class="category"><strong>&lt;-- Sport --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Sport']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Thriller">
				<div class="category"><strong>&lt;-- Thriller --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Thriller']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="War">
				<div class="category"><strong>&lt;-- War --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='War']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
			<div id="Western">
				<div class="category"><strong>&lt;-- Western --&gt;</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Western']">
						<tr>
							<th>
								<h1><xsl:value-of select="../name"/></h1>
							</th>
						</tr>
						<tr>
							<td>
								<div class="movie">
									<div class="span2" style="text-align: center">
										<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
									</div>
									<div class="span10" style="padding-right:10px; padding-top:20px;">
										<strong>Score: </strong>
										<xsl:choose>
											<xsl:when test="../score = -1.0">
												<xsl:text>(not available)</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="substring(../score, 1, 3)"/>
												<xsl:text>/10</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
										<br/>

										<strong>Duration: </strong>
											<xsl:choose>
												<xsl:when test="string-length(../duration)">
													<xsl:value-of select="../duration"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>(not available)</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										<br/>

										<strong>Genres: </strong> 
										<xsl:for-each select="../genres/genre">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Stars: </strong>
										<xsl:for-each select="../stars/star">
											<xsl:value-of select="."/>
											<xsl:if test="position() != last()">
												<xsl:text>, </xsl:text>
											</xsl:if>
										</xsl:for-each><br/>

										<strong>Director: </strong> <xsl:value-of select="../director"/><br/>
										<strong>Launch Date: </strong> <xsl:value-of select="../launchDate"/><br/>
										<hr/>
										<strong>Description:</strong>
										<div><xsl:value-of select="../description"/></div>
									</div>
								</div>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</div>
		</div>
		<div class="menu span2">
			<p><strong>&lt;-- Genres --&gt;</strong></p>
			<ul>
				<li id="ListAll" onclick="update(this.id)"><a href="#all"><span id="allBadge" class="badge badge-info"></span> All</a></li>
				<li id="ListAdventure" onclick="update(this.id)"><a href="#Adventure"><span id="AdventureBadge" class="badge badge-info"></span> Adventure</a></li>
				<li id="ListAnimation" onclick="update(this.id)"><a href="#Animation"><span id="AnimationBadge" class="badge badge-info"></span> Animation</a></li>
				<li id="ListBiography" onclick="update(this.id)"><a href="#Biography"><span id="BiographyBadge" class="badge badge-info"></span> Biography</a></li>
				<li id="ListComedy" onclick="update(this.id)"><a href="#Comedy"><span id="ComedyBadge" class="badge badge-info"></span> Comedy</a></li>
				<li id="ListCrime" onclick="update(this.id)"><a href="#Crime"><span id="CrimeBadge" class="badge badge-info"></span> Crime</a></li>
				<li id="ListDocumentary" onclick="update(this.id)"><a href="#Documentary"><span id="DocumentaryBadge" class="badge badge-info"></span> Documentary</a></li>
				<li id="ListDrama" onclick="update(this.id)"><a href="#Drama"><span id="DramaBadge" class="badge badge-info"></span> Drama</a></li>
				<li id="ListFamily" onclick="update(this.id)"><a href="#Family"><span id="FamilyBadge" class="badge badge-info"></span> Family</a></li>
				<li id="ListFantasy" onclick="update(this.id)"><a href="#Fantasy"><span id="FantasyBadge" class="badge badge-info"></span> Fantasy</a></li>
				<li id="ListFilm-Noir" onclick="update(this.id)"><a href="#Film-Noir')"><span id="Film-NoirBadge" class="badge badge-info"></span> Film-Noir</a></li>
				<li id="ListHistory" onclick="update(this.id)"><a href="#History"><span id="HistoryBadge" class="badge badge-info"></span> History</a></li>
				<li id="ListHorror" onclick="update(this.id)"><a href="#Horror"><span id="HorrorBadge" class="badge badge-info"></span> Horror</a></li>
				<li id="ListMusic" onclick="update(this.id)"><a href="#Music"><span id="MusicBadge" class="badge badge-info"></span> Music</a></li>
				<li id="ListMusical" onclick="update(this.id)"><a href="#Musical"><span id="MusicalBadge" class="badge badge-info"></span> Musical</a></li>
				<li id="ListMystery" onclick="update(this.id)"><a href="#Mystery"><span id="MysteryBadge" class="badge badge-info"></span> Mystery</a></li>
				<li id="ListRomance" onclick="update(this.id)"><a href="#Romance"><span id="RomanceBadge" class="badge badge-info"></span> Romance</a></li>
				<li id="ListSci-Fi" onclick="update(this.id)"><a href="#Sci-Fi"><span id="Sci-FiBadge" class="badge badge-info"></span> Sci-Fi</a></li>
				<li id="ListShort" onclick="update(this.id)"><a href="#Short"><span id="ShortBadge" class="badge badge-info"></span> Short</a></li>
				<li id="ListSport" onclick="update(this.id)"><a href="#Sport"><span id="SportBadge" class="badge badge-info"></span> Sport</a></li>
				<li id="ListThriller" onclick="update(this.id)"><a href="#Thriller"><span id="ThrillerBadge" class="badge badge-info"></span> Thriller</a></li>
				<li id="ListWar" onclick="update(this.id)"><a href="#War"><span id="WarBadge" class="badge badge-info"></span> War</a></li>
				<li id="ListWestern" onclick="update(this.id)"><a href="#Western"><span id="WesternBadge" class="badge badge-info"></span> Western</a></li>
			</ul>
		</div>
	</body>
	<script type="text/javascript">
		$(function() {
		  	var genres = ['all','Adventure','Animation','Biography','Comedy','Crime','Documentary','Drama','Family','Fantasy','Film-Noir','History','Horror','Music','Musical','Mystery','Romance','Sci-Fi','Short','Sport','Thriller','War','Western'];
			
			for (i in genres) {
				
				if ($('#' + genres[i] + ' table')[0] == undefined || $('#' + genres[i] + ' table')[0].childNodes[1] == undefined) {
					$('#' + genres[i] + 'Badge').html(0);
					$('#' + genres[i]).hide();
				} else {
					$('#' + genres[i] + 'Badge').html($('#' + genres[i] + ' table')[0].childNodes[1].childNodes.length / 4);
				}
			}
		});
	</script>
</html>
</xsl:template>
</xsl:stylesheet>
