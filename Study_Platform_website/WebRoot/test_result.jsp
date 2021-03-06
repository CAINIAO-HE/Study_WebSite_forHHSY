<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- 判断el表达式是否为空的标准函数声明 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><!-- 判断el集合是否为空的声明 -->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="com.studyplatform.web.utils.*" %>
<%@ page import="com.studyplatform.web.bean.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.math.*" %>
<%@ page import="com.studyplatform.web.system.*" %>
<%@ page import="org.apache.commons.lang3.math.*" %>
<%@ page import="com.google.gson.*" %>

<!-- html5 -->
<!DOCTYPE HTML>
<html>
<head>
	<!-- 编码设置 -->
	<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
	<meta charset="utf-8"/>
	<base href="<%=basePath%>">

	<!-- 设置jsp地址栏小图标 -->
	<link rel="icon" href="<%=basePath%>images/logo_icon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="<%=basePath%>images/logo_icon.ico" type="image/x-icon">
	<title>测试结果</title>

	<!-- 移动端兼容设置 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta content="" name="description" />
	<meta content="" name="author" />  
	<!-- 轮播插件 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/plugins/owl-carousel/owl.carousel.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/plugins/owl-carousel/owl.theme.css" />
	<!-- 地址栏插件 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/plugins/headereffects/css/component.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/plugins/headereffects/css/normalize.css"/>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/plugins/pace/pace-theme-flash.css" media="screen"/>
	<!-- bootstrap支持 -->
	<link href="${pageContext.request.contextPath }/plugins/boostrapv3/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath }/plugins/boostrapv3/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
	<!-- 图标字体库支持 -->
	<link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<!-- css样式 -->
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/css/magic_space.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/css/responsive.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/css/animate.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="main-wrapper">
		<!-- 导航栏 -->
		<div role="navigation" class="navbar navbar-default navbar-static-top">
			<div class="container">
				<div class="compressed">

					<div class="navbar-header">
						<button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
							<span class="sr-only">T</span> <span class="icon-bar"></span>
							<span class="icon-bar"></span><span class="icon-bar"></span>
						</button>
						<a href="#" class="navbar-brand compressed">
							<img src="images/logo_black.png" alt="" data-src="images/logo_black.png"
							data-src-retina="images/logo_black.png" width="270" height="38" />
						</a>
					</div>

					<div class="navbar-collapse collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="${pageContext.request.contextPath }/default.jsp">首&nbsp;页</a></li>
							<li><a href="#">专&nbsp;业&nbsp;大&nbsp;类</a></li>
							<li><a href="#">推&nbsp;荐&nbsp;资&nbsp;源</a></li>
							<li><a href="${pageContext.request.contextPath }/app_download.jsp">移&nbsp;动&nbsp;课&nbsp;堂</a></li>
                            <!-- 这里为el表达式的if-else判断，在用户登录成功后显示登录成功的用户，在用户未登录时，显示登录按钮 -->
                            <!-- 下面的el表达式判断用户名是否过长，如果过长隐藏过长用户名 -->
                            <c:choose>
	                            <c:when test="${!empty user.user_name}">
		                            <c:if test="${fn:length(user.user_name)>6 }">
			                            <li><a href="#"><span><font style="color:#ff0000;">${fn:substring(user.user_name, 0, 6)}...,欢迎你</font></span></a></li>
			                            <li><a href="${pageContext.request.contextPath }/servlet/WrittenOffServlet">退出登录</a></li>
		                            </c:if>
		                            <c:if test="${fn:length(user.user_name)<=6}">
			                            <li><a href="#"><span><font style="color:#ff0000;">${fn:substring(user.user_name, 0, 6)},欢迎你</font></span></a></li>
			                            <li><a href="${pageContext.request.contextPath }/servlet/WrittenOffServlet">退出登录</a></li>
		                            </c:if>
	                            </c:when>
	                            <c:otherwise>
	                               <li><a href="${pageContext.request.contextPath }/login.jsp">登&nbsp;录&nbsp;/&nbsp;注&nbsp;册</a></li>
	                            </c:otherwise>
                            </c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- 专业内容 -->
		<div class="section first white">
			<div class=" p-b-60">
				<!-- 大标题 -->
				<div class="section grey p-t-20  p-b-20 m-b-50">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<h2 class="semi-bold">
								测试结果</h2>
							</div>
						</div>
					</div>
					<div class="clearfix">
					</div>
				</div>
                <% 
                    int user_score = (Integer)request.getAttribute("user_score");
                    String question_json_text = (String)request.getAttribute("question_json_text");
                    String user_answer_json = (String)request.getAttribute("user_answer_json");
                    String user_ans = user_answer_json.replaceAll("\"", "\'");
                %>
                
				<div class="container">
					<div class="portfolio-grid portfolioContainer ">
						<div class="score-container">
							<h1 class="score-row score-skew-title">  
								<span>您</span><span>的</span><span>分</span><span>数</span><span>为</span><span class="last">：</span>
								<%
								    if (user_score < 100) {
								%>
								    <span class="alt"><%=user_score%></span>
								<%
								    } else {
								%>
								    <span class="alt">满</span>
								<%
								    }
								%>
								<span class="alt">分</span><span class="alt">!</span><span class="score-alt last">!</span>
								<!-- <span>T</span><span>E</span><span>X</span><span class="last">T</span> -->
							</h1>
						</div>
					</div>
				</div>
				<div class="text-center">
				    <form action="${pageContext.request.contextPath }/servlet/AnswerServlet" target="_blank">
                        <%-- <input type="hidden" value="<%=question_json_text %>" name="question_json_text"> --%>
                        <input type="hidden" value="<%=user_ans %>" name="user_answer_json">
                        <input type="submit" value="查看答案" id="tjbox_submit" class="btn btn-primary btn-lg  btn-large m-r-10">
                    </form>
				</div>
			</div>
		</div>

		<%
		    String resourses_json = (String) request.getAttribute("resourses_json");
		    Gson gson = new Gson();
		    JsonObject rootJson = new JsonParser().parse(resourses_json).getAsJsonObject();
		    JsonArray resourses_list = rootJson.get("root").getAsJsonArray();
		    ArrayList<ResourceBean> allres = new ArrayList<ResourceBean>();
		    ArrayList<ResourceBean> video_list = new ArrayList<ResourceBean>();
		    ArrayList<ResourceBean> book_list = new ArrayList<ResourceBean>();
		    for (JsonElement jsonElement : resourses_list) {
		        JsonObject jo = jsonElement.getAsJsonObject();
		        ResourceBean resource = gson.fromJson(jo, ResourceBean.class);
		        switch (resource.getResource_type()) {
		        case SystemCommonValue.RESOURCE_CATEGORY_VIDEO:
		            video_list.add(resource);
		            break;
		        case SystemCommonValue.RESOURCE_CATEGORY_BOOK:
		            book_list.add(resource);
		            break;
		        }
		        allres.add(resource);
		    }

		    String pic_json = (String) request.getAttribute("pic_json");
		    Gson gson_pic = new Gson();
		    JsonObject rootJson_pic = new JsonParser().parse(pic_json).getAsJsonObject();
		    JsonArray pic_list = rootJson_pic.get("pic").getAsJsonArray();
		    ArrayList<PictureBean> piclist = new ArrayList<PictureBean>();
		    for (JsonElement jsonElement : pic_list) {
		        JsonObject jo = jsonElement.getAsJsonObject();
		        PictureBean picture = gson.fromJson(jo, PictureBean.class);
		        piclist.add(picture);
		    }
		%>

		<!-- 推荐资源-->
		<div class="section bg-white">
			<div class=" p-b-60">
				<!-- 大标题 -->
				<div class="section grey p-t-20  p-b-20 m-b-50">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<h2 class="semi-bold">根据您的成绩帮您智能推荐下列资源！</h2>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="container">
					<div class="portfolio-grid portfolioContainer ">
						<ul id="thumbs" class="col3">
							<%
							    for (ResourceBean bean : allres) {
							%>
							<!-- item -->
							<li class="item web">
								<div class="portfolio-image-wrapper">
									<%
									    for (PictureBean pics : piclist) {
									            int is = bean.getResource_picture_id().compareTo(pics.getPicture_id());
									            if (is == 0) {
									                String pic_urls = basePath + pics.getPicture_img();
									%>
									<a href="<%=bean.getResource_detail()%>" target="_blank"> <img
										src="<%=pic_urls%>" width="531" hight="387" alt="" />
									</a>
									<%
									    break;
									            }
									        }
									%>
									<!-- 鼠标停留覆盖栏 -->
									<div class="item-info-overlay">
										<div>
											<p class="project-description p-t-20 linethree"><%=bean.getResource_caption()%></p>
											<p class="project-description">
												更新时间：<%=bean.getResource_addtime()%></p>
										</div>
									</div>
								</div> <!-- 说明 -->
								<div class="item-info">
									<a href="<%=bean.getResource_detail()%>" target="_blank">
										<h4 class="text-dark no-margin p-t-10 title semi-bold">
											<%
											    if (bean.getResource_type() == SystemCommonValue.RESOURCE_CATEGORY_VIDEO) {
											%>(视频)<%
											    } else if (bean.getResource_type() == SystemCommonValue.RESOURCE_CATEGORY_BOOK) {
											%>(书籍)<%
											    }
											%><%=bean.getResource_name()%></h4>
									</a>
									<p>更新时间：<%=bean.getResource_addtime()%></p>
								</div>
								<div class="clearfix"></div>
							</li>
							<%
							    }
							%>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!--联系我们div块-->
		<div class="section black contact-details green-icons">
			<div class="container">
				<div class="row">
					<!--联系方式1-->
					<div class="col-md-3 text-center">
						<div class="services-box-3">
							<!-- 图标库引用图标 -->
							<i class="fa fa-phone"></i>
							<div class="content">
								<p>
								驿站热线</p>
								<h3>
								+86 187 360 XXXXX</h3>
							</div>
						</div>
					</div>

					<!--联系方式2-->
					<a href="https://mail.qq.com/" target="_blank">
						<div class="col-md-3 text-center">
							<div class="services-box-3">
								<i class="fa fa-envelope"></i>
								<div class="content">
									<p>
									飞鸽传书</p>
									<h3>
									846***723@qq.com</h3>
								</div>
							</div>
						</div>
					</a>

					<!--联系方式3-->
					<a href="https://map.baidu.com/" target="_blank">
						<div class="col-md-3 text-center">
							<div class="services-box-3">
								<i class="fa fa-map-marker "></i>
								<div class="content">
									<p>
									线下交流</p>
									<h3>
									XX市，XX区，XX大厦</h3>
								</div>
							</div>
						</div>
					</a>

					<!--联系方式4-->
					<a href="https://weibo.com/" target="_blank">
						<div class="col-md-3 text-center">
							<div class="services-box-3">
								<i class="fa fa-heart"></i>
								<div class="content">
									<p>
										新浪微博
									</p>
									<h3>
									知识森驿站</h3>
								</div>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<!-- footer块 -->
		<div class="section white footer">
			<div class="container">
				<div class="p-t-30 p-b-50">
					<div class="row">
						<div class="col-md-2 col-lg-2 col-sm-2 col-xs-12 xs-m-b-20">
							<img src="images/logo_black.png" alt="" data-src="images/logo_black.png"
							data-src-retina="images/logo_black.png" width="119" height="22" />
							<br />
							<br />
							© 知识森林网络事业部
							<br />
						</div>
						<div class="col-md-4 col-lg-3 col-sm-4  col-xs-12 xs-m-b-20">
							<address class="xs-no-padding  col-md-6 col-lg-6 col-sm-6  col-xs-12">
								北京市 海淀区<br>
								中关村<br>
								中国(China)
							</address>
							<div class="xs-no-padding col-md-6 col-lg-6 col-sm-6">
								<div>
									<a href="http://www.beian.gov.cn/portal/index?token=cc32e26d-5cfa-4df2-bb3c-93484830be8d">京公安网备005xxxXxxxxx774号</a></div>
									<a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action">京ICP备xxx0xxx2号</a>
								</div>
								<div class="clearfix">
								</div>
							</div>
							<div class="col-md-2 col-lg-2 col-sm-2  col-xs-12 xs-m-b-20">
								<div class="bold">
								违法和不良信息举报电话：185-0130-1238</div>
								<a href="javascript:">京网文[2018]XXX9-XXX9号 </a>
							</div>
							<div class="col-md-2 col-lg-2 col-sm-2  col-xs-12 ">
								<div class="bold">
								意见反馈</div>
								<br />
								<a href="#">联系我们</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jquery支持 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript">
		(function() {
                // We must use JS as we need to select previous
                // elements which can't be done with CSS.
                $('.score-skew-title').children('span').hover((function() {
                	var $el, n;
                	$el = $(this);
                	n = $el.index() + 1;
                	$el.addClass('flat');
                	if (n % 2 === 0) {
                		return $el.prev().addClass('flat');
                	} else {
                		if (!$el.hasClass('last')) {
                			return $el.next().addClass('flat');
                		}
                	}
                }), function() {
                	return $('.flat').removeClass('flat');
                });
            }).call(this);
        </script>
        
        
        <!-- bootstrap js支持 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
        <!-- 动画支持 -->
        <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/pace/pace.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/jquery-unveil/jquery.unveil.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/modernizr.custom.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/waypoints.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/jquery-nicescroll/jquery.nicescroll.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/jquery-isotope/jquery.isotope.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/js/core.js"></script>
    </body>
    </html>
