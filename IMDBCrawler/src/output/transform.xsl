<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/movie_list">

<html>
	<head>
		<title>
			IMDB Crawler
		</title>
		<link href="http://fonts.googleapis.com/css?family=Ubuntu:400,400italic,700,700italic&amp;subset=latin,greek,cyrillic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" type="text/css" href="style.css" />
		<link rel="icon" type="image/png" href="favicon.png" />
		<script type="text/JavaScript" src="jquery.min.js"></script> 

	</head>
	<body class="row-fluid">
		<div id="movieList" class="span10">
			<div id="all">
				<div class="category"><strong>All Movies</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="adventure">
				<div class="category"><strong>Adventure</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Adventure']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="animation">
				<div class="category"><strong>Animation</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Animation']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="biography">
				<div class="category"><strong>Biography</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Biography']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="comedy">
				<div class="category"><strong>Comedy</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Comedy']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="crime">
				<div class="category"><strong>Crime</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Crime']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="documentary">
				<div class="category"><strong>Documentary</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Documentary']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="drama">
				<div class="category"><strong>Drama</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Drama']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="family">
				<div class="category"><strong>Family</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Family']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="fantasy">
				<div class="category"><strong>Fantasy</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Fantasy']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="film-Noir">
				<div class="category"><strong>Film-Noir</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Film-Noir']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="history">
				<div class="category"><strong>History</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='History']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="horror">
				<div class="category"><strong>Horror</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Horror']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="music">
				<div class="category"><strong>Music</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Music']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="musical">
				<div class="category"><strong>Musical</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Musical']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="mystery">
				<div class="category"><strong>Mystery</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Mystery']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="romance">
				<div class="category"><strong>Romance</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Romance']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="sci-Fi">
				<div class="category"><strong>Sci-Fi</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Sci-Fi']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="short">
				<div class="category"><strong>Short</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Short']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="sport">
				<div class="category"><strong>Sport</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Sport']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="thriller">
				<div class="category"><strong>Thriller</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Thriller']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="war">
				<div class="category"><strong>War</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='War']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
			<div id="western">
				<div class="category"><strong>Western</strong></div><p></p>
				<table border="4">
					<xsl:for-each select="movie/genres[genre='Western']">
						<theader>
							<tr>
								<td>
									<h1><xsl:value-of select="../name"/></h1>
								</td>
							</tr>
						</theader>
						<tbody>
							<tr>
								<td>
									<div class="movie">
										<div class="span2" style="text-align: center">
											<img src="{../image}" alt="Movie Poster" style="height: 250px;" />
										</div>
										<div class="span10" style="padding-right:10px; padding-top:20px;">
											<strong>Score: </strong>
											<xsl:choose>
												<xsl:when test="score = -1.0">
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
						</tbody>
					</xsl:for-each>
				</table>
			</div>
		</div>
		<div class="menu span2">
			<p><strong>Genre</strong></p>
			<ul>
				<li><a href="#all">All</a></li>
				<li><a href="#adventure">Adventure</a></li>
				<li><a href="#animation">Animation</a></li>
				<li><a href="#biography">Biography</a></li>
				<li><a href="#comedy">Comedy</a></li>
				<li><a href="#crime">Crime</a></li>
				<li><a href="#documentary">Documentary</a></li>
				<li><a href="#drama">Drama</a></li>
				<li><a href="#family">Family</a></li>
				<li><a href="#fantasy">Fantasy</a></li>
				<li><a href="#film-Noir')">Film-Noir</a></li>
				<li><a href="#history">History</a></li>
				<li><a href="#horror">Horror</a></li>
				<li><a href="#music">Music</a></li>
				<li><a href="#musical">Musical</a></li>
				<li><a href="#mystery">Mystery</a></li>
				<li><a href="#romance">Romance</a></li>
				<li><a href="#sci-Fi">Sci-Fi</a></li>
				<li><a href="#short">Short</a></li>
				<li><a href="#sport">Sport</a></li>
				<li><a href="#thriller">Thriller</a></li>
				<li><a href="#war">War</a></li>
				<li><a href="#western">Western</a></li>
			</ul>
		</div>
	</body>
</html>
</xsl:template>
</xsl:stylesheet>

