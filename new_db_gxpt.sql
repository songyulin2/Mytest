INSERT INTO "db_gxpt"."t_si_job" VALUES ('1451fedf0b7c49b387faa51431c9d4c5', 'getRecordContentByHttp', '通过HTTP请求获取庭审点播案件笔录', '通过HTTP请求获取庭审点播案件笔录', null, '1.0', '<?xml version="1.0" encoding="UTF-8"?>
<job>
    <!--配置的接口名称 -->
	<bs>getRecordContentByHttp</bs>
	<name>通过HTTP请求获取庭审点播案件笔录</name>
	<description>通过HTTP请求获取庭审点播案件笔录</description>
	<job_version>1.0</job_version>
	<created_user>fmz</created_user>
	<entries>
		<entry>
			<name>START</name>
			<description />
			<type>SPECIAL</type>
		</entry>
        <!-- 获取上次执行时间 -->
    <entry>
		  <name>GET_JXSJ</name>
		  <description>获取上次执行时间</description>
		  <type>EXTEND_JAVA_CLASS</type>
		  <className>com.thunisoft.drsp.exchange.entry.ISwapCommonService</className>  <!-- 类名称或者spring bean 名称 -->
		  <springBeanName>swapCommonService</springBeanName>
		  <classType>2</classType>  <!-- 类类型  1为普通类 2为springbean -->
		  <function>               <!-- 函数配置 -->
		    <name>getYwLastStartTime</name>          <!-- 名称 -->
		    <params>
		       <param>
		         <paramType>java.lang.String</paramType> <!-- 参数类型 -->
		         <paramValue>            <!-- 参数值 -->
		           <type>2</type>        <!-- 值类型2:默认值1:从上步的entityId和memberId获取 -->
		           <defaultValue>F7B6A68FDD0CD0D4128BFF22335D59D3</defaultValue>
		         </paramValue>
		       </param>
		    </params>
		  </function>
		  <outputParam>
            <dataSource entityId="EXTEND_JAVA_CLASS">
                <memberId>ReturnValue</memberId>
                </dataSource>
            </outputParam>
		</entry>
		<entry>
			<name>LOADDATA</name>
			<description>加载数据</description>
      <isPage>N</isPage>
      <isBreakNoData>Y</isBreakNoData>
      <filterEntityids>7f178bc788e90781b253c53768dc124c,0684ea57f95c1b76d2f96181fef111e8,a57637b3c943adfa0c96c2964e976812</filterEntityids>
			<whereParam>
				<param>
					<name>resourcesBh</name>
					<paramType>2</paramType>
					<value>713cc4e5db06b55d7a7e934ab17c1d3d</value>
				</param>
        <!-- 最后更新时间大于上次执行时间 -->
        <param>
            <name>92a3049e8792264940f2ecc3e91f2867</name>
            <paramType>1</paramType>
            <expression>grant</expression>
            <value>
               <entityId>EXTEND_JAVA_CLASS</entityId>
               <memberId>ReturnValue</memberId>
            </value>
        </param>
			</whereParam>
			<type>LOADDATA</type>
		</entry>
		<entry>
			<name>getDataByEntity</name>
			<description>根据父实体获取数据</description>
			<type>getDataByEntity</type>
			<parameters>
				<parameter>
					<name>sourceEntityId</name>
					<default_value>713cc4e5db06b55d7a7e934ab17c1d3d</default_value>
				</parameter>
				<parameter>
					<name>jobBs</name>
					<default_value>getRecordContent</default_value>
				</parameter>
				<parameter>
					<name>targetEntityId</name>
					<default_value>a57637b3c943adfa0c96c2964e976812</default_value>
				</parameter>
			</parameters>	
		</entry>
		<entry>
			<name>DEALDATASET</name>
			<type>DEALDATASET</type>
			<description>处理数据</description>
			<deals>
				<deal>
					<dealType>1</dealType><!-- 1为添加或修改2为删除 -->
					<entityId>a57637b3c943adfa0c96c2964e976812</entityId>
					<memberId>d1c4d76e76ea8cd92441b8846d878eb3</memberId>
					<param>
						<paramType>2</paramType>
						<value>#nowDate</value>
					</param>
					<dataType>date</dataType>
				</deal>
			</deals>
		</entry>
		<!--更新基线时间 -->
		<entry>
			<name>ExcuteSQL</name>
			<description>执行SQL</description>
			<type>ExcuteSQL</type>
			<sqls>
			  <sql>
			  	<!-- where n_ywlx = ?  -->
			    <sql>update db_gxpt.T_SWAP_JXB set d_last_log_date = ? where c_ywlx = ?  </sql>
			    <dataSource>dataSource</dataSource>
			    <param>
               <paramType>2</paramType>
               <dataType>D</dataType>
               <value>#nowDate</value>
          </param>
          <param>
               <paramType>2</paramType>
               <dataType>S</dataType>
               <value>F7B6A68FDD0CD0D4128BFF22335D59D3</value>
          </param>
			  </sql>
			</sqls>
		</entry>
		<entry>
			<name>SUCCESS</name>
			<description />
			<type>SUCCESS</type>
		</entry>
	</entries>
	<hops>
		<hop>
			<from>START</from>
			<to>GET_JXSJ</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>GET_JXSJ</from>
			<to>LOADDATA</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>LOADDATA</from>
			<to>getDataByEntity</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>getDataByEntity</from>
			<to>DEALDATASET</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>DEALDATASET</from>
			<to>ExcuteSQL</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>ExcuteSQL</from>
			<to>SUCCESS</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
	</hops>
</job>



', '2018-02-07 15:57:43.712', 'fmz', null, null, null);


INSERT INTO "db_gxpt"."t_si_job" VALUES ('9aeb8d49395a4727a0631f654ef1ed8f', 'getCaseInfo', '案件基本信息', 'getCaseInfo', null, '1.0', '<?xml version="1.0" encoding="UTF-8"?>
<job>
	<!--配置的接口名称 -->
	<bs>getCaseInfo</bs>
	<name>案件基本信息</name>
	<description>getCaseInfo</description>
	<job_version>1.0</job_version>
	<created_user>fmz</created_user>
	<entries>
		<entry>
			<name>START</name>
			<description />
			<type>SPECIAL</type>
		</entry>
		<!-- 获取上次执行时间 -->
		<entry>
			<name>GET_JXSJ</name>
			<description>获取上次执行时间</description>
			<type>EXTEND_JAVA_CLASS</type>
			<className>com.thunisoft.drsp.exchange.entry.ISwapCommonService</className>  <!-- 类名称或者spring bean 名称 -->
			<springBeanName>swapCommonService</springBeanName>
			<classType>2</classType>  <!-- 类类型  1为普通类 2为springbean -->
			<function>               <!-- 函数配置 -->
				<name>getYwLastStartTime</name>          <!-- 名称 -->
				<params>
					<param>
						<paramType>java.lang.String</paramType> <!-- 参数类型 -->
						<paramValue>            <!-- 参数值 -->
							<type>2</type>        <!-- 值类型2:默认值1:从上步的entityId和memberId获取 -->
							<defaultValue>0A46064F746560363FCA410CA9BD4B99</defaultValue>
						</paramValue>
					</param>
				</params>
			</function>
			<outputParam>
				<dataSource entityId="GET_JXSJ">
					<memberId>ReturnValue</memberId>
				</dataSource>
			</outputParam>
		</entry>
		<entry>
			<name>httpclient</name>
			<description>http调用</description>
			<type>httpclient</type>
			<parameters>
				<parameter>
					<name>httpOperateType</name>
					<!--推送1 拉取2 自定义3-->
					<default_value>2</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>requestMethod</name>
					<!--get1 post2-->
					<default_value>2</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>paramTransferType</name>
					<!--body1 form2-->
					<default_value>1</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>mediaType</name>
					<default_value>application/json</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>isPage</name>
					<!--yes 1 no 2 -->
					<default_value>true</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>responseType</name>
					<!--json1 xml2 stream3-->
					<default_value>1</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>url</name>
					<default_value>http://172.16.52.160:6120/cas-zhptInterface/DataExtraction</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>strBody</name>
					<type>String</type>
					<loadType>runtime</loadType>
					<innerParamters>
						<innerParamter>
							<name>Param</name>
							<type>json</type>
							<innerParamters>
								<innerParamter>
									<name>Version</name>
									<default_value>1.0</default_value>
									<type>String</type>
								</innerParamter>
								<innerParamter>
									<name>SecurityInfo</name>
									<type>json</type>
									<innerParamters>
										<innerParamter>
											<name>Timestamp</name>
											<type>Timestamp</type>
											<!-- 上下文参数key -->
											<contextkey>Timestamp</contextkey>
										</innerParamter>
										<innerParamter>
											<name>Code</name>
											<type>MD5</type>
											<!--MD5参数-->
											<innerParamters>
												<innerParamter>
													<type>String</type>
													<default_value>testcode</default_value>
												</innerParamter>
												<innerParamter>
													<type>long</type>
													<default_value>
														<!--1表示可以上下文环境参数，2表示使用其他entry中值-->
														<type>1</type>	
														<contextkey>Timestamp</contextkey>
													</default_value>
												</innerParamter>
											</innerParamters>
										</innerParamter>
									</innerParamters>
								</innerParamter>
								<innerParamter>
									<name>InterfaceName</name>
									<default_value>getOnDemandList</default_value>
									<type>String</type>
								</innerParamter>
								<innerParamter>
									<name>RequestParam</name>
									<type>json</type>
									<innerParamters>
										<innerParamter>
											<name>CorpCode</name>
											<default_value>100</default_value>
											<type>String</type>
											<contextkey>CorpCode</contextkey>
										</innerParamter>
										<innerParamter>
											<name>IsContainData</name>
											<default_value>true</default_value>
											<type>String</type>
											<contextkey>IsContainData</contextkey>
										</innerParamter>
										<innerParamter>
											<name>SearchParams</name>
											<type>json</type>
											<innerParamters>
												<innerParamter>
													<name>KtsjStart</name>
													<type>entity</type>
													<default_value>
														<!--1表示可以上下文环境参数，2表示使用其他entry中值-->
														<type>2</type>	
														<fromEntityId>GET_JXSJ</fromEntityId>
														<fromMemberId>ReturnValue</fromMemberId>
														<description>开庭时间</description>
													</default_value>
												</innerParamter>
											</innerParamters>
										</innerParamter>
										<innerParamter>
											<name>PageInfo</name>
											<type>json</type>
											<innerParamters>
												<innerParamter>
													<name>PageNumber</name>
													<default_value>{pageNumber}</default_value>
													<type>String</type>
												</innerParamter>
												<innerParamter>
													<name>PageSize</name>
													<default_value>100</default_value>
													<type>int</type>
												</innerParamter>
											</innerParamters>
										</innerParamter>
									</innerParamters>
								</innerParamter>
							</innerParamters>
						</innerParamter>
					</innerParamters>
				</parameter>
				<parameter>
					<!-- 返回结果配置-->
					<name>responseParseConfig</name>
					<default_value>Data/OnDemandList</default_value>
					<type>String</type>
				</parameter>
				<parameter>
			    <!-- 返回数量配置-->
					<name>responseCountParseConfig</name>
					<default_value>Data/count</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<!-- 返回替换配置，请求参数中有，需要将参数设置到返回结果中 
					 // 一共需要2个参数 第一个参数是上下文key；第二个参数是放置json串的路径，
					 // 其中第二个参数最后一个分隔符后面设置json的key 
					 CorpCode表示上下文的key，对应配置文件中contextkey
					 CourtRooms/CorpCode表示json路径，既放到CourtRooms下的CorpCode属性
					 -->
					<name>responseRelaceParseConfig</name>
					<type>String</type>
					<default_value>CorpCode/data/OnDemandList/CaseInfo/CorpCode</default_value>
				</parameter>
				<!--
				<parameter>
					<name>startPage</name>
					<value>
						<type>3</type>	
						<fromEntityId>customJob</fromEntityId>
						<fromMemberId>startPage</fromMemberId>
					</value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>sj</name>
					<value>
						<type>2</type>	
						<fromEntityId>customJob</fromEntityId>
						<fromMemberId>startDate</fromMemberId>
					</value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>responseRelaceParseConfig</name>
					<type>String</type>
					<innerParamters>
						<innerParamter>
							<type>String</type>
							<default_value>
								<type>1</type>
								<contextkey>Timestamp</contextkey>
							</default_value>
						</innerParamter>
					</innerParamters>
				</parameter>
				-->
			</parameters>	
		</entry>
		<entry>
			<name>json2xml</name>
			<description>json数据转换xml数据</description>
			<type>EXTEND_JAVA_CLASS</type>
			<className>com.thunisoft.drsp.resource.entrys.http.util.HttpClientJsonUtil</className>  <!-- 类名称或者spring bean 名称 -->
			<classType>1</classType>  <!-- 类类型  1为普通类 2为springbean -->
			<function>               <!-- 函数配置 -->
				<name>json2Xml</name>          <!-- 名称 -->
				<params>
					<param>
						<paramType>java.lang.String</paramType>
						<paramValue>
							<type>1</type>
							<fromEntityId>drspCustomJob</fromEntityId>
							<fromMemberId>result</fromMemberId>
						</paramValue>
					</param>
					<param>
						<paramType>java.lang.String</paramType>
						<paramValue>
							<type>1</type>
							<fromEntityId>drspCustomJob</fromEntityId>
							<fromMemberId>autoReplace</fromMemberId>
						</paramValue>
					</param>
				</params>
			</function>
		</entry>
		<entry>
			<name>PARSEXML</name>
			<description>解析XML</description>
			<type>PARSEXML</type>
			<validate>true</validate>
			<inputParamType>2</inputParamType>
			<inputParam>
				<parameters>
					<parameter>
						<name>XML_FILE_LIST</name>
					</parameter>
				</parameters>
				<relations>
					<relation>
						<name>XML_FILE_LIST</name>
						<fromEntityId>EXTEND_JAVA_CLASS</fromEntityId>
						<fromMemberId>ReturnValue</fromMemberId>
					</relation>
				</relations>
			</inputParam>
			<parameters>
				<parameter>
					<name>entityID</name>
					<default_value>7f178bc788e90781b253c53768dc124c</default_value>
					<description>主实体</description>
				</parameter>
				<parameter>
					<name>parseType</name>
					<default_value>OnDemandList</default_value>
					<description>解析类型</description>
				</parameter>
			</parameters>
		</entry>
		<!--更新基线时间 -->
<!--
		<entry>
			<name>ExcuteSQL</name>
			<description>执行SQL</description>
			<type>ExcuteSQL</type>
			<sqls>
				<sql>

					<sql>update db_gxpt.T_SWAP_JXB set d_last_log_date = ? where c_ywlx = ?  </sql>
					<dataSource>dataSource</dataSource>
					<param>
						<paramType>2</paramType>
						<dataType>D</dataType>
						<value>#nowDate</value>
					</param>
					<param>
						<paramType>2</paramType>
						<dataType>S</dataType>
						<value>5C625874CF594D72C2434F92EE2BEF16</value>
					</param>
				</sql>
			</sqls>
		</entry>
-->
		<entry>
			<name>SUCCESS</name>
			<description />
			<type>SUCCESS</type>
		</entry>
	</entries>
	<hops>
		<hop>
			<from>START</from>
			<to>GET_JXSJ</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>GET_JXSJ</from>
			<to>httpclient</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>httpclient</from>
			<to>json2xml</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>json2xml</from>
			<to>PARSEXML</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>PARSEXML</from>
<!--
			<to>ExcuteSQL</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>ExcuteSQL</from>
-->
			<to>SUCCESS</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
	</hops>
</job>


', '2018-02-07 17:24:03.768', 'fmz', null, null, null);



INSERT INTO "db_gxpt"."t_si_job" VALUES ('d493216e7d6248f084bd0fb67a9cf489', 'getRecordContent', '获取庭审点播案件笔录', '获取庭审点播案件笔录', null, '1.0', '<?xml version="1.0" encoding="UTF-8"?>
<job>
	<!--配置的接口名称 -->
	<bs>getRecordContent</bs>
	<name>获取庭审点播案件笔录</name>
	<description>获取庭审点播案件笔录</description>
	<job_version>1.0</job_version>
	<created_user>fmz</created_user>
	<entries>
		<entry>
			<name>START</name>
			<description />
			<type>SPECIAL</type>
		</entry>
		<entry>
			<name>httpclient</name>
			<description>http请求</description>
			<type>httpclient</type>
			<parameters>
				<parameter>
					<name>httpOperateType</name>
					<!--推送1 拉取2 自定义3-->
					<default_value>2</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>requestMethod</name>
					<!--get1 post2-->
					<default_value>2</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>paramTransferType</name>
					<!--body1 form2-->
					<default_value>1</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>mediaType</name>
					<default_value>application/json</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>isPage</name>
					<!--yes 1 no 2 -->
					<default_value>false</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>responseType</name>
					<!--json1 xml2 stream3-->
					<default_value>1</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>url</name>
					<default_value>http://172.16.52.160:6120/cas-zhptInterface/DataExtraction</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>strBody</name>
					<type>String</type>
					<loadType>runtime</loadType>
					<innerParamters>
						<innerParamter>
							<name>Param</name>
							<type>json</type>
							<innerParamters>
								<innerParamter>
									<name>Version</name>
									<default_value>1.0</default_value>
									<type>String</type>
								</innerParamter>
								<innerParamter>
									<name>SecurityInfo</name>
									<type>json</type>
									<innerParamters>
										<innerParamter>
											<name>Timestamp</name>
											<loadType>runtime</loadType>
											<type>Timestamp</type>
											<!-- 上下文参数key -->
											<contextkey>Timestamp</contextkey>
										</innerParamter>
										<innerParamter>
											<name>Code</name>
											<type>MD5</type>
											<!--MD5参数-->
											<innerParamters>
												<innerParamter>
													<type>String</type>
													<default_value>testcode</default_value>
												</innerParamter>
												<innerParamter>
													<type>long</type>
													<loadType>runtime</loadType>
													<default_value>
														<!--1表示可以上下文环境参数，2表示使用其他entry中值-->
														<type>1</type>	
														<contextkey>Timestamp</contextkey>
													</default_value>
												</innerParamter>
											</innerParamters>
										</innerParamter>
									</innerParamters>
								</innerParamter>
								<innerParamter>
									<name>InterfaceName</name>
									<default_value>getRecordContent</default_value>
									<type>String</type>
								</innerParamter>
								<innerParamter>
									<name>RequestParam</name>
									<type>json</type>
									<innerParamters>
										<innerParamter>
											<name>CorpCode</name>
											<default_value>100</default_value>
											<type>String</type>
											<contextkey>CorpCode</contextkey>
										</innerParamter>

										<innerParamter>
											<name>Cases</name>
											<type>jsonArray</type>
											<innerParamters>
												<innerParamter>
													<name>CaseId</name>
													<type>entity</type>
													<default_value>
														<!--1表示可以上下文环境参数，2表示使用其他entry中值-->
														<type>2</type>	
														<fromEntityId>713cc4e5db06b55d7a7e934ab17c1d3d</fromEntityId>
														<fromMemberId>d1013c989aeac20f23c002658d0f762f</fromMemberId>
														<description>CaseId-案件主键</description>
													</default_value>
												</innerParamter>
												<innerParamter>
													<name>RecortType</name>
													<type>String</type>
													<default_value>1</default_value>
												</innerParamter>
												<innerParamter>
													<name>Ktxh</name>
													<type>entity</type>
													<default_value>
														<!--1表示可以上下文环境参数，2表示使用其他entry中值-->
														<type>2</type>	
														<fromEntityId>713cc4e5db06b55d7a7e934ab17c1d3d</fromEntityId>
														<fromMemberId>1165ecf910ddbeea1fb18c79c1a05dda</fromMemberId>
														<description>开庭序号</description>
													</default_value>
												</innerParamter>
											</innerParamters>
										</innerParamter>

									</innerParamters>
								</innerParamter>
							</innerParamters>
						</innerParamter>
					</innerParamters>
				</parameter>
				<parameter>
					<!-- 返回结果配置-->
					<name>responseParseConfig</name>
					<default_value>Data/CaseRecords</default_value>
					<type>String</type>
				</parameter>
			</parameters>	
		</entry>
		<entry>
			<name>json2xml</name>
			<description>json数据转换xml数据</description>
			<type>EXTEND_JAVA_CLASS</type>
			<className>com.thunisoft.drsp.resource.entrys.http.util.HttpClientJsonUtil</className>  <!-- 类名称或者spring bean 名称 -->
			<classType>1</classType>  <!-- 类类型  1为普通类 2为springbean -->
			<function>               <!-- 函数配置 -->
				<name>json2Xml</name>          <!-- 名称 -->
				<params>
					<param>
						<paramType>java.lang.String</paramType>
						<paramValue>
							<type>1</type>
							<fromEntityId>drspCustomJob</fromEntityId>
							<fromMemberId>result</fromMemberId>
						</paramValue>
					</param>
				</params>
			</function>
		</entry>
		<entry>
			<name>PARSEXML</name>
			<description>解析XML</description>
			<type>PARSEXML</type>
			<inputParamType>2</inputParamType>
			<inputParam>
				<parameters>
					<parameter>
						<name>XML_FILE_LIST</name>
					</parameter>
				</parameters>
				<relations>
					<relation>
						<name>XML_FILE_LIST</name>
						<fromEntityId>EXTEND_JAVA_CLASS</fromEntityId>
						<fromMemberId>ReturnValue</fromMemberId>
					</relation>
				</relations>
			</inputParam>
			<parameters>
				<parameter>
					<name>entityID</name>
					<default_value>a57637b3c943adfa0c96c2964e976812</default_value>
					<description>主实体</description>
				</parameter>
				<parameter>
					<name>parseType</name>
					<default_value>CaseRecords</default_value>
					<description>解析类型</description>
				</parameter>
			</parameters>
		</entry>

        <!-- 更改D_ZHXGSJ -->
        <!-- 关联开庭信息外键 -->
        <!-- 关联发标代码 -->
        
		<entry>
			<name>DEALDATASET</name>
			<type>DEALDATASET</type>
			<description>处理数据</description>
			<deals>
				<deal>
					<dealType>1</dealType>
					<entityId>a57637b3c943adfa0c96c2964e976812</entityId>
					<memberId>5aad62a816e00adee0fd23fa3cf0e4e0</memberId>
					<param>
						<paramType>1</paramType>
						<value>
							<entityId>713cc4e5db06b55d7a7e934ab17c1d3d</entityId>
							<memberId>0717f09d3bd2aa8ddbc55c0ef65638d0</memberId>
						</value>
					</param>
					<dataType>string</dataType>
				</deal>
				<deal>
					<dealType>1</dealType>
					<entityId>a57637b3c943adfa0c96c2964e976812</entityId>
					<memberId>f1a8962629a86567f28eba6758b30b62</memberId>
					<param>
						<paramType>1</paramType>
						<value>
							<entityId>713cc4e5db06b55d7a7e934ab17c1d3d</entityId>
							<memberId>8f679d245e7a78221e21db7c0fdd7dc0</memberId>
						</value>
					</param>
					<dataType>string</dataType>
				</deal>
			</deals>
		</entry>

		<entry>
			<name>SUCCESS</name>
			<description />
			<type>SUCCESS</type>
		</entry>
	</entries>
	<hops>
		<hop>
			<from>START</from>
			<to>httpclient</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>httpclient</from>
			<to>json2xml</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>json2xml</from>
			<to>PARSEXML</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>PARSEXML</from>
			<to>DEALDATASET</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>

		<hop>
			<from>DEALDATASET</from>
			<to>SUCCESS</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>

	</hops>
</job>



', '2018-02-07 17:24:03.81', 'fmz', null, null, null);


INSERT INTO "db_gxpt"."t_si_job" VALUES ('63a932ae58774eb0acfea1e9313269da', 'getCourtScheduledInfoByHttp', '通过HTTP请求获取法庭预定信息', 'getCourtScheduledInfoByHttp', null, '1.0', '<?xml version="1.0" encoding="UTF-8"?>
<job>
    <!--配置的接口名称 -->
	<bs>getCourtScheduledInfoByHttp</bs>
	<name>通过HTTP请求获取法庭预定信息</name>
	<description>getCourtScheduledInfoByHttp</description>
	<job_version>1.0</job_version>
	<created_user>fmz</created_user>
	<entries>
		<entry>
			<name>START</name>
			<description />
			<type>SPECIAL</type>
		</entry>
   		<entry>
			<name>LOADDATA</name>
			<description>加载数据</description>
      <isPage>N</isPage>
      <isBreakNoData>Y</isBreakNoData>
			<whereParam>
				<param>
					<name>resourcesBh</name>
					<paramType>2</paramType>
                    <!-- 法院法庭信息实体编号 -->
					<value>5ea1d992b21cf9166adbb0cdaaa66424</value>
				</param>
        <!-- 最后更新时间大于上次执行时间 -->
        <!-- 开庭信息实体-D_ZHGXSJ成员编号 -->
        <!--
        <param>
            <name>ff6c0e19b18aab0a5d6b1881744f4bf1</name>
            <paramType>1</paramType>
            <expression>grant</expression>
            <value>
               <entityId>EXTEND_JAVA_CLASS</entityId>
               <memberId>ReturnValue</memberId>
            </value>
        </param>
        -->
			</whereParam>
			<type>LOADDATA</type>
		</entry>
		<entry>
			<name>getDataByEntity</name>
			<description>根据父实体获取数据</description>
			<type>getDataByEntity</type>
			<parameters>
				<parameter>
					<name>sourceEntityId</name>
                    <!-- 法庭信息实体标识 -->
					<default_value>5ea1d992b21cf9166adbb0cdaaa66424</default_value>
				</parameter>
				<parameter>
					<name>jobBs</name>
					<default_value>getCourtScheduledInfo</default_value>
				</parameter>
				<parameter>
					<name>targetEntityId</name>
                    <!-- 法庭预定信息实体标识 -->
					<default_value>0e3f58455d4cc329b7d698b8313d4dfc</default_value>
				</parameter>
			</parameters>	
		</entry>
        <!--
		<entry>
			<name>DEALDATASET</name>
			<type>DEALDATASET</type>
			<description>处理数据</description>
			<deals>
				<deal>
					<dealType>1</dealType>
					<entityId>a57637b3c943adfa0c96c2964e976812</entityId>
					<memberId>9d92df6b1ee8fa11655c5b9ac34005f0</memberId>
					<param>
						<paramType>2</paramType>
						<value>#nowDate</value>
					</param>
					<dataType>date</dataType>
				</deal>
			</deals>
		</entry>
        -->
		<!--更新基线时间 -->
		<entry>
			<name>ExcuteSQL</name>
			<description>执行SQL</description>
			<type>ExcuteSQL</type>
			<sqls>
			  <sql>
			  	<!-- where n_ywlx = ?  -->
			    <sql>update db_gxpt.T_SWAP_JXB set d_last_log_date = ? where c_ywlx = ?  </sql>
			    <dataSource>dataSource</dataSource>
			    <param>
               <paramType>2</paramType>
               <dataType>D</dataType>
               <value>#nowDate</value>
          </param>
          <param>
               <paramType>2</paramType>
               <dataType>S</dataType>
               <value>D5852F31C3E184CCC76F8A912AE92E43</value>
          </param>
			  </sql>
			</sqls>
		</entry>
		<entry>
			<name>SUCCESS</name>
			<description />
			<type>SUCCESS</type>
		</entry>
	</entries>
	<hops>
		<hop>
			<from>START</from>
			<to>LOADDATA</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
        <!--
		<hop>
			<from>GET_JXSJ</from>
			<to>LOADDATA</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
        -->
		<hop>
			<from>LOADDATA</from>
			<to>getDataByEntity</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>getDataByEntity</from>
			<to>ExcuteSQL</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
        <!--
		<hop>
			<from>DEALDATASET</from>
			<to>ExcuteSQL</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
        -->
		<hop>
			<from>ExcuteSQL</from>
			<to>SUCCESS</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
	</hops>
</job>


', '2018-02-07 15:57:43.673', 'fmz', null, null, null);


INSERT INTO "db_gxpt"."t_si_job" VALUES ('408e26696d394ebd91ef7a210b73a095', 'getCourtScheduledInfo', '法庭预定信息', 'getCourtScheduledInfo', null, '1.0', '<?xml version="1.0" encoding="UTF-8"?>
<job>
    <!--配置的接口名称 -->
	<bs>getCourtScheduledInfo</bs>
	<name>法庭预定信息</name>
	<description>getCourtScheduledInfo</description>
	<job_version>1.0</job_version>
	<created_user>fmz</created_user>
	<entries>
		<entry>
			<name>START</name>
			<description />
			<type>SPECIAL</type>
		</entry>
     <!-- 获取上次执行时间 -->
    <entry>
		  <name>GET_JXSJ</name>
		  <description>获取上次执行时间</description>
		  <type>EXTEND_JAVA_CLASS</type>
		  <className>com.thunisoft.drsp.exchange.entry.ISwapCommonService</className>  <!-- 类名称或者spring bean 名称 -->
		  <springBeanName>swapCommonService</springBeanName>
		  <classType>2</classType>  <!-- 类类型  1为普通类 2为springbean -->
		  <function>               <!-- 函数配置 -->
		    <name>getYwLastStartTime</name>          <!-- 名称 -->
		    <params>
		       <param>
		         <paramType>java.lang.String</paramType> <!-- 参数类型 -->
		         <paramValue>            <!-- 参数值 -->
		           <type>2</type>        <!-- 值类型2:默认值1:从上步的entityId和memberId获取 -->
		           <defaultValue>D5852F31C3E184CCC76F8A912AE92E43</defaultValue>
		         </paramValue>
		       </param>
		    </params>
		  </function>
		  <outputParam>
            <dataSource entityId="GET_JXSJ">
                <memberId>ReturnValue</memberId>
                </dataSource>
            </outputParam>
		</entry>

		<entry>
			<name>httpclient</name>
			<description>http请求</description>
			<type>httpclient</type>
			<parameters>
				<parameter>
					<name>httpOperateType</name>
					<!--推送1 拉取2 自定义3-->
					<default_value>2</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>requestMethod</name>
					<!--get1 post2-->
					<default_value>2</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>paramTransferType</name>
					<!--body1 form2-->
					<default_value>1</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>mediaType</name>
					<default_value>application/json</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>isPage</name>
					<!--yes 1 no 2 -->
					<default_value>false</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>responseType</name>
					<!--json1 xml2 stream3-->
					<default_value>1</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>url</name>
          <default_value>http://172.16.52.160:6120/cas-zhptInterface/DataExtraction</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>strBody</name>
					<type>String</type>
          <loadType>runtime</loadType>
					<innerParamters>
						<innerParamter>
							<name>Param</name>
							<type>json</type>
							<innerParamters>
								<innerParamter>
									<name>Version</name>
									<default_value>1.0</default_value>
									<type>String</type>
								</innerParamter>
								<innerParamter>
									<name>SecurityInfo</name>
									<type>json</type>
									<innerParamters>
										<innerParamter>
											<name>Timestamp</name>
											<loadType>runtime</loadType>
											<type>Timestamp</type>
											<!-- 上下文参数key -->
											<contextkey>Timestamp</contextkey>
										</innerParamter>
										<innerParamter>
											<name>Code</name>
											<type>MD5</type>
											<!--MD5参数-->
											<innerParamters>
												<innerParamter>
													<type>String</type>
													<default_value>testcode</default_value>
												</innerParamter>
												<innerParamter>
													<type>long</type>
													<loadType>runtime</loadType>
													<default_value>
														<!--1表示可以上下文环境参数，2表示使用其他entry中值-->
														<type>1</type>	
														<contextkey>Timestamp</contextkey>
													</default_value>
												</innerParamter>
											</innerParamters>
										</innerParamter>
									</innerParamters>
								</innerParamter>
								<innerParamter>
									<name>InterfaceName</name>
									<default_value>getCourtScheduledInfo</default_value>
									<type>String</type>
								</innerParamter>
								<innerParamter>
									<name>RequestParam</name>
									<type>json</type>
									<innerParamters>
										<innerParamter>
											<name>CorpCode</name>
											<default_value>100</default_value>
											<type>String</type>
											<contextkey>CorpCode</contextkey>
										</innerParamter>
										<innerParamter>
											<name>CourtRooms</name>
											<type>jsonArray</type>
											<innerParamters>
												<innerParamter>
													<name>CourtRoomId</name>
													<type>entity</type>
													<default_value>
														<!--1表示可以上下文环境参数，2表示使用其他entry中值-->
														<type>2</type>	
													<fromEntityId>5ea1d992b21cf9166adbb0cdaaa66424</fromEntityId>
													<fromMemberId>c2c96133137570d994be564a3d0b45dd</fromMemberId>
													<description>法庭主键</description>
													</default_value>
												</innerParamter>
											</innerParamters>
										</innerParamter>
										<innerParamter>
											<name>StartTime</name>
											<type>entity</type>
											<default_value>
											<!--1表示可以上下文环境参数，2表示使用其他entry中值-->
											<type>2</type>	
											<fromEntityId>GET_JXSJ</fromEntityId>
											<fromMemberId>ReturnValue</fromMemberId>
											<description>预定起始时间</description>
											</default_value>
										</innerParamter>
									</innerParamters>
								</innerParamter>
							</innerParamters>
						</innerParamter>
					</innerParamters>
				</parameter>
				<parameter>
					<!-- 返回结果配置-->
					<name>responseParseConfig</name>
          <default_value>Data/CourtScheduleds</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<!-- 返回替换配置，请求参数中有，需要将参数设置到返回结果中 
					 // 一共需要2个参数 第一个参数是上下文key；第二个参数是放置json串的路径，
					 // 其中第二个参数最后一个分隔符后面设置json的key 
					 CorpCode表示上下文的key，对应配置文件中contextkey
					 CourtRooms/CorpCode表示json路径，既放到CourtRooms下的CorpCode属性
					 -->
					<name>responseRelaceParseConfig</name>
					<type>String</type>
                    <default_value>CorpCode/data/CourtScheduleds/CorpCode</default_value>
				</parameter>
			</parameters>	
		</entry>
		<entry>
		  <name>json2xml</name>
		  <description>json数据转换xml数据</description>
		  <type>EXTEND_JAVA_CLASS</type>
		  <className>com.thunisoft.drsp.resource.entrys.http.util.HttpClientJsonUtil</className>  <!-- 类名称或者spring bean 名称 -->
		  <classType>1</classType>  <!-- 类类型  1为普通类 2为springbean -->
		  <function>               <!-- 函数配置 -->
			<name>json2Xml</name>          <!-- 名称 -->
			<params>
				<param>
					<paramType>java.lang.String</paramType>
					<paramValue>
						<type>1</type>
						<fromEntityId>drspCustomJob</fromEntityId>
						<fromMemberId>result</fromMemberId>
					</paramValue>
				</param>
				<param>
					<paramType>java.lang.String</paramType>
					<paramValue>
						<type>1</type>
						<fromEntityId>drspCustomJob</fromEntityId>
						<fromMemberId>autoReplace</fromMemberId>
					</paramValue>
				</param>
			</params>
		  </function>
		</entry>
		<entry>
			<name>PARSEXML</name>
			<description>解析XML</description>
			<type>PARSEXML</type>
			<inputParamType>2</inputParamType>
			<inputParam>
				<parameters>
					<parameter>
						<name>XML_FILE_LIST</name>
					</parameter>
				</parameters>
				<relations>
					<relation>
						<name>XML_FILE_LIST</name>
						<fromEntityId>EXTEND_JAVA_CLASS</fromEntityId>
						<fromMemberId>ReturnValue</fromMemberId>
					</relation>
				</relations>
			</inputParam>
			<parameters>
				<parameter>
					<name>entityID</name>
					<default_value>0e3f58455d4cc329b7d698b8313d4dfc</default_value>
					<description>主实体</description>
				</parameter>
				<parameter>
					<name>parseType</name>
          <default_value>CourtScheduledInfo</default_value>
					<description>解析类型</description>
				</parameter>
			</parameters>
		</entry>
        <!-- 更改D_ZHXGSJ -->
        <!-- 关联开庭信息外键 -->
        <!-- 关联发标代码 -->
        <!--
		<entry>
			<name>DEALDATASET</name>
			<type>DEALDATASET</type>
			<description>处理数据</description>
			<deals>
				<deal>
					<dealType>1</dealType>
					<entityId>a57637b3c943adfa0c96c2964e976812</entityId>
					<memberId>9d92df6b1ee8fa11655c5b9ac34005f0</memberId>
					<param>
						<paramType>2</paramType>
						<value>#nowDate</value>
					</param>
					<dataType>date</dataType>
				</deal>
				<deal>
					<dealType>1</dealType>
					<entityId>a57637b3c943adfa0c96c2964e976812</entityId>
					<memberId>5aad62a816e00adee0fd23fa3cf0e4e0</memberId>
					<param>
						<paramType>1</paramType>
						<value>
							<entityId>713cc4e5db06b55d7a7e934ab17c1d3d</entityId>
							<memberId>0717f09d3bd2aa8ddbc55c0ef65638d0</memberId>
						</value>
					</param>
					<dataType>string</dataType>
				</deal>
				<deal>
					<dealType>1</dealType>
					<entityId>a57637b3c943adfa0c96c2964e976812</entityId>
					<memberId>f1a8962629a86567f28eba6758b30b62</memberId>
					<param>
						<paramType>1</paramType>
						<value>
							<entityId>713cc4e5db06b55d7a7e934ab17c1d3d</entityId>
							<memberId>8f679d245e7a78221e21db7c0fdd7dc0</memberId>
						</value>
					</param>
					<dataType>string</dataType>
				</deal>
			</deals>
		</entry>
        -->
		<entry>
			<name>SUCCESS</name>
			<description />
			<type>SUCCESS</type>
		</entry>
	</entries>
	<hops>
		<hop>
			<from>START</from>
			<to>GET_JXSJ</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>GET_JXSJ</from>
			<to>httpclient</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>httpclient</from>
			<to>json2xml</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>json2xml</from>
			<to>PARSEXML</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>PARSEXML</from>
			<to>SUCCESS</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
        <!--
		<hop>
			<from>DEALDATASET</from>
			<to>SUCCESS</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
        -->
	</hops>
</job>


', '2018-02-07 17:24:03.641', 'fmz', null, null, null);


INSERT INTO "db_gxpt"."t_si_job" VALUES ('570b31c747dc4f68ae0d6895ab696e66', 'getTrialPublish', '开庭公告', 'getTrialPublish', null, '1.0', '<?xml version="1.0" encoding="UTF-8"?>
<job>
    <!--配置的接口名称 -->
	<bs>getTrialPublish</bs>
	<name>开庭公告</name>
	<description>getTrialPublish</description>
	<job_version>1.0</job_version>
	<created_user>fmz</created_user>
	<entries>
		<entry>
			<name>START</name>
			<description />
			<type>SPECIAL</type>
		</entry>
     <!-- 获取上次执行时间 -->
    <entry>
		  <name>GET_JXSJ</name>
		  <description>获取上次执行时间</description>
		  <type>EXTEND_JAVA_CLASS</type>
		  <className>com.thunisoft.drsp.exchange.entry.ISwapCommonService</className>  <!-- 类名称或者spring bean 名称 -->
		  <springBeanName>swapCommonService</springBeanName>
		  <classType>2</classType>  <!-- 类类型  1为普通类 2为springbean -->
		  <function>               <!-- 函数配置 -->
		    <name>getYwLastStartTime</name>          <!-- 名称 -->
		    <params>
		       <param>
		         <paramType>java.lang.String</paramType> <!-- 参数类型 -->
		         <paramValue>            <!-- 参数值 -->
		           <type>2</type>        <!-- 值类型2:默认值1:从上步的entityId和memberId获取 -->
                   <!-- 需要查询表t_swap_fs_config字段c_bh -->
		           <defaultValue>929030A622A06328FA1DEA04F3022EC4</defaultValue>
		         </paramValue>
		       </param>
		    </params>
		  </function>
		  <outputParam>
            <dataSource entityId="GET_JXSJ">
                <memberId>ReturnValue</memberId>
                </dataSource>
            </outputParam>
		</entry>
		<entry>
			<name>DEALDATASET</name>
			<type>DEALDATASET</type>
			<description>处理数据</description>
			<deals>
				<deal>
					<dealType>1</dealType>
					<entityId>DEALDATASET</entityId>
					<memberId>currentTime</memberId>
					<param>
						<paramType>2</paramType>
						<value>#nowDate</value>
					</param>
					<dataType>date</dataType>
				</deal>
			</deals>
		</entry>
		<entry>
			<name>httpclient</name>
			<description>http请求</description>
			<type>httpclient</type>
			<parameters>
				<parameter>
					<name>httpOperateType</name>
					<!--推送1 拉取2 自定义3-->
					<default_value>2</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>requestMethod</name>
					<!--get1 post2-->
					<default_value>2</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>paramTransferType</name>
					<!--body1 form2-->
					<default_value>1</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>mediaType</name>
					<default_value>application/json</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>isPage</name>
					<!--yes 1 no 2 -->
					<default_value>false</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>responseType</name>
					<!--json1 xml2 stream3-->
					<default_value>1</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>url</name>
          <default_value>http://172.16.52.160:6120/cas-zhptInterface/DataExtraction</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>strBody</name>
					<type>String</type>
          <loadType>runtime</loadType>
					<innerParamters>
						<innerParamter>
							<name>Param</name>
							<type>json</type>
							<innerParamters>
								<innerParamter>
									<name>Version</name>
									<default_value>1.0</default_value>
									<type>String</type>
								</innerParamter>
								<innerParamter>
									<name>SecurityInfo</name>
									<type>json</type>
									<innerParamters>
										<innerParamter>
											<name>Timestamp</name>
											<loadType>runtime</loadType>
											<type>Timestamp</type>
											<!-- 上下文参数key -->
											<contextkey>Timestamp</contextkey>
										</innerParamter>
										<innerParamter>
											<name>Code</name>
											<type>MD5</type>
											<!--MD5参数-->
											<innerParamters>
												<innerParamter>
													<type>String</type>
													<default_value>testcode</default_value>
												</innerParamter>
												<innerParamter>
													<type>long</type>
													<loadType>runtime</loadType>
													<default_value>
														<!--1表示可以上下文环境参数，2表示使用其他entry中值-->
														<type>1</type>	
														<contextkey>Timestamp</contextkey>
													</default_value>
												</innerParamter>
											</innerParamters>
										</innerParamter>
									</innerParamters>
								</innerParamter>
								<innerParamter>
									<name>InterfaceName</name>
									<default_value>getTrialPublish</default_value>
									<type>String</type>
								</innerParamter>
								<innerParamter>
									<name>RequestParam</name>
									<type>json</type>
									<innerParamters>
										<innerParamter>
											<name>CorpCode</name>
											<default_value>100</default_value>
											<type>String</type>
											<contextkey>CorpCode</contextkey>
										</innerParamter>
										<innerParamter>
											<name>StartTime</name>
											<type>entity</type>
											<default_value>
											<!--1表示可以上下文环境参数，2表示使用其他entry中值-->
											<type>2</type>	
											<fromEntityId>GET_JXSJ</fromEntityId>
											<fromMemberId>ReturnValue</fromMemberId>
											<description>预计开庭时间开始</description>
											</default_value>
										</innerParamter>
                                        <innerParamter>
                                                <name>EndTime</name>
                                                <type>entity</type>
                                                <default_value>
                                                    <!--1表示可以上下文环境参数，2表示使用其他entry中值-->
                                                    <type>2</type>	
                                                    <fromEntityId>DEALDATASET</fromEntityId>
                                                    <fromMemberId>currentTime</fromMemberId>
                                                </default_value>
                                                <contextkey>EndTime</contextkey>
                                        </innerParamter>
									</innerParamters>
								</innerParamter>
							</innerParamters>
						</innerParamter>
					</innerParamters>
				</parameter>
				<parameter>
					<!-- 返回结果配置-->
					<name>responseParseConfig</name>
          <default_value>Data/TrialPublishes</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<!-- 返回替换配置，请求参数中有，需要将参数设置到返回结果中 
					 // 一共需要2个参数 第一个参数是上下文key；第二个参数是放置json串的路径，
					 // 其中第二个参数最后一个分隔符后面设置json的key 
					 CorpCode表示上下文的key，对应配置文件中contextkey
					 CourtRooms/CorpCode表示json路径，既放到CourtRooms下的CorpCode属性
					 -->
					<name>responseRelaceParseConfig</name>
					<type>String</type>
                    <default_value>CorpCode/data/TrialPublishes/CorpCode</default_value>
				</parameter>
			</parameters>	
		</entry>
		<entry>
		  <name>json2xml</name>
		  <description>json数据转换xml数据</description>
		  <type>EXTEND_JAVA_CLASS</type>
		  <className>com.thunisoft.drsp.resource.entrys.http.util.HttpClientJsonUtil</className>  <!-- 类名称或者spring bean 名称 -->
		  <classType>1</classType>  <!-- 类类型  1为普通类 2为springbean -->
		  <function>               <!-- 函数配置 -->
			<name>json2Xml</name>          <!-- 名称 -->
			<params>
				<param>
					<paramType>java.lang.String</paramType>
					<paramValue>
						<type>1</type>
						<fromEntityId>drspCustomJob</fromEntityId>
						<fromMemberId>result</fromMemberId>
					</paramValue>
				</param>
				<param>
					<paramType>java.lang.String</paramType>
					<paramValue>
						<type>1</type>
						<fromEntityId>drspCustomJob</fromEntityId>
						<fromMemberId>autoReplace</fromMemberId>
					</paramValue>
				</param>
			</params>
		  </function>
		</entry>
		<entry>
			<name>PARSEXML</name>
			<description>解析XML</description>
			<type>PARSEXML</type>
			<inputParamType>2</inputParamType>
			<inputParam>
				<parameters>
					<parameter>
						<name>XML_FILE_LIST</name>
					</parameter>
				</parameters>
				<relations>
					<relation>
						<name>XML_FILE_LIST</name>
						<fromEntityId>EXTEND_JAVA_CLASS</fromEntityId>
						<fromMemberId>ReturnValue</fromMemberId>
					</relation>
				</relations>
			</inputParam>
			<parameters>
				<parameter>
					<name>entityID</name>
					<default_value>3669cb9e4498ff4b9919ace0a8849ebc</default_value>
					<description>主实体</description>
				</parameter>
				<parameter>
					<name>parseType</name>
          <default_value>TrialPublishes</default_value>
					<description>解析类型</description>
				</parameter>
			</parameters>
		</entry>
        <!-- 更改D_ZHXGSJ -->
        <!-- 关联开庭信息外键 -->
        <!-- 关联发标代码 -->
        <!--
		<entry>
			<name>DEALDATASET</name>
			<type>DEALDATASET</type>
			<description>处理数据</description>
			<deals>
				<deal>
					<dealType>1</dealType>
					<entityId>a57637b3c943adfa0c96c2964e976812</entityId>
					<memberId>9d92df6b1ee8fa11655c5b9ac34005f0</memberId>
					<param>
						<paramType>2</paramType>
						<value>#nowDate</value>
					</param>
					<dataType>date</dataType>
				</deal>
				<deal>
					<dealType>1</dealType>
					<entityId>a57637b3c943adfa0c96c2964e976812</entityId>
					<memberId>5aad62a816e00adee0fd23fa3cf0e4e0</memberId>
					<param>
						<paramType>1</paramType>
						<value>
							<entityId>713cc4e5db06b55d7a7e934ab17c1d3d</entityId>
							<memberId>0717f09d3bd2aa8ddbc55c0ef65638d0</memberId>
						</value>
					</param>
					<dataType>string</dataType>
				</deal>
				<deal>
					<dealType>1</dealType>
					<entityId>a57637b3c943adfa0c96c2964e976812</entityId>
					<memberId>f1a8962629a86567f28eba6758b30b62</memberId>
					<param>
						<paramType>1</paramType>
						<value>
							<entityId>713cc4e5db06b55d7a7e934ab17c1d3d</entityId>
							<memberId>8f679d245e7a78221e21db7c0fdd7dc0</memberId>
						</value>
					</param>
					<dataType>string</dataType>
				</deal>
			</deals>
		</entry>
        -->
		<!--更新基线时间 -->
		<entry>
			<name>ExcuteSQL</name>
			<description>执行SQL</description>
			<type>ExcuteSQL</type>
			<sqls>
			  <sql>
			  	<!-- where n_ywlx = ?  -->
			    <sql>update db_gxpt.T_SWAP_JXB set d_last_log_date = ? where c_ywlx = ?  </sql>
			    <dataSource>dataSource</dataSource>
			    <param>
               <paramType>2</paramType>
               <dataType>D</dataType>
               <value>#nowDate</value>
          </param>
          <param>
               <paramType>2</paramType>
               <dataType>S</dataType>
               <value>929030A622A06328FA1DEA04F3022EC4</value>
          </param>
			  </sql>
			</sqls>
		</entry>
		<entry>
			<name>SUCCESS</name>
			<description />
			<type>SUCCESS</type>
		</entry>
	</entries>
	<hops>
		<hop>
			<from>START</from>
			<to>GET_JXSJ</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>GET_JXSJ</from>
			<to>DEALDATASET</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>DEALDATASET</from>
			<to>httpclient</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>httpclient</from>
			<to>json2xml</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>json2xml</from>
			<to>PARSEXML</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>PARSEXML</from>
			<to>ExcuteSQL</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>ExcuteSQL</from>
			<to>SUCCESS</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
	</hops>
</job>


', '2018-02-07 17:24:03.755', 'fmz', null, null, null);

INSERT INTO "db_gxpt"."t_si_job" VALUES ('2eebf913d93f4eb08d44fd9bacca24fb', 'getMediaServerState', '流媒体服务器状态', 'getMediaServerState', null, '1.0', '<?xml version="1.0" encoding="UTF-8"?>
<job>
	<!--配置的接口名称 -->
	<bs>getMediaServerState</bs>
	<name>流媒体服务器状态</name>
	<description>getMediaServerState</description>
	<job_version>1.0</job_version>
	<created_user>fmz</created_user>
	<entries>
		<entry>
			<name>START</name>
			<description />
			<type>SPECIAL</type>
		</entry>
		<entry>
			<name>httpclient</name>
			<description>http调用</description>
			<type>httpclient</type>
			<parameters>
				<parameter>
					<name>httpOperateType</name>
					<!--推送1 拉取2 自定义3-->
					<default_value>2</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>requestMethod</name>
					<!--get1 post2-->
					<default_value>2</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>paramTransferType</name>
					<!--body1 form2-->
					<default_value>1</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>mediaType</name>
					<default_value>application/json</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>isPage</name>
					<!--yes 1 no 2 -->
					<default_value>false</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>responseType</name>
					<!--json1 xml2 stream3-->
					<default_value>1</default_value>
					<type>int</type>
				</parameter>
				<parameter>
					<name>url</name>
					<default_value>http://172.16.52.160:6120/cas-zhptInterface/DataExtraction</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<name>strBody</name>
					<type>String</type>
					<innerParamters>
						<innerParamter>
							<name>Param</name>
							<type>json</type>
							<innerParamters>
								<innerParamter>
									<name>Version</name>
									<default_value>1.0</default_value>
									<type>String</type>
								</innerParamter>
								<innerParamter>
									<name>SecurityInfo</name>
									<type>json</type>
									<innerParamters>
										<innerParamter>
											<name>Timestamp</name>
											<type>Timestamp</type>
											<!-- 上下文参数key -->
											<contextkey>Timestamp</contextkey>
										</innerParamter>
										<innerParamter>
											<name>Code</name>
											<type>MD5</type>
											<!--MD5参数-->
											<innerParamters>
												<innerParamter>
													<type>String</type>
													<default_value>testcode</default_value>
												</innerParamter>
												<innerParamter>
													<type>long</type>
													<default_value>
														<!--1表示可以上下文环境参数，2表示使用其他entry中值-->
														<type>1</type>	
														<contextkey>Timestamp</contextkey>
													</default_value>
												</innerParamter>
											</innerParamters>
										</innerParamter>
									</innerParamters>
								</innerParamter>
								<innerParamter>
									<name>InterfaceName</name>
									<default_value>getMediaServerState</default_value>
									<type>String</type>
								</innerParamter>
								<innerParamter>
									<name>RequestParam</name>
									<type>json</type>
									<innerParamters>
										<innerParamter>
											<name>CorpCode</name>
											<default_value>100</default_value>
											<type>String</type>
											<contextkey>CorpCode</contextkey>
										</innerParamter>
									</innerParamters>
								</innerParamter>
							</innerParamters>
						</innerParamter>
					</innerParamters>
				</parameter>
				<parameter>
					<!-- 返回结果配置-->
					<name>responseParseConfig</name>
					<default_value>Data/MediaServers</default_value>
					<type>String</type>
				</parameter>
				<parameter>
					<!-- 返回替换配置，请求参数中有，需要将参数设置到返回结果中 
					 // 一共需要2个参数 第一个参数是上下文key；第二个参数是放置json串的路径，
					 // 其中第二个参数最后一个分隔符后面设置json的key 
					 CorpCode表示上下文的key，对应配置文件中contextkey
					 CourtRooms/CorpCode表示json路径，既放到CourtRooms下的CorpCode属性
					 -->
					<name>responseRelaceParseConfig</name>
					<type>String</type>
                    <default_value>CorpCode/data/MediaServers/CorpCode</default_value>
				</parameter>
			</parameters>	
		</entry>
		<entry>
			<name>json2xml</name>
			<description>json数据转换xml数据</description>
			<type>EXTEND_JAVA_CLASS</type>
			<className>com.thunisoft.drsp.resource.entrys.http.util.HttpClientJsonUtil</className>  <!-- 类名称或者spring bean 名称 -->
			<classType>1</classType>  <!-- 类类型  1为普通类 2为springbean -->
			<function>               <!-- 函数配置 -->
				<name>json2Xml</name>          <!-- 名称 -->
				<params>
					<param>
						<paramType>java.lang.String</paramType>
						<paramValue>
							<type>1</type>
							<fromEntityId>drspCustomJob</fromEntityId>
							<fromMemberId>result</fromMemberId>
						</paramValue>
					</param>
                     <param>
                            <paramType>java.lang.String</paramType>
                            <paramValue>
                                <type>1</type>
                                <fromEntityId>drspCustomJob</fromEntityId>
                                <fromMemberId>autoReplace</fromMemberId>
                            </paramValue>
                     </param>
				</params>
			</function>
		</entry>
		<entry>
			<name>PARSEXML</name>
			<description>解析XML</description>
			<type>PARSEXML</type>
			<validate>true</validate>
			<inputParamType>2</inputParamType>
			<inputParam>
				<parameters>
					<parameter>
						<name>XML_FILE_LIST</name>
					</parameter>
				</parameters>
				<relations>
					<relation>
						<name>XML_FILE_LIST</name>
						<fromEntityId>EXTEND_JAVA_CLASS</fromEntityId>
						<fromMemberId>ReturnValue</fromMemberId>
					</relation>
				</relations>
			</inputParam>
			<parameters>
				<parameter>
					<name>entityID</name>
					<default_value>512a2655a3a2ec865cb43285c5d0a5f0</default_value>
					<description>主实体</description>
				</parameter>
				<parameter>
					<name>parseType</name>
					<default_value>MediaServers</default_value>
					<description>解析类型</description>
				</parameter>
			</parameters>
		</entry>
		<entry>
			<name>SUCCESS</name>
			<description />
			<type>SUCCESS</type>
		</entry>
	</entries>
	<hops>
		<hop>
			<from>START</from>
			<to>httpclient</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>httpclient</from>
			<to>json2xml</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>json2xml</from>
			<to>PARSEXML</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
		<hop>
			<from>PARSEXML</from>
			<to>SUCCESS</to>
			<from_nr>0</from_nr>
			<to_nr>0</to_nr>
		</hop>
	</hops>
</job>

', '2018-01-29 16:46:21.778', 'fmz', null, null, null);







INSERT INTO "db_gxpt"."t_data_convert" VALUES ('2A056EEBF0A5E960363C9F28F07657C6', '音视频-存储资源状态', null, '77db7cdac806de1ebf86a17dd702cd4f', '', null, '1', '1', '1');
INSERT INTO "db_gxpt"."t_data_convert" VALUES ('4E938DED12366C6928BD2FEB6EFAC416', '音视频-点播案件笔录', null, 'a57637b3c943adfa0c96c2964e976812', '', null, '1', '1', '1');
INSERT INTO "db_gxpt"."t_data_convert" VALUES ('52D504CF7CE4C6A6DDD6B9E08F972C47', '音视频-法院人员', null, '83d686f5d88d6719a0d04ac69828bc44', '', null, '1', '1', '1');
INSERT INTO "db_gxpt"."t_data_convert" VALUES ('530062F5194D414470D7519B4ACC29FC', '音视频-流媒体服务器状态', null, '512a2655a3a2ec865cb43285c5d0a5f0', '', null, '1', '1', '1');
INSERT INTO "db_gxpt"."t_data_convert" VALUES ('6670A7489212AE3335636008C1125836', '音视频-开庭公告', null, '3669cb9e4498ff4b9919ace0a8849ebc', '', null, '1', '1', '1');
INSERT INTO "db_gxpt"."t_data_convert" VALUES ('BCBE0E4BD1F6341ED30B0D6BA4165515', '音视频-预定信息', null, '0e3f58455d4cc329b7d698b8313d4dfc', '', null, '1', '1', '1');
INSERT INTO "db_gxpt"."t_data_convert" VALUES ('EC11EDC634DDDD6B0007C286D3F4EDF6', '音视频-庭审案件基本信息', null, '7f178bc788e90781b253c53768dc124c', '', null, '1', '1', '1');
INSERT INTO "db_gxpt"."t_data_convert" VALUES ('ECC129F540CFA47F2F865FD9B8606038', '音视频-法院部门', null, 'd5d01775bbcc1b1bd94afcf1bbff3488', '', null, '1', '1', '1');
INSERT INTO "db_gxpt"."t_data_convert" VALUES ('F9C3186F13F89C0C51E17D6F936CB3A0', '音视频-法院法庭', null, '5ea1d992b21cf9166adbb0cdaaa66424', '', null, '1', '1', '1');




INSERT INTO "db_gxpt"."t_data_entity" VALUES ('09F74BA0E16B8E746288EEB567E22EEF', null, '4E938DED12366C6928BD2FEB6EFAC416', '点播案件笔录', 'a57637b3c943adfa0c96c2964e976812', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('660FC781E2B85890350E959EBB95CE4C', null, '2A056EEBF0A5E960363C9F28F07657C6', 'T_KJFT_ZTJK_CCZY', '77db7cdac806de1ebf86a17dd702cd4f', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('40432C5CE6ECFB7A1E13746287BD6CDF', null, '52D504CF7CE4C6A6DDD6B9E08F972C47', 'T_KJFT_FYRY', '83d686f5d88d6719a0d04ac69828bc44', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('5E36CC506770E221231B359745846CE6', null, '530062F5194D414470D7519B4ACC29FC', 'T_KJFT_ZTJK_LMT', '512a2655a3a2ec865cb43285c5d0a5f0', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('755BF154DA0B4235ACC57E49087A1762', null, '6670A7489212AE3335636008C1125836', '开庭公告', '3669cb9e4498ff4b9919ace0a8849ebc', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('E30F54B14572FA83B3735B6F2B976BB8', null, 'BCBE0E4BD1F6341ED30B0D6BA4165515', '预定信息', '0e3f58455d4cc329b7d698b8313d4dfc', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('4BA4DDF2E753E1323F5F4AC9B65388CC', '799CDC246A9E5EC87DE2AEFD890968B8', 'EC11EDC634DDDD6B0007C286D3F4EDF6', '案件审判组织', 'b13d0d76bef1136a1e2084a6d58db91b', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('6DDBB7B89C5B0CCA1A75EF9A2831BCB0', 'CD918C3B20D338C409249EEBCCBE257D', 'EC11EDC634DDDD6B0007C286D3F4EDF6', 'T_KJFT_AJ_BFFA', 'f52403a73f3828f52daf1e99b2fc640f', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('799CDC246A9E5EC87DE2AEFD890968B8', null, 'EC11EDC634DDDD6B0007C286D3F4EDF6', '庭审案件基本信息', '7f178bc788e90781b253c53768dc124c', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('7D6233BF2566FF2BF1344699A96BE8A7', '6DDBB7B89C5B0CCA1A75EF9A2831BCB0', 'EC11EDC634DDDD6B0007C286D3F4EDF6', 'T_KJFT_AJ_SPL', '86ca4f7cfc44550416887e3eba78e541', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('7F09E9E32A566128F4EA031A321B177C', '799CDC246A9E5EC87DE2AEFD890968B8', 'EC11EDC634DDDD6B0007C286D3F4EDF6', '案件开庭信息', '713cc4e5db06b55d7a7e934ab17c1d3d', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('CD918C3B20D338C409249EEBCCBE257D', '7F09E9E32A566128F4EA031A321B177C', 'EC11EDC634DDDD6B0007C286D3F4EDF6', 'T_KJFT_AJ_SPFD', '0684ea57f95c1b76d2f96181fef111e8', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('DE83C9FD77C2B466A01657CCE0E0E9C2', '799CDC246A9E5EC87DE2AEFD890968B8', 'EC11EDC634DDDD6B0007C286D3F4EDF6', '案件当事人', '2c1df88e17f43298431e53d5b3265717', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('86EB0D9689F1DE634CCF408466A05F7E', null, 'F9C3186F13F89C0C51E17D6F936CB3A0', 'T_KJFT_FYFT', '5ea1d992b21cf9166adbb0cdaaa66424', null);
INSERT INTO "db_gxpt"."t_data_entity" VALUES ('383CF712A195F709E4966CCDE42366A9', null, 'ECC129F540CFA47F2F865FD9B8606038', 'T_KJFT_FYBM', 'd5d01775bbcc1b1bd94afcf1bbff3488', null);



INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('b6656ad6e26d762f173859f96a479c2b', 'T_SWAP_COMMON', '交换通用文件', '1', '1bjgjrmfyhlw', '2017-12-05 21:34:04.350679', '2017-12-05 21:34:04.350679', '', 'D5728B14D009B1B8105C40DB6D30BA1A', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('a57637b3c943adfa0c96c2964e976812', 'T_KJFT_AJ_DBBL', '点播案件笔录', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('77db7cdac806de1ebf86a17dd702cd4f', 'T_KJFT_ZTJK_CCZY', 'T_KJFT_ZTJK_CCZY', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('83d686f5d88d6719a0d04ac69828bc44', 'T_KJFT_FYRY', 'T_KJFT_FYRY', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('512a2655a3a2ec865cb43285c5d0a5f0', 'T_KJFT_ZTJK_LMT', 'T_KJFT_ZTJK_LMT', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('3669cb9e4498ff4b9919ace0a8849ebc', 'T_KJFT_AJ_KTGG', '开庭公告', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('0e3f58455d4cc329b7d698b8313d4dfc', 'T_KJFT_AJ_YDXX', '预定信息', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('b13d0d76bef1136a1e2084a6d58db91b', 'T_KJFT_AJ_SPZZ', '案件审判组织', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('f52403a73f3828f52daf1e99b2fc640f', 'T_KJFT_AJ_BFFA', 'T_KJFT_AJ_BFFA', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('7f178bc788e90781b253c53768dc124c', 'T_KJFT_AJ_JBXX', '庭审案件基本信息', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('86ca4f7cfc44550416887e3eba78e541', 'T_KJFT_AJ_SPL', 'T_KJFT_AJ_SPL', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('713cc4e5db06b55d7a7e934ab17c1d3d', 'T_KJFT_AJ_KTXX', '案件开庭信息', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('0684ea57f95c1b76d2f96181fef111e8', 'T_KJFT_AJ_SPFD', 'T_KJFT_AJ_SPFD', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('2c1df88e17f43298431e53d5b3265717', 'T_KJFT_AJ_DSR', '案件当事人', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('5ea1d992b21cf9166adbb0cdaaa66424', 'T_KJFT_FYFT', 'T_KJFT_FYFT', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('d5d01775bbcc1b1bd94afcf1bbff3488', 'T_KJFT_FYBM', 'T_KJFT_FYBM', '1', '1bjgjrmfyhlw', null, null, null, '17EF3D6CDC480A5FC57A9F947F7CF059', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('d1b3da89c51692c7576153b1391ecad8', 'T_ATY_CODETYPE', 'T_ATY_CODETYPE', '1', '1bjgjrmfyhlw', null, null, null, '2536F46D10D385C8447A7135C81B2697', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('f0f5305bdfd6cc48be716296b35e16c3', 'T_ATY_CORP', 'T_ATY_CORP', '1', '1bjgjrmfyhlw', null, null, null, '123D58E2C95354C4178417FC27AB36F2', null);
INSERT INTO "db_gxpt"."t_md_entityinfo" VALUES ('f141b29dfabca5d00ed6c7f942e61b68', 'T_ATY_CODE', 'T_ATY_CODE', '1', '1bjgjrmfyhlw', null, null, null, 'E7CEFAE72C11E6FA6B2845E5A0D58584', null);




INSERT INTO "db_gxpt"."t_data_member"  VALUES ('008DF6349A4F84F5B053D807470E68A1', '4BA4DDF2E753E1323F5F4AC9B65388CC', '基本信息外键', 'b13d0d76bef1136a1e2084a6d58db91b', '985e2b583ce4330e6b8ff177d6f4aecd', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"3d2ccdd8c636cc14b322ae7184dd62d3\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"da39e408d803c878d76f26f237f98013\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('08360D3C07F8902BCCCF6C84B2D2FF32', 'DE83C9FD77C2B466A01657CCE0E0E9C2', '最后修改时间', '2c1df88e17f43298431e53d5b3265717', '206cd48be1c623a7253669851831e23c', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('147901FE7D2B026120D248C142CBBF35', '4BA4DDF2E753E1323F5F4AC9B65388CC', '案件ID', 'b13d0d76bef1136a1e2084a6d58db91b', 'da39e408d803c878d76f26f237f98013', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"2","executeType":"Default","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"839fbe5b8770aa5b45f0b6d9e4e6ea41\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('1923748AA849720CD2B9ED2971933B90', 'DE83C9FD77C2B466A01657CCE0E0E9C2', '主键', '2c1df88e17f43298431e53d5b3265717', '19d744e4f8a0d913c63a1327c220b4c5', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"369cc45b23d9df76504f937dc4e3bf8f\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"839fbe5b8770aa5b45f0b6d9e4e6ea41,98df20afd467fc7c2c917c2e544b8f54\\"}]"},{"convertDatas":[{"dataType":"result","dataName":"StringJoin1"}],"convertBs":"String","isChain":1,"executeType":"MD5","ruleId":""}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('1E6E7620BBBF4BD251191D5C72FB3DFB', '6DDBB7B89C5B0CCA1A75EF9A2831BCB0', '主键', 'f52403a73f3828f52daf1e99b2fc640f', 'c975764ee9b3ca67b01aed56b1ac231b', NULL, NULL, NULL, NULL, '[{"convertDatas":[{"dataType":"dataMember","dataName":"ac293ae5a6aa2d07c9f3735e16475f2b,5052bf8aa2f233d0fa4870f1b90a21db"}],"convertBs":"String","isChain":1,"executeType":"Join","ruleId":"","param":""},{"convertDatas":[{"dataType":"result","dataName":"StringJoin1"}],"convertBs":"String","isChain":1,"executeType":"MD5","ruleId":""}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('25932B49158A00A164D1E45A8FFD553F', '4BA4DDF2E753E1323F5F4AC9B65388CC', '审判组织成员外键', 'b13d0d76bef1136a1e2084a6d58db91b', '66cd66440127339c4633bf302a6f2f40', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"da39e408d803c878d76f26f237f98013,34432bfbcf098bd5c8181cde3e41f498\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('28343E7DD48E5569249AFFF820EC33E5', '799CDC246A9E5EC87DE2AEFD890968B8', '最后修改时间', '7f178bc788e90781b253c53768dc124c', '3b85c321f70587320572712c4acddcb8', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('2875BC8E06ABC8801A4C01FE5124A880', '799CDC246A9E5EC87DE2AEFD890968B8', '承办部门外键', '7f178bc788e90781b253c53768dc124c', '54a84b41c5641ff7d65cc6d8cc9d22af', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"369cc45b23d9df76504f937dc4e3bf8f\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"8a806d14a3368f594338dc08abb871dc\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('2AABBCB287FAC36AFC2EEC0C8B9D5BAB', '383CF712A195F709E4966CCDE42366A9', '最后修改时间', 'd5d01775bbcc1b1bd94afcf1bbff3488', 'b08affee656773ee1a9c5b10de5bfe36', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('39FD169EAE2C0A222C87CCFD398462A8', '86EB0D9689F1DE634CCF408466A05F7E', '主键', '5ea1d992b21cf9166adbb0cdaaa66424', 'fd7feb93ebc1aebba3b002419d31e90a', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"0701a5245d036e27903b5d26918a9d65,c2c96133137570d994be564a3d0b45dd\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('3C72B4B95D4AE043C6FED8DF7779D249', '4BA4DDF2E753E1323F5F4AC9B65388CC', '最后修改时间', 'b13d0d76bef1136a1e2084a6d58db91b', '10d3e68531c5836f7adbadf7aba0d045', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('4A70DD74243D322F1FBB0C726219AD24', '799CDC246A9E5EC87DE2AEFD890968B8', '承办人外键', '7f178bc788e90781b253c53768dc124c', 'a1f554173db148b835d49b754d2fce8b', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"369cc45b23d9df76504f937dc4e3bf8f\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"e2fe823c06cb7c9c6251d694a11765e4\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('4BE7B25FA2A7BFDB832CBBF1C9C53BB0', '799CDC246A9E5EC87DE2AEFD890968B8', '主键', '7f178bc788e90781b253c53768dc124c', '3219a002eca76039c05c00ffc5190043', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"369cc45b23d9df76504f937dc4e3bf8f\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"839fbe5b8770aa5b45f0b6d9e4e6ea41\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('5320B567A776F57CD03EE84D15D1EC72', '4BA4DDF2E753E1323F5F4AC9B65388CC', '主键', 'b13d0d76bef1136a1e2084a6d58db91b', '294c85bc13cd2b79067659a50d350737', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"3d2ccdd8c636cc14b322ae7184dd62d3\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"839fbe5b8770aa5b45f0b6d9e4e6ea41,34432bfbcf098bd5c8181cde3e41f498\\"}]"},{"convertDatas":[{"dataType":"result","dataName":"StringJoin1"}],"convertBs":"String","isChain":1,"executeType":"MD5","ruleId":""}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('550FBF5913F988D8FCA07A70DE6B983A', 'E30F54B14572FA83B3735B6F2B976BB8', '最后修改时间', '0e3f58455d4cc329b7d698b8313d4dfc', 'b982309d11f07517e90681a70cac9a69', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('582ED914FA7033AFE5FDC4C4864FC827', '7F09E9E32A566128F4EA031A321B177C', '法庭外键', '713cc4e5db06b55d7a7e934ab17c1d3d', 'e87dbfe5e05d610612dbf536dbb6d66a', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"8f679d245e7a78221e21db7c0fdd7dc0,af05cd0a7dfc28b7b26fb3f87166cdac\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('5874707A1676A5DEE040B3C429929A52', 'E30F54B14572FA83B3735B6F2B976BB8', '法庭外键', '0e3f58455d4cc329b7d698b8313d4dfc', '564d7049af050af1144b02f7e8f55027', NULL, NULL, NULL, NULL, '[{"convertDatas":[{"dataType":"dataMember","dataName":"ec7f1184004dcca2a716eefe1132dac4,097540916ebd98ef02d062a229ec3338"}],"convertBs":"String","isChain":1,"executeType":"Join","ruleId":"","param":""},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('5F5AFF62A3C39E730ACD2D61531285D0', 'E30F54B14572FA83B3735B6F2B976BB8', '书记员外键', '0e3f58455d4cc329b7d698b8313d4dfc', 'ecdf83e482076738a4431870f8900b7e', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"ec7f1184004dcca2a716eefe1132dac4,f8aa35770052dae60baf9eb628eb1d4b\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('60DF4365A059E12449B35D519CD07D69', '383CF712A195F709E4966CCDE42366A9', '主键', 'd5d01775bbcc1b1bd94afcf1bbff3488', '9cd0f4c80d95f1dcf3befb2da1c258dd', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"dd00e6f998b656f65b1df654cc1dc45a\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"52f29b73bc206fd060b1b921ac13a806\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('623157B794E7FD2CF44C02EDD889739E', '40432C5CE6ECFB7A1E13746287BD6CDF', '最后修改时间', '83d686f5d88d6719a0d04ac69828bc44', 'e61f1a835cbbd1671416975115fb458c', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('624ECC7C6C3CDB7CEEEEA2E2D33E69CD', '7D6233BF2566FF2BF1344699A96BE8A7', '主键', '86ca4f7cfc44550416887e3eba78e541', '199f3e035d1f47e4e9ee2fb87f4c883c', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"c975764ee9b3ca67b01aed56b1ac231b,30ab395fc65d69fe34ae9104138d6f24\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('63CE143499944E9398B46D0A62C090A6', '7F09E9E32A566128F4EA031A321B177C', '法标代码', '713cc4e5db06b55d7a7e934ab17c1d3d', '8f679d245e7a78221e21db7c0fdd7dc0', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"2","executeType":"Default","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"369cc45b23d9df76504f937dc4e3bf8f\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('66EFD99F66E91A022E7A920F4DDE62FC', 'CD918C3B20D338C409249EEBCCBE257D', '最后修改时间', '0684ea57f95c1b76d2f96181fef111e8', '042214bdd6b5324442d230389089b23b', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('6D1E74F7B26A07D09FB27D1BB06B7750', '40432C5CE6ECFB7A1E13746287BD6CDF', '主键', '83d686f5d88d6719a0d04ac69828bc44', '903e6679c13a5126a669fb1edc5a3f5e', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"cf74b48df66a931fad606e6e24521e58,384172f090719945949460cfdbf95b78\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('7B377B919E0EB58C89A977F2A56BC133', 'DE83C9FD77C2B466A01657CCE0E0E9C2', '法标代码', '2c1df88e17f43298431e53d5b3265717', 'b80b2c0fe203fb500816ac35ad8071b4', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"2","executeType":"Default","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"369cc45b23d9df76504f937dc4e3bf8f\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('7FB605AF50B643A3AFFC53FBCB269863', 'E30F54B14572FA83B3735B6F2B976BB8', '预订人外键', '0e3f58455d4cc329b7d698b8313d4dfc', 'c0373e8783f99da3b1e4524e318ca9c6', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"ec7f1184004dcca2a716eefe1132dac4,e7797de41b22ad072ef74eab4a1c4079\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('823CDF34571D025139660C9C6A5405D9', 'DE83C9FD77C2B466A01657CCE0E0E9C2', '基本信息外键', '2c1df88e17f43298431e53d5b3265717', '323eaf6d3ca162557823bf7340a9be49', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"b80b2c0fe203fb500816ac35ad8071b4\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"0f1776195cfbd521072377b827497be8\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('8420078D58A34803CF4084282A251884', 'DE83C9FD77C2B466A01657CCE0E0E9C2', '当事人外键', '2c1df88e17f43298431e53d5b3265717', '74ffa1cf193e1f7ba7bd67143574d81e', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"b80b2c0fe203fb500816ac35ad8071b4\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"98df20afd467fc7c2c917c2e544b8f54\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('8C1F5549909073E9A6299D788BD037D7', 'CD918C3B20D338C409249EEBCCBE257D', '主键', '0684ea57f95c1b76d2f96181fef111e8', 'ac293ae5a6aa2d07c9f3735e16475f2b', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"369cc45b23d9df76504f937dc4e3bf8f\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"839fbe5b8770aa5b45f0b6d9e4e6ea41,1165ecf910ddbeea1fb18c79c1a05dda,f142028c0e1748e678b93add42ea508e\\"}]"},{"convertDatas":[{"dataType":"result","dataName":"StringJoin1"}],"convertBs":"String","isChain":1,"executeType":"MD5","ruleId":""}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('8C2576A58EA518678821C1474D349BF5', '7F09E9E32A566128F4EA031A321B177C', '主键', '713cc4e5db06b55d7a7e934ab17c1d3d', '0717f09d3bd2aa8ddbc55c0ef65638d0', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"369cc45b23d9df76504f937dc4e3bf8f\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"839fbe5b8770aa5b45f0b6d9e4e6ea41,1165ecf910ddbeea1fb18c79c1a05dda\\"}]"},{"convertDatas":[{"dataType":"result","dataName":"StringJoin1"}],"convertBs":"String","isChain":1,"executeType":"MD5","ruleId":""}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('8CED9085F728C8E6A595300C84010B51', 'E30F54B14572FA83B3735B6F2B976BB8', '主键', '0e3f58455d4cc329b7d698b8313d4dfc', '1f6b052ab9e10fdc665a9e5c3e388d29', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"ec7f1184004dcca2a716eefe1132dac4\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"0f605f6bdd47e821b5a31c3c68f4a2d3,097540916ebd98ef02d062a229ec3338,01a5747b8d6ee7a9a2d1865026c6eb5b\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('9D5D70FE1BE2C8930228C9E542F8C8A7', '6DDBB7B89C5B0CCA1A75EF9A2831BCB0', '视频分段外键', 'f52403a73f3828f52daf1e99b2fc640f', 'f24674c2642b14b9ff2697309848ac86', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"ac293ae5a6aa2d07c9f3735e16475f2b\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('A11A776C5A8E08914271FD436E020FFC', 'E30F54B14572FA83B3735B6F2B976BB8', '承办人外键', '0e3f58455d4cc329b7d698b8313d4dfc', 'f6f71cb7b8c853fd3fc9f48b540a0ecf', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"ec7f1184004dcca2a716eefe1132dac4\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"faa9ab741ff66a83979a47bcd29f0d74\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('A414C2B83EB6864A233FB0A1DDFE3457', '755BF154DA0B4235ACC57E49087A1762', '主键', '3669cb9e4498ff4b9919ace0a8849ebc', '170202cb963cd605c61c14074f4f2823', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"a3b4d3949fb6c8b393247f353508f4a6\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"09d541fe82ba4584b1b34f1366d9a49c,ebedbe47384df883414d50c1904951ef,a966b94da8a9a86cb80fadda919da8dd,b5f47954d8e0414d012715210aa0eefe\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('AA3056E0B6A604E6F1C4B1A2F5E62E0E', 'E30F54B14572FA83B3735B6F2B976BB8', '基本信息外键', '0e3f58455d4cc329b7d698b8313d4dfc', 'd75727dd7261c5d3a12765cfbfb06eaa', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"ec7f1184004dcca2a716eefe1132dac4\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"0f605f6bdd47e821b5a31c3c68f4a2d3\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('ABAB749B882A77F557D333EDAC22C669', '86EB0D9689F1DE634CCF408466A05F7E', '最后修改时间', '5ea1d992b21cf9166adbb0cdaaa66424', '76fcc5d14e060c09bf01bb586a3f13e5', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('AC046E059D1A95138331A16E417417C4', '5E36CC506770E221231B359745846CE6', '最后修改时间', '512a2655a3a2ec865cb43285c5d0a5f0', 'd5164123d3ada68086183a76aa36f986', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('AD6A1056F3386616566C55236760D4BB', '40432C5CE6ECFB7A1E13746287BD6CDF', '法院部门外键', '83d686f5d88d6719a0d04ac69828bc44', 'f2d5800da0bcb61c76a031019830f303', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"cf74b48df66a931fad606e6e24521e58\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"8d5f9121e92393f90b1d9753a26c2109\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('AD6CB5B92F57F52FD8BF38876C8A7EB5', '755BF154DA0B4235ACC57E49087A1762', '最后修改时间', '3669cb9e4498ff4b9919ace0a8849ebc', '3685bdec90e3d7b4bc75d77913dbae4e', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('B26514B7608A4D604FBF06E557E3EB33', 'DE83C9FD77C2B466A01657CCE0E0E9C2', '案件ID', '2c1df88e17f43298431e53d5b3265717', '0f1776195cfbd521072377b827497be8', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"2","executeType":"Default","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"839fbe5b8770aa5b45f0b6d9e4e6ea41\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('B320306236CBC3162DF227EDAC014EB6', '7D6233BF2566FF2BF1344699A96BE8A7', '最后修改时间', '86ca4f7cfc44550416887e3eba78e541', '65c5f5fa1a17821640c8a9607c37c477', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('BCB434E64A2C41A842B98F03813FFB04', '7D6233BF2566FF2BF1344699A96BE8A7', '播放方案外键', '86ca4f7cfc44550416887e3eba78e541', '994d687f12bdd92a15c6eb589d52abec', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"c975764ee9b3ca67b01aed56b1ac231b\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('C02433DCB05A222FA57E2DDC1D7FF3BC', 'CD918C3B20D338C409249EEBCCBE257D', '开庭信息外键', '0684ea57f95c1b76d2f96181fef111e8', '248c42440ec4e3465fd3a4b5c140f3db', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"8f679d245e7a78221e21db7c0fdd7dc0\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"d1013c989aeac20f23c002658d0f762f,1165ecf910ddbeea1fb18c79c1a05dda\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('CA07F9AF547E4592475C6BA44D073BA4', '6DDBB7B89C5B0CCA1A75EF9A2831BCB0', '最后更新时间', 'f52403a73f3828f52daf1e99b2fc640f', '977a46e14f4f3b68dfa87dd65ffb6739', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('CE4FB421FFA1B5B57377D4243C386CDC', '7F09E9E32A566128F4EA031A321B177C', '案件ID', '713cc4e5db06b55d7a7e934ab17c1d3d', 'd1013c989aeac20f23c002658d0f762f', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"2","executeType":"Default","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"839fbe5b8770aa5b45f0b6d9e4e6ea41\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('D1188DD3795B3342BE7D81C9B67486E0', '660FC781E2B85890350E959EBB95CE4C', '最后修改时间', '77db7cdac806de1ebf86a17dd702cd4f', '94de5e311a2d4d1865f76b6768836e0e', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('D6EAA19AA0DF567E0F09698C8C95FA9F', '7F09E9E32A566128F4EA031A321B177C', '书记员外键', '713cc4e5db06b55d7a7e934ab17c1d3d', 'e21af96a2816be788b88333ab20d1f1b', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"8f679d245e7a78221e21db7c0fdd7dc0,5a176fad71935289fbdbc31c7c4fdac7\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('D875A4A79ACEEEDCF5570A653A6E0672', '7F09E9E32A566128F4EA031A321B177C', '最后修改时间', '713cc4e5db06b55d7a7e934ab17c1d3d', '92a3049e8792264940f2ecc3e91f2867', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('DE7615D2E3F95BCF30AE333E86E7D748', '7F09E9E32A566128F4EA031A321B177C', '基本信息外键', '713cc4e5db06b55d7a7e934ab17c1d3d', 'd46b69dfa3822362fd50d875026e0f99', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"8f679d245e7a78221e21db7c0fdd7dc0\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"d1013c989aeac20f23c002658d0f762f\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('E7AF317E6817BD407A4E0AC5399BCCD2', '4BA4DDF2E753E1323F5F4AC9B65388CC', '法标代码', 'b13d0d76bef1136a1e2084a6d58db91b', '3d2ccdd8c636cc14b322ae7184dd62d3', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"2","executeType":"Default","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"369cc45b23d9df76504f937dc4e3bf8f\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('EB8DE3AE77B128C29587098B2850BF22', '09F74BA0E16B8E746288EEB567E22EEF', '主键', 'a57637b3c943adfa0c96c2964e976812', '406018861b7537727d9b381ee1dbe2ab', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":"1","executeType":"Join","ruleId":"","expression":null,"dataSource":null,"param":"","sql":null,"convertDatas":"[{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"f1a8962629a86567f28eba6758b30b62\\"},{\\"dataType\\":\\"dataMember\\",\\"dataName\\":\\"0f9e3bb42ffce53df1159f6490ebea05,cb2b891ad20323c4d49a27fa836d3dae\\"},{\\"dataType\\":\\"default\\",\\"dataName\\":\\"1\\"}]"},{"convertBs":"String","isChain":"1","executeType":"MD5","ruleId":"","expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"result\\",\\"dataName\\":\\"StringJoin1\\"}]"}]', NULL, NULL);
INSERT INTO "db_gxpt"."t_data_member"  VALUES ('FFB5CFB03A8EEA64ACC2F98166CB4F72', '09F74BA0E16B8E746288EEB567E22EEF', 'DT_ZHXGSJ', 'a57637b3c943adfa0c96c2964e976812', 'd1c4d76e76ea8cd92441b8846d878eb3', NULL, NULL, NULL, NULL, '[{"convertBs":"String","isChain":2,"executeType":"Default","ruleId":null,"expression":null,"dataSource":null,"param":null,"sql":null,"convertDatas":"[{\\"dataType\\":\\"date\\",\\"dataName\\":\\"datetime\\"}]"}]', NULL, NULL);



INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('00404ef706da82445752509b9618875d', '86ca4f7cfc44550416887e3eba78e541', 'N_HMLX', '画面类型', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"画面类型","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"N_HMLX","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.788', '2017-12-06 16:49:44.788');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('00fc05a5e434601c4821a417443e76c0', 'f0f5305bdfd6cc48be716296b35e16c3', 'N_ORDER', 'N_ORDER', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"5","label":"N_ORDER","required":"true"},"unique":false,"fieldType":"number","tableName":"T_ATY_CORP","defaultValue":"1","fieldName":"N_ORDER","dbmsType":"number","pk":false}}', '2017-12-08 09:13:43.403', '2017-12-08 09:13:43.403');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('01a5747b8d6ee7a9a2d1865026c6eb5b', '0e3f58455d4cc329b7d698b8313d4dfc', 'D_YDSJ', '预订时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"预订时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"D_YDSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.858', '2017-12-06 16:49:44.858');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('02822c0974beba43564c4607c5fd09a6', '77db7cdac806de1ebf86a17dd702cd4f', 'N_ZT', '状态', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"19","label":"状态","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_ZTJK_CCZY","defaultValue":"","fieldName":"N_ZT","dbmsType":"number","pk":false}}', '2017-12-06 16:49:45.014', '2017-12-06 16:49:45.014');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('03d4254c3e47323a5bc40aff574b8501', '3669cb9e4498ff4b9919ace0a8849ebc', 'C_AM', '案名', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"案名","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTGG","defaultValue":"","fieldName":"C_AM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.695', '2017-12-06 16:49:44.695');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('042214bdd6b5324442d230389089b23b', '0684ea57f95c1b76d2f96181fef111e8', 'DT_ZHXGSJ', '最后修改时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后修改时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_SPFD","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.759', '2017-12-06 16:49:44.759');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('066146ca971bb00c1f91a21f4032f86f', '83d686f5d88d6719a0d04ac69828bc44', 'C_MC', '描述', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"描述","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYRY","defaultValue":"","fieldName":"C_MC","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.983', '2017-12-06 16:49:44.983');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('06ad746cd8b24c88f6faac2bec0c4bac', '5ea1d992b21cf9166adbb0cdaaa66424', 'C_MS', '描述', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"600","label":"描述","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYFT","defaultValue":"","fieldName":"C_MS","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.954', '2017-12-06 16:49:44.954');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('0701a5245d036e27903b5d26918a9d65', '5ea1d992b21cf9166adbb0cdaaa66424', 'C_FBDM', '法标代码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"法标代码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYFT","defaultValue":"","fieldName":"C_FBDM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.953', '2017-12-06 16:49:44.953');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('0717f09d3bd2aa8ddbc55c0ef65638d0', '713cc4e5db06b55d7a7e934ab17c1d3d', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:44.722', '2017-12-06 16:49:44.722');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('080673fa725e414330e2c651b6e3df9b', '7f178bc788e90781b253c53768dc124c', 'N_AJLB', '案件类别', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"案件类别","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"N_AJLB","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.664', '2017-12-06 16:49:44.664');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('08fb30bbe4155ade3e65db5d3f0a790b', '77db7cdac806de1ebf86a17dd702cd4f', 'N_SYKJ', '剩余空间', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"19","label":"剩余空间","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_ZTJK_CCZY","defaultValue":"","fieldName":"N_SYKJ","dbmsType":"number","pk":false}}', '2017-12-06 16:49:45.014', '2017-12-06 16:49:45.014');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('0931ae4a19be9c54d52fdf99a8ac5d67', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_DZ', 'C_DZ', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"C_DZ","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"NULL::character varying","fieldName":"C_DZ","dbmsType":"varchar","pk":false}}', '2017-12-08 09:13:43.408', '2017-12-08 09:13:43.408');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('097540916ebd98ef02d062a229ec3338', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_FTID', '法庭ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"法庭id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_FTID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.857', '2017-12-06 16:49:44.857');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('09d541fe82ba4584b1b34f1366d9a49c', '3669cb9e4498ff4b9919ace0a8849ebc', 'C_AJID', '案件ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"案件id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTGG","defaultValue":"","fieldName":"C_AJID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.693', '2017-12-06 16:49:44.693');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('0a56a28ed6767072b494cfd3d1adffd3', '7f178bc788e90781b253c53768dc124c', 'N_IFGK', '是否公开', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"是否公开","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"N_IFGK","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.665', '2017-12-06 16:49:44.665');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('0f1776195cfbd521072377b827497be8', '2c1df88e17f43298431e53d5b3265717', 'C_AJID', '案件ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"案件id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_DSR","defaultValue":"","fieldName":"C_AJID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.632', '2017-12-06 16:49:44.632');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('0f605f6bdd47e821b5a31c3c68f4a2d3', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_AJID', '案件ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"案件id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_AJID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.856', '2017-12-06 16:49:44.856');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('0f9e3bb42ffce53df1159f6490ebea05', 'a57637b3c943adfa0c96c2964e976812', 'C_AJID', '案件ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"案件id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_DBBL","defaultValue":"","fieldName":"C_AJID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.603', '2017-12-06 16:49:44.603');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('10d3e68531c5836f7adbadf7aba0d045', 'b13d0d76bef1136a1e2084a6d58db91b', 'DT_ZHXGSJ', '最后修改时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后修改时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_SPZZ","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.823', '2017-12-06 16:49:44.823');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('1165ecf910ddbeea1fb18c79c1a05dda', '713cc4e5db06b55d7a7e934ab17c1d3d', 'N_KTXH', '开庭序号', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"开庭序号","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"N_KTXH","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.726', '2017-12-06 16:49:44.726');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('14410912136d0e8687145f57c63a3f59', 'f0f5305bdfd6cc48be716296b35e16c3', 'DT_UPDATETIME', 'DT_UPDATETIME', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"DT_UPDATETIME","required":"false"},"unique":false,"fieldType":"date","tableName":"T_ATY_CORP","defaultValue":"","fieldName":"DT_UPDATETIME","dbmsType":"date","pk":false}}', '2017-12-08 09:13:43.407', '2017-12-08 09:13:43.407');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('155e6431dbcd0cc7237296f5e1414ed6', 'f52403a73f3828f52daf1e99b2fc640f', 'N_FALX', '播放方案类型', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"播放方案类型","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_AJ_BFFA","defaultValue":"","fieldName":"N_FALX","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.576', '2017-12-06 16:49:44.576');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('165f866c71d7fe07d31c5ee35ed42991', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_ID', 'C_ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"50","label":"C_ID","required":"true"},"unique":true,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-08 09:13:43.398', '2017-12-08 09:13:43.398');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('170202cb963cd605c61c14074f4f2823', '3669cb9e4498ff4b9919ace0a8849ebc', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_AJ_KTGG","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:44.692', '2017-12-06 16:49:44.692');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('199f3e035d1f47e4e9ee2fb87f4c883c', '86ca4f7cfc44550416887e3eba78e541', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:44.786', '2017-12-06 16:49:44.786');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('19d744e4f8a0d913c63a1327c220b4c5', '2c1df88e17f43298431e53d5b3265717', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_AJ_DSR","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:44.631', '2017-12-06 16:49:44.631');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('1a9cfecb720e9ecf967f80efecd2daa8', '7f178bc788e90781b253c53768dc124c', 'D_LARQ', '立案日期', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"立案日期","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"D_LARQ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.666', '2017-12-06 16:49:44.666');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('1b6ca71a0c6fa04b7128c6755f551202', '713cc4e5db06b55d7a7e934ab17c1d3d', 'D_KTSJ', '开庭时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"开庭时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"D_KTSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.726', '2017-12-06 16:49:44.726');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('1e5a97592ca274a18fa8139b3f500bc6', '86ca4f7cfc44550416887e3eba78e541', 'N_LXSC', '录像时长', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"录像时长","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"N_LXSC","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.791', '2017-12-06 16:49:44.791');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('1e664c4938a8293dd810cecce83b9995', '83d686f5d88d6719a0d04ac69828bc44', 'N_YX', '是否有效', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"是否有效","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_FYRY","defaultValue":"","fieldName":"N_YX","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.985', '2017-12-06 16:49:44.985');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('1f6b052ab9e10fdc665a9e5c3e388d29', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:44.854', '2017-12-06 16:49:44.854');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('1fa1d8c17055204659900a05937e7a17', '77db7cdac806de1ebf86a17dd702cd4f', 'C_PF', '盘符', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"盘符","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_ZTJK_CCZY","defaultValue":"","fieldName":"C_PF","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:45.013', '2017-12-06 16:49:45.013');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('206cd48be1c623a7253669851831e23c', '2c1df88e17f43298431e53d5b3265717', 'DT_ZHXGSJ', '最后修改时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后修改时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_DSR","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.634', '2017-12-06 16:49:44.634');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('228dc683d3ce8ae14034c1de44a0d4ce', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_YB', 'C_YB', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"50","label":"C_YB","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"NULL::character varying","fieldName":"C_YB","dbmsType":"varchar","pk":false}}', '2017-12-08 09:13:43.408', '2017-12-08 09:13:43.408');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('232350bb146054bea3c8400ae62ff9fe', '7f178bc788e90781b253c53768dc124c', 'C_AM', '案名', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"案名","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"C_AM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.663', '2017-12-06 16:49:44.663');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('248c42440ec4e3465fd3a4b5c140f3db', '0684ea57f95c1b76d2f96181fef111e8', 'C_ID_KTXX', '开庭信息外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"开庭信息外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPFD","defaultValue":"","fieldName":"C_ID_KTXX","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.756', '2017-12-06 16:49:44.756');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('276a288ce7a6ac3bc7d19e30d93f51d2', 'a57637b3c943adfa0c96c2964e976812', 'C_FDID', '分段ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"分段id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_DBBL","defaultValue":"","fieldName":"C_FDID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.604', '2017-12-06 16:49:44.604');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('294c85bc13cd2b79067659a50d350737', 'b13d0d76bef1136a1e2084a6d58db91b', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_AJ_SPZZ","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:44.82', '2017-12-06 16:49:44.82');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('29600b467025f1f0277bf3c71a2da317', '2c1df88e17f43298431e53d5b3265717', 'N_SSDW', '诉讼地位', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"诉讼地位","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_AJ_DSR","defaultValue":"","fieldName":"N_SSDW","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.633', '2017-12-06 16:49:44.633');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('296fc2be9847786bf9f813e35f2760c4', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_DH', 'C_DH', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"50","label":"C_DH","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"NULL::character varying","fieldName":"C_DH","dbmsType":"varchar","pk":false}}', '2017-12-08 09:13:43.409', '2017-12-08 09:13:43.409');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('2b0b8647cbc18d1cf93ca9f63950bda1', '7f178bc788e90781b253c53768dc124c', 'C_AY', '案由', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"案由","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"C_AY","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.663', '2017-12-06 16:49:44.663');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('2c64a36bf078a2ef7e1fb466e4ecd632', '86ca4f7cfc44550416887e3eba78e541', 'C_WJGS', '文件格式', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"600","label":"文件格式","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"C_WJGS","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.79', '2017-12-06 16:49:44.79');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('309c57c3e48e0a5670b4ad444e87acf3', '77db7cdac806de1ebf86a17dd702cd4f', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_ZTJK_CCZY","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:45.012', '2017-12-06 16:49:45.012');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('30ab395fc65d69fe34ae9104138d6f24', '86ca4f7cfc44550416887e3eba78e541', 'C_SPLID', '视频流ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"视频流ID","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"C_SPLID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.787', '2017-12-06 16:49:44.787');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('3219a002eca76039c05c00ffc5190043', '7f178bc788e90781b253c53768dc124c', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:44.66', '2017-12-06 16:49:44.66');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('323eaf6d3ca162557823bf7340a9be49', '2c1df88e17f43298431e53d5b3265717', 'C_ID_JBXX', '基本信息外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"基本信息外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_DSR","defaultValue":"","fieldName":"C_ID_JBXX","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.632', '2017-12-06 16:49:44.632');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('33ae2e7f84bddd30c750a24e9f50e589', '512a2655a3a2ec865cb43285c5d0a5f0', 'C_IP', 'IP', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"IP","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_ZTJK_LMT","defaultValue":"","fieldName":"C_IP","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:45.041', '2017-12-06 16:49:45.041');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('34432bfbcf098bd5c8181cde3e41f498', 'b13d0d76bef1136a1e2084a6d58db91b', 'C_SPZZCYID', '审判组织成员ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"审判组织成员id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPZZ","defaultValue":"","fieldName":"C_SPZZCYID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.822', '2017-12-06 16:49:44.822');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('34bbe3e26a1556f5c7bb3fcae5bfa4ba', '77db7cdac806de1ebf86a17dd702cd4f', 'C_FBDM', '法标代码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"法标代码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_ZTJK_CCZY","defaultValue":"","fieldName":"C_FBDM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:45.013', '2017-12-06 16:49:45.013');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('34f61f57da416767149bf0b16f5a45a6', 'd5d01775bbcc1b1bd94afcf1bbff3488', 'N_XSSX', '显示顺序', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"显示顺序","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_FYBM","defaultValue":"","fieldName":"N_XSSX","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.887', '2017-12-06 16:49:44.887');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('3685bdec90e3d7b4bc75d77913dbae4e', '3669cb9e4498ff4b9919ace0a8849ebc', 'DT_ZHXGSJ', '最后修改时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后修改时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_KTGG","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.695', '2017-12-06 16:49:44.695');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('369cc45b23d9df76504f937dc4e3bf8f', '7f178bc788e90781b253c53768dc124c', 'C_FBDM', '法标代码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"法标代码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"C_FBDM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.662', '2017-12-06 16:49:44.662');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('384172f090719945949460cfdbf95b78', '83d686f5d88d6719a0d04ac69828bc44', 'C_RYID', '人员ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"人员ID","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYRY","defaultValue":"","fieldName":"C_RYID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.983', '2017-12-06 16:49:44.983');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('39226ad35dc1aac29d1e4df07ec82cae', '83d686f5d88d6719a0d04ac69828bc44', 'N_KYQX', '跨院权限', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"跨院权限","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_FYRY","defaultValue":"","fieldName":"N_KYQX","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.985', '2017-12-06 16:49:44.985');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('3a8f89a72826f24d576d05ce7dc1ecdc', 'f52403a73f3828f52daf1e99b2fc640f', 'C_FAMC', '播放方案名称', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"播放方案名称","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_BFFA","defaultValue":"","fieldName":"C_FAMC","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.575', '2017-12-06 16:49:44.575');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('3b027438ae39adc7a8cce4b66dcbea7f', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_NAME', 'C_NAME', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"150","label":"C_NAME","required":"true"},"unique":false,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"","fieldName":"C_NAME","dbmsType":"varchar","pk":false}}', '2017-12-08 09:13:43.399', '2017-12-08 09:13:43.399');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('3b85c321f70587320572712c4acddcb8', '7f178bc788e90781b253c53768dc124c', 'DT_ZHXGSJ', '最后修改时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后修改时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.667', '2017-12-06 16:49:44.667');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('3d2ccdd8c636cc14b322ae7184dd62d3', 'b13d0d76bef1136a1e2084a6d58db91b', 'C_FBDM', '法标代码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"法标代码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPZZ","defaultValue":"","fieldName":"C_FBDM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.821', '2017-12-06 16:49:44.821');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('3d913287d58f23b206d976474c63ec97', '86ca4f7cfc44550416887e3eba78e541', 'C_WJMC', '文件名称', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"文件名称","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"C_WJMC","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.791', '2017-12-06 16:49:44.791');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('406018861b7537727d9b381ee1dbe2ab', 'a57637b3c943adfa0c96c2964e976812', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_AJ_DBBL","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:44.602', '2017-12-06 16:49:44.602');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('415d7318bb71e57410106bd820d91250', '86ca4f7cfc44550416887e3eba78e541', 'N_LMTFWLX', '流媒体服务类型', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"流媒体服务类型","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"N_LMTFWLX","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.79', '2017-12-06 16:49:44.79');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('43836f6fd907ffca00cc66df5d1b1c9c', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_PID', 'C_PID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"50","label":"C_PID","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"","fieldName":"C_PID","dbmsType":"varchar","pk":false}}', '2017-12-08 09:13:43.4', '2017-12-08 09:13:43.4');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('45e0ce6c7bdae667c5e84be3945b382a', 'f0f5305bdfd6cc48be716296b35e16c3', 'N_VALID', 'N_VALID', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"5","label":"N_VALID","required":"true"},"unique":false,"fieldType":"number","tableName":"T_ATY_CORP","defaultValue":"1","fieldName":"N_VALID","dbmsType":"number","pk":false}}', '2017-12-08 09:13:43.403', '2017-12-08 09:13:43.403');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('48b69d23ac0f7b954ae8b9c891b5888e', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_AM', '案名', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"案名","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_AM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.858', '2017-12-06 16:49:44.858');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('4a15d7c3cdfb536822c0c3372fe603a5', '7f178bc788e90781b253c53768dc124c', 'N_SPLC', '审判流程', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"审判流程","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"N_SPLC","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.665', '2017-12-06 16:49:44.665');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('5052bf8aa2f233d0fa4870f1b90a21db', 'f52403a73f3828f52daf1e99b2fc640f', 'C_BFFAID', '播放方案ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"播放方案ID","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_BFFA","defaultValue":"","fieldName":"C_BFFAID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.575', '2017-12-06 16:49:44.575');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('52f29b73bc206fd060b1b921ac13a806', 'd5d01775bbcc1b1bd94afcf1bbff3488', 'C_BMID', '部门ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"部门ID","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYBM","defaultValue":"","fieldName":"C_BMID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.886', '2017-12-06 16:49:44.886');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('54a84b41c5641ff7d65cc6d8cc9d22af', '7f178bc788e90781b253c53768dc124c', 'C_ID_CBBM', '承办部门外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"承办部门外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"C_ID_CBBM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.661', '2017-12-06 16:49:44.661');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('564d7049af050af1144b02f7e8f55027', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_ID_FYFT', '法庭外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"法庭外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_ID_FYFT","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.854', '2017-12-06 16:49:44.854');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('5a176fad71935289fbdbc31c7c4fdac7', '713cc4e5db06b55d7a7e934ab17c1d3d', 'C_SJYID', '书记员ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"书记员id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"C_SJYID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.726', '2017-12-06 16:49:44.726');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('5aad62a816e00adee0fd23fa3cf0e4e0', 'a57637b3c943adfa0c96c2964e976812', 'C_ID_KTXX', '开庭信息外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"开庭信息外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_DBBL","defaultValue":"","fieldName":"C_ID_KTXX","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.602', '2017-12-06 16:49:44.603');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('64c6eef47f2a7f874a4a9ecf214f9fa8', 'b13d0d76bef1136a1e2084a6d58db91b', 'N_SPZZDW', '审判组织地位', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"审判组织地位","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_AJ_SPZZ","defaultValue":"","fieldName":"N_SPZZDW","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.822', '2017-12-06 16:49:44.822');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('64d2ccb33bf3829d333722ea06af167c', 'f141b29dfabca5d00ed6c7f942e61b68', 'N_ORDER', 'N_ORDER', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"5","label":"N_ORDER","required":"true"},"unique":false,"fieldType":"number","tableName":"T_ATY_CODE","defaultValue":"(1)::smallint","fieldName":"N_ORDER","dbmsType":"number","pk":false}}', '2017-12-08 09:06:32.032', '2017-12-08 09:06:32.032');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('65c5f5fa1a17821640c8a9607c37c477', '86ca4f7cfc44550416887e3eba78e541', 'DT_ZHXGSJ', '最后修改时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后修改时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.792', '2017-12-06 16:49:44.792');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('66cd66440127339c4633bf302a6f2f40', 'b13d0d76bef1136a1e2084a6d58db91b', 'C_ID_SPZZCY', '审判组织成员外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"审判组织成员外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPZZ","defaultValue":"","fieldName":"C_ID_SPZZCY","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.821', '2017-12-06 16:49:44.821');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('6cea595cc820d965e0828f9fa5488332', '86ca4f7cfc44550416887e3eba78e541', 'C_XZURL', '下载URL', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"2147483647","label":"下载URL","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"C_XZURL","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.789', '2017-12-06 16:49:44.789');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('6d73a882b5b3e4a2f82be6e51d97a0eb', '0684ea57f95c1b76d2f96181fef111e8', 'D_KSSJ', '开始时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"开始时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_SPFD","defaultValue":"","fieldName":"D_KSSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.757', '2017-12-06 16:49:44.757');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('6e202e83b7322e8dfe47aea959d3f23e', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_IFYCKT', '是否远程开庭', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"是否远程开庭","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_IFYCKT","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.859', '2017-12-06 16:49:44.859');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('6e2607b769ccb2210643f852309e894c', 'a57637b3c943adfa0c96c2964e976812', 'N_BLLX', '笔录类型', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"笔录类型","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_AJ_DBBL","defaultValue":"","fieldName":"N_BLLX","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.604', '2017-12-06 16:49:44.604');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('6f1eeafc2ed3aae3f4c212655e6fc302', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_AH', '案号', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"案号","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_AH","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.858', '2017-12-06 16:49:44.858');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('7254f8481356d90b6592dd9c45b8b7e5', '713cc4e5db06b55d7a7e934ab17c1d3d', 'D_XTSJ', '休庭时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"休庭时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"D_XTSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.727', '2017-12-06 16:49:44.727');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('725e643b90594d2dafe5edd2b6d50d89', 'f141b29dfabca5d00ed6c7f942e61b68', 'N_KWH', 'N_KWH', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"5","label":"N_KWH","required":"true"},"unique":false,"fieldType":"number","tableName":"T_ATY_CODE","defaultValue":"(2)::smallint","fieldName":"N_KWH","dbmsType":"number","pk":false}}', '2017-12-08 09:06:32.029', '2017-12-08 09:06:32.029');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('74ac0a7f1d3dc595785836a2ba8926b9', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_DM', 'C_DM', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"100","label":"C_DM","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"","fieldName":"C_DM","dbmsType":"varchar","pk":false}}', '2017-12-08 09:13:43.406', '2017-12-08 09:13:43.406');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('74ffa1cf193e1f7ba7bd67143574d81e', '2c1df88e17f43298431e53d5b3265717', 'C_ID_DSR', '当事人外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"当事人外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_DSR","defaultValue":"","fieldName":"C_ID_DSR","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.634', '2017-12-06 16:49:44.634');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('76d68ea0d6ba47499a08d208938664ec', '86ca4f7cfc44550416887e3eba78e541', 'C_DBURL', '点播URL', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"600","label":"点播URL","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"C_DBURL","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.789', '2017-12-06 16:49:44.789');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('76fcc5d14e060c09bf01bb586a3f13e5', '5ea1d992b21cf9166adbb0cdaaa66424', 'DT_ZHXGSJ', '最后修改时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后修改时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_FYFT","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.955', '2017-12-06 16:49:44.955');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('7813b97e1a9480f4f733eab991fe54cb', 'd5d01775bbcc1b1bd94afcf1bbff3488', 'C_MC', '部门名称', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"部门名称","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYBM","defaultValue":"","fieldName":"C_MC","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.887', '2017-12-06 16:49:44.887');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('7918cef7f432c6a40f66b6423afe2340', 'd1b3da89c51692c7576153b1391ecad8', 'C_ID', '代码类型编号', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"50","label":"代码类型编号","required":"true"},"unique":true,"fieldType":"text","tableName":"t_aty_codetype","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 18:53:12.563', '2017-12-06 18:53:12.563');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('80db4a4653f54381680847af052ea6fb', '512a2655a3a2ec865cb43285c5d0a5f0', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_ZTJK_LMT","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:45.041', '2017-12-06 16:49:45.041');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('8184f1a641aa08adb22256fae5147d9c', 'f141b29dfabca5d00ed6c7f942e61b68', 'C_CODE', 'C_CODE', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"50","label":"C_CODE","required":"true"},"unique":true,"fieldType":"text","tableName":"T_ATY_CODE","defaultValue":"","fieldName":"C_CODE","dbmsType":"varchar","pk":true}}', '2017-12-08 09:06:32.027', '2017-12-08 09:06:32.027');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('839fbe5b8770aa5b45f0b6d9e4e6ea41', '7f178bc788e90781b253c53768dc124c', 'C_AJID', '案件ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"案件id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"C_AJID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.661', '2017-12-06 16:49:44.661');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('83ce5a06fe167bf0d52284bcb1e0d31a', 'f141b29dfabca5d00ed6c7f942e61b68', 'C_DMJP', 'C_DMJP', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"C_DMJP","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CODE","defaultValue":"","fieldName":"C_DMJP","dbmsType":"varchar","pk":false}}', '2017-12-08 09:06:32.033', '2017-12-08 09:06:32.033');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('864b0a6e727ca5502c3455c214fe50ca', '77db7cdac806de1ebf86a17dd702cd4f', 'C_IP', 'IP', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"IP","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_ZTJK_CCZY","defaultValue":"","fieldName":"C_IP","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:45.013', '2017-12-06 16:49:45.013');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('877a6eb6c9b0a7f8e4b0497d2fe24336', '512a2655a3a2ec865cb43285c5d0a5f0', 'N_ZT', '状态', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"状态","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_ZTJK_LMT","defaultValue":"","fieldName":"N_ZT","dbmsType":"number","pk":false}}', '2017-12-06 16:49:45.042', '2017-12-06 16:49:45.042');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('887e36687401df9e1f58bdc2fdd4f79d', 'd5d01775bbcc1b1bd94afcf1bbff3488', 'N_YX', '是否有效', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"是否有效","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_FYBM","defaultValue":"","fieldName":"N_YX","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.887', '2017-12-06 16:49:44.887');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('895384df32d4864a5b350bc06ff653f5', '713cc4e5db06b55d7a7e934ab17c1d3d', 'C_SLTURL', '缩略图URL', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"600","label":"缩略图url","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"C_SLTURL","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.727', '2017-12-06 16:49:44.727');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('8a806d14a3368f594338dc08abb871dc', '7f178bc788e90781b253c53768dc124c', 'C_CBBMID', '承办部门ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"承办部门id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"C_CBBMID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.664', '2017-12-06 16:49:44.664');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('8aee317d111f4b208a373aad4be4d00e', 'f0f5305bdfd6cc48be716296b35e16c3', 'N_LEVEL', 'N_LEVEL', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"5","label":"N_LEVEL","required":"true"},"unique":false,"fieldType":"number","tableName":"T_ATY_CORP","defaultValue":"4","fieldName":"N_LEVEL","dbmsType":"number","pk":false}}', '2017-12-08 09:13:43.401', '2017-12-08 09:13:43.401');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('8b57c5e09b00cd6f3fd3e79e7ec4700c', 'd1b3da89c51692c7576153b1391ecad8', 'N_SFKWH', '是否可维护', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"3","label":"是否可维护","required":"true"},"unique":false,"fieldType":"number","tableName":"t_aty_codetype","defaultValue":"2","fieldName":"N_SFKWH","dbmsType":"number","pk":false}}', '2017-12-06 18:53:12.564', '2017-12-06 18:53:12.564');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('8d0394be9316112d0a7ab6c2f16faa69', '3669cb9e4498ff4b9919ace0a8849ebc', 'C_AH', '案号', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"案号","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTGG","defaultValue":"","fieldName":"C_AH","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.695', '2017-12-06 16:49:44.695');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('8d5f9121e92393f90b1d9753a26c2109', '83d686f5d88d6719a0d04ac69828bc44', 'C_BMID', '部门ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"部门ID","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYRY","defaultValue":"","fieldName":"C_BMID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.983', '2017-12-06 16:49:44.983');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('8f679d245e7a78221e21db7c0fdd7dc0', '713cc4e5db06b55d7a7e934ab17c1d3d', 'C_FBDM', '法标代码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"法标代码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"C_FBDM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.725', '2017-12-06 16:49:44.725');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('8fb90ffb566a528005159ea97fe9d3ee', '713cc4e5db06b55d7a7e934ab17c1d3d', 'N_BLCD', '笔录长度', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"笔录长度","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"N_BLCD","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.728', '2017-12-06 16:49:44.728');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('903e6679c13a5126a669fb1edc5a3f5e', '83d686f5d88d6719a0d04ac69828bc44', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_FYRY","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:44.982', '2017-12-06 16:49:44.982');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('92a3049e8792264940f2ecc3e91f2867', '713cc4e5db06b55d7a7e934ab17c1d3d', 'DT_ZHXGSJ', '最后修改时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后修改时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.728', '2017-12-06 16:49:44.728');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('94de5e311a2d4d1865f76b6768836e0e', '77db7cdac806de1ebf86a17dd702cd4f', 'DT_ZHXGSJ', '最后修改时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后修改时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_ZTJK_CCZY","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:45.015', '2017-12-06 16:49:45.015');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('94f0e29ac378581c622cde3fe9b1d1e7', '77db7cdac806de1ebf86a17dd702cd4f', 'C_ZTMS', '状态描述', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"600","label":"状态描述","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_ZTJK_CCZY","defaultValue":"","fieldName":"C_ZTMS","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:45.014', '2017-12-06 16:49:45.014');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('96f9627d0042396ed1dc2b31d5c4d84d', '86ca4f7cfc44550416887e3eba78e541', 'C_SPLMC', '视频流名称', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"视频流名称","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"C_SPLMC","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.788', '2017-12-06 16:49:44.788');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('976c7c0547590b548109f9efa3465774', 'd1b3da89c51692c7576153b1391ecad8', 'N_VALID', '是否有效', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"3","label":"是否有效","required":"true"},"unique":false,"fieldType":"number","tableName":"t_aty_codetype","defaultValue":"1","fieldName":"N_Valid","dbmsType":"number","pk":false}}', '2017-12-06 18:53:12.563', '2017-12-06 18:53:12.563');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('977a46e14f4f3b68dfa87dd65ffb6739', 'f52403a73f3828f52daf1e99b2fc640f', 'DT_ZHXGSJ', '最后更新时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后更新时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_BFFA","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.576', '2017-12-06 16:49:44.576');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('985e2b583ce4330e6b8ff177d6f4aecd', 'b13d0d76bef1136a1e2084a6d58db91b', 'C_ID_JBXX', '基本信息外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"基本信息外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPZZ","defaultValue":"","fieldName":"C_ID_JBXX","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.82', '2017-12-06 16:49:44.82');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('98df20afd467fc7c2c917c2e544b8f54', '2c1df88e17f43298431e53d5b3265717', 'C_DSRID', '当事人ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"当事人id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_DSR","defaultValue":"","fieldName":"C_DSRID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.633', '2017-12-06 16:49:44.633');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('994d687f12bdd92a15c6eb589d52abec', '86ca4f7cfc44550416887e3eba78e541', 'C_ID_BFFA', '播放方案外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"播放方案外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"C_ID_BFFA","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.787', '2017-12-06 16:49:44.787');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('9cd0f4c80d95f1dcf3befb2da1c258dd', 'd5d01775bbcc1b1bd94afcf1bbff3488', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_FYBM","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:44.886', '2017-12-06 16:49:44.886');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('9e9643d001e354dae46612855a5cb033', '5ea1d992b21cf9166adbb0cdaaa66424', 'D_JSSJ', '建设时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"建设时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_FYFT","defaultValue":"","fieldName":"D_JSSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.954', '2017-12-06 16:49:44.954');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('a02184859cc903cf79e7f5bfdf2bf02c', '512a2655a3a2ec865cb43285c5d0a5f0', 'N_LX', '类型', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"类型","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_ZTJK_LMT","defaultValue":"","fieldName":"N_LX","dbmsType":"number","pk":false}}', '2017-12-06 16:49:45.042', '2017-12-06 16:49:45.042');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('a19b8eae40be01e75d9d7c3193d3118b', '7f178bc788e90781b253c53768dc124c', 'C_AH', '案号', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"案号","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"C_AH","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.662', '2017-12-06 16:49:44.662');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('a1f554173db148b835d49b754d2fce8b', '7f178bc788e90781b253c53768dc124c', 'C_ID_CBR', '承办人外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"承办人外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"C_ID_CBR","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.661', '2017-12-06 16:49:44.661');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('a3b4d3949fb6c8b393247f353508f4a6', '3669cb9e4498ff4b9919ace0a8849ebc', 'C_FBDM', '法标代码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"法标代码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTGG","defaultValue":"","fieldName":"C_FBDM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.694', '2017-12-06 16:49:44.694');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('a4a80ab6180443fd99e733009020c201', '83d686f5d88d6719a0d04ac69828bc44', 'C_MM', '密码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"密码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYRY","defaultValue":"","fieldName":"C_MM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.984', '2017-12-06 16:49:44.984');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('a558696d7b99ae24ccd9d367561f829e', '512a2655a3a2ec865cb43285c5d0a5f0', 'C_FBDM', '法标代码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"法标代码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_ZTJK_LMT","defaultValue":"","fieldName":"C_FBDM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:45.041', '2017-12-06 16:49:45.041');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('a770bf64fa799d3014b534731e81f4fc', '77db7cdac806de1ebf86a17dd702cd4f', 'N_ZKJ', '总空间', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"19","label":"总空间","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_ZTJK_CCZY","defaultValue":"","fieldName":"N_ZKJ","dbmsType":"number","pk":false}}', '2017-12-06 16:49:45.014', '2017-12-06 16:49:45.014');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('a966b94da8a9a86cb80fadda919da8dd', '3669cb9e4498ff4b9919ace0a8849ebc', 'D_KSSJ', '开始时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"开始时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_KTGG","defaultValue":"","fieldName":"D_KSSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.694', '2017-12-06 16:49:44.694');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('ab98f6c1714673a30903b5a67469816f', 'a57637b3c943adfa0c96c2964e976812', 'C_BLNR', '笔录内容', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"2147483647","label":"笔录内容","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_DBBL","defaultValue":"","fieldName":"C_BLNR","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.605', '2017-12-06 16:49:44.605');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('ac293ae5a6aa2d07c9f3735e16475f2b', '0684ea57f95c1b76d2f96181fef111e8', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_AJ_SPFD","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:44.755', '2017-12-06 16:49:44.755');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('af05cd0a7dfc28b7b26fb3f87166cdac', '713cc4e5db06b55d7a7e934ab17c1d3d', 'C_FTID', '法庭ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"法庭id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"C_FTID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.725', '2017-12-06 16:49:44.725');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('b08affee656773ee1a9c5b10de5bfe36', 'd5d01775bbcc1b1bd94afcf1bbff3488', 'DT_ZHXGSJ', '最后修改时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后修改时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_FYBM","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.888', '2017-12-06 16:49:44.888');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('b5f47954d8e0414d012715210aa0eefe', '3669cb9e4498ff4b9919ace0a8849ebc', 'C_YDXH', '预定序号', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"预定序号","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTGG","defaultValue":"","fieldName":"C_YDXH","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.696', '2017-12-06 16:49:44.696');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('b637eeae2d2e0cc378090c7280748565', '0684ea57f95c1b76d2f96181fef111e8', 'D_JSSJ', '结束时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"结束时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_SPFD","defaultValue":"","fieldName":"D_JSSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.758', '2017-12-06 16:49:44.758');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('b76f950a667ea2d475839fe00f038c21', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_ADMIN', 'C_ADMIN', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"900","label":"C_ADMIN","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"NULL::character varying","fieldName":"C_ADMIN","dbmsType":"varchar","pk":false}}', '2017-12-08 09:13:43.412', '2017-12-08 09:13:43.412');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('b80b2c0fe203fb500816ac35ad8071b4', '2c1df88e17f43298431e53d5b3265717', 'C_FBDM', '法标代码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"法标代码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_DSR","defaultValue":"","fieldName":"C_FBDM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.632', '2017-12-06 16:49:44.632');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('b8cbb383da6c8dba074e93bc8616dd71', 'f141b29dfabca5d00ed6c7f942e61b68', 'C_NAME', 'C_NAME', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"C_NAME","required":"true"},"unique":false,"fieldType":"text","tableName":"T_ATY_CODE","defaultValue":"","fieldName":"C_NAME","dbmsType":"varchar","pk":false}}', '2017-12-08 09:06:32.028', '2017-12-08 09:06:32.028');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('b925e6cc41400257fa79595594688d8e', '3669cb9e4498ff4b9919ace0a8849ebc', 'C_ID_JBXX', '基本信息外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"基本信息外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTGG","defaultValue":"","fieldName":"C_ID_JBXX","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.693', '2017-12-06 16:49:44.693');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('b982309d11f07517e90681a70cac9a69', '0e3f58455d4cc329b7d698b8313d4dfc', 'DT_ZHXGSJ', '最后修改时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后修改时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.86', '2017-12-06 16:49:44.86');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('beaa8b8a5434c24612a67f2c69075b18', 'd1b3da89c51692c7576153b1391ecad8', 'C_NAME', '代码类型名称', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"代码类型名称","required":"true"},"unique":false,"fieldType":"text","tableName":"t_aty_codetype","defaultValue":"","fieldName":"C_Name","dbmsType":"varchar","pk":false}}', '2017-12-06 18:53:12.563', '2017-12-06 18:53:12.563');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('c0373e8783f99da3b1e4524e318ca9c6', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_ID_YDR', '预订人外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"预订人外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_ID_YDR","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.855', '2017-12-06 16:49:44.855');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('c21014779e652b420aaa3c8d6e12b06f', 'f141b29dfabca5d00ed6c7f942e61b68', 'N_VALID', 'N_VALID', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"5","label":"N_VALID","required":"true"},"unique":false,"fieldType":"number","tableName":"T_ATY_CODE","defaultValue":"(1)::smallint","fieldName":"N_VALID","dbmsType":"number","pk":false}}', '2017-12-08 09:06:32.031', '2017-12-08 09:06:32.031');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('c2c96133137570d994be564a3d0b45dd', '5ea1d992b21cf9166adbb0cdaaa66424', 'C_FTID', '法庭ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"法庭ID","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYFT","defaultValue":"","fieldName":"C_FTID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.919', '2017-12-06 16:49:44.919');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('c347534f5f87c6d2ab7559e06e944b32', '7f178bc788e90781b253c53768dc124c', 'N_IFGM', '是否观摩', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"是否观摩","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"N_IFGM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.666', '2017-12-06 16:49:44.666');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('c43cf3507af759c7fa8f349692eb5926', '512a2655a3a2ec865cb43285c5d0a5f0', 'C_ZTMS', '状态描述', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"600","label":"状态描述","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_ZTJK_LMT","defaultValue":"","fieldName":"C_ZTMS","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:45.042', '2017-12-06 16:49:45.042');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('c4ea2a33982010de3479cfed998bdef6', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_KHZH', 'C_KHZH', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"100","label":"C_KHZH","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"NULL::character varying","fieldName":"C_KHZH","dbmsType":"varchar","pk":false}}', '2017-12-08 09:13:43.411', '2017-12-08 09:13:43.411');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('c975764ee9b3ca67b01aed56b1ac231b', 'f52403a73f3828f52daf1e99b2fc640f', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_AJ_BFFA","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:44.573', '2017-12-06 16:49:44.573');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('ca9f844b03abb497d7dad85acd596301', 'f141b29dfabca5d00ed6c7f942e61b68', 'C_LEVELINFO', 'C_LEVELINFO', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"C_LEVELINFO","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CODE","defaultValue":"","fieldName":"C_LEVELINFO","dbmsType":"varchar","pk":false}}', '2017-12-08 09:06:32.03', '2017-12-08 09:06:32.03');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('cb2b891ad20323c4d49a27fa836d3dae', 'a57637b3c943adfa0c96c2964e976812', 'N_KTXH', '开庭序号', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"开庭序号","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_AJ_DBBL","defaultValue":"","fieldName":"N_KTXH","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.604', '2017-12-06 16:49:44.604');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('cf74b48df66a931fad606e6e24521e58', '83d686f5d88d6719a0d04ac69828bc44', 'C_FBDM', '法标代码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"法标代码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYRY","defaultValue":"","fieldName":"C_FBDM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.983', '2017-12-06 16:49:44.983');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('d0b8cf0f878fda90039485489b796289', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_KHYH', 'C_KHYH', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"100","label":"C_KHYH","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"NULL::character varying","fieldName":"C_KHYH","dbmsType":"varchar","pk":false}}', '2017-12-08 09:13:43.41', '2017-12-08 09:13:43.41');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('d1013c989aeac20f23c002658d0f762f', '713cc4e5db06b55d7a7e934ab17c1d3d', 'C_AJID', '案件ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"案件id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"C_AJID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.724', '2017-12-06 16:49:44.724');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('d16698b758444d8ef4b416f73b888b9e', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_MS', '描述', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"600","label":"描述","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_MS","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.86', '2017-12-06 16:49:44.86');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('d1c4d76e76ea8cd92441b8846d878eb3', 'a57637b3c943adfa0c96c2964e976812', 'DT_ZHXGSJ', 'DT_ZHXGSJ', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"DT_ZHXGSJ","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_DBBL","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.605', '2017-12-06 16:49:44.605');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('d41d8b02e9146cde58847442eaa9e24e', '83d686f5d88d6719a0d04ac69828bc44', 'N_XSSX', '显示顺序', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"显示顺序","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_FYRY","defaultValue":"","fieldName":"N_XSSX","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.984', '2017-12-06 16:49:44.984');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('d46b69dfa3822362fd50d875026e0f99', '713cc4e5db06b55d7a7e934ab17c1d3d', 'C_ID_JBXX', '基本信息外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"基本信息外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"C_ID_JBXX","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.723', '2017-12-06 16:49:44.723');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('d5164123d3ada68086183a76aa36f986', '512a2655a3a2ec865cb43285c5d0a5f0', 'DT_ZHXGSJ', '最后修改时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后修改时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_ZTJK_LMT","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:45.042', '2017-12-06 16:49:45.042');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('d51e8bf7a15c0c77315076ba1610799a', '5ea1d992b21cf9166adbb0cdaaa66424', 'N_ZDRS', '最大人数', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"最大人数","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_FYFT","defaultValue":"","fieldName":"N_ZDRS","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.954', '2017-12-06 16:49:44.954');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('d75727dd7261c5d3a12765cfbfb06eaa', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_ID_JBXX', '基本信息外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"基本信息外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_ID_JBXX","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.854', '2017-12-06 16:49:44.854');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('d8db962852180eb7e87c4fa65dd5e29a', '83d686f5d88d6719a0d04ac69828bc44', 'N_GKAJQX', '公开案件权限', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"公开案件权限","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_FYRY","defaultValue":"","fieldName":"N_GKAJQX","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.985', '2017-12-06 16:49:44.985');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('da39e408d803c878d76f26f237f98013', 'b13d0d76bef1136a1e2084a6d58db91b', 'C_AJID', '案件ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"案件id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPZZ","defaultValue":"","fieldName":"C_AJID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.821', '2017-12-06 16:49:44.821');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('dabcfa97b1ecfb877db2f042a35fb980', 'b13d0d76bef1136a1e2084a6d58db91b', 'C_XM', '姓名', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"姓名","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPZZ","defaultValue":"","fieldName":"C_XM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.822', '2017-12-06 16:49:44.822');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('daf2f86767039395d8809cb3a5eab58b', '5ea1d992b21cf9166adbb0cdaaa66424', 'N_XSSX', '显示顺序', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"显示顺序","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_FYFT","defaultValue":"","fieldName":"N_XSSX","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.955', '2017-12-06 16:49:44.955');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('dd00e6f998b656f65b1df654cc1dc45a', 'd5d01775bbcc1b1bd94afcf1bbff3488', 'C_FBDM', '法标代码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"法标代码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYBM","defaultValue":"","fieldName":"C_FBDM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.886', '2017-12-06 16:49:44.886');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('dd6c03a83d9bbfd4c5bf2fbe619b6441', 'a57637b3c943adfa0c96c2964e976812', 'C_BLBM', '笔录编码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"笔录编码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_DBBL","defaultValue":"","fieldName":"C_BLBM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.605', '2017-12-06 16:49:44.605');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('deb2b00018b60bb59fe587091ea09536', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_ALIAS', 'C_ALIAS', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"100","label":"C_ALIAS","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"","fieldName":"C_ALIAS","dbmsType":"varchar","pk":false}}', '2017-12-08 09:13:43.402', '2017-12-08 09:13:43.402');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('e0d71c1ab15529f123e140b18f6923e0', 'f0f5305bdfd6cc48be716296b35e16c3', 'N_SFTB', 'N_SFTB', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"N_SFTB","required":"false"},"unique":false,"fieldType":"number","tableName":"T_ATY_CORP","defaultValue":"","fieldName":"N_SFTB","dbmsType":"number","pk":false}}', '2017-12-08 09:13:43.411', '2017-12-08 09:13:43.411');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('e21af96a2816be788b88333ab20d1f1b', '713cc4e5db06b55d7a7e934ab17c1d3d', 'C_ID_SJY', '书记员外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"书记员外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"C_ID_SJY","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.724', '2017-12-06 16:49:44.724');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('e2fe823c06cb7c9c6251d694a11765e4', '7f178bc788e90781b253c53768dc124c', 'C_CBRID', '承办人ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"承办人id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"C_CBRID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.664', '2017-12-06 16:49:44.664');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('e61f1a835cbbd1671416975115fb458c', '83d686f5d88d6719a0d04ac69828bc44', 'DT_ZHXGSJ', '最后修改时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"最后修改时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_FYRY","defaultValue":"","fieldName":"DT_ZHXGSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.985', '2017-12-06 16:49:44.985');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('e6d7bf09a9e3805c80c4a424b2c10cd4', '86ca4f7cfc44550416887e3eba78e541', 'N_WJDX', '文件大小', 'number', 'number', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"10","label":"文件大小","required":"false"},"unique":false,"fieldType":"number","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"N_WJDX","dbmsType":"number","pk":false}}', '2017-12-06 16:49:44.79', '2017-12-06 16:49:44.79');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('e7797de41b22ad072ef74eab4a1c4079', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_YDRID', '预订人ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"预订人id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_YDRID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.857', '2017-12-06 16:49:44.857');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('e8607c80dc91a7a8b7a2428fe00f026f', '0e3f58455d4cc329b7d698b8313d4dfc', 'D_YDJSSJ', '预订结束时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"13","label":"预订结束时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"D_YDJSSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.859', '2017-12-06 16:49:44.859');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('e87dbfe5e05d610612dbf536dbb6d66a', '713cc4e5db06b55d7a7e934ab17c1d3d', 'C_ID_FYFT', '法庭外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"法庭外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTXX","defaultValue":"","fieldName":"C_ID_FYFT","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.723', '2017-12-06 16:49:44.723');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('ebedbe47384df883414d50c1904951ef', '3669cb9e4498ff4b9919ace0a8849ebc', 'C_FTID', '法庭ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"法庭id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTGG","defaultValue":"","fieldName":"C_FTID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.694', '2017-12-06 16:49:44.694');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('ec7f1184004dcca2a716eefe1132dac4', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_FBDM', '法标代码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"法标代码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_FBDM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.856', '2017-12-06 16:49:44.856');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('ecdf83e482076738a4431870f8900b7e', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_ID_SJY', '书记员外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"书记员外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_ID_SJY","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.855', '2017-12-06 16:49:44.855');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('ed615bc142ddca92d8873be6c4df6f1e', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_KHHM', 'C_KHHM', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"100","label":"C_KHHM","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"NULL::character varying","fieldName":"C_KHHM","dbmsType":"varchar","pk":false}}', '2017-12-08 09:13:43.41', '2017-12-08 09:13:43.41');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('eec909bbf9a63120866b247781dd9f4d', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_GBM', 'C_GBM', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"100","label":"C_GBM","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"","fieldName":"C_GBM","dbmsType":"varchar","pk":false}}', '2017-12-08 09:13:43.401', '2017-12-08 09:13:43.401');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('eef0fc93398f6d4ce4914060a1a6909b', '86ca4f7cfc44550416887e3eba78e541', 'C_IP', 'IP', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"IP","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"C_IP","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.791', '2017-12-06 16:49:44.791');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('f142028c0e1748e678b93add42ea508e', '0684ea57f95c1b76d2f96181fef111e8', 'C_SPFDID', '视频分段ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"视频分段ID","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPFD","defaultValue":"","fieldName":"C_SPFDID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.757', '2017-12-06 16:49:44.757');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('f1a8962629a86567f28eba6758b30b62', 'a57637b3c943adfa0c96c2964e976812', 'C_FBDM', '法标代码', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"法标代码","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_DBBL","defaultValue":"","fieldName":"C_FBDM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.603', '2017-12-06 16:49:44.603');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('f24674c2642b14b9ff2697309848ac86', 'f52403a73f3828f52daf1e99b2fc640f', 'C_ID_SPFD', '视频分段外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"视频分段外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_BFFA","defaultValue":"","fieldName":"C_ID_SPFD","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.574', '2017-12-06 16:49:44.574');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('f26898f35b0e8cfefc5d6d59ffb456c6', '3669cb9e4498ff4b9919ace0a8849ebc', 'C_ID_FYFT', '法庭外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"法庭外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_KTGG","defaultValue":"","fieldName":"C_ID_FYFT","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.693', '2017-12-06 16:49:44.693');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('f2d5800da0bcb61c76a031019830f303', '83d686f5d88d6719a0d04ac69828bc44', 'C_ID_FYBM', '法院部门外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"法院部门外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYRY","defaultValue":"","fieldName":"C_ID_FYBM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.982', '2017-12-06 16:49:44.982');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('f60dfdeebcf6089c3474728bb97c1df5', '83d686f5d88d6719a0d04ac69828bc44', 'C_BS', '标识', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"标识","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYRY","defaultValue":"","fieldName":"C_BS","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.984', '2017-12-06 16:49:44.984');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('f6f71cb7b8c853fd3fc9f48b540a0ecf', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_ID_CBR', '承办人外键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"承办人外键","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_ID_CBR","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.855', '2017-12-06 16:49:44.855');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('f7e44664da94da5072c71e6317c398a6', '0e3f58455d4cc329b7d698b8313d4dfc', 'D_YDKSSJ', '预订开始时间', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxLength":"13","label":"预订开始时间","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"D_YDKSSJ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.859', '2017-12-06 16:49:44.859');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('f8aa35770052dae60baf9eb628eb1d4b', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_SJYID', '书记员ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"书记员id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_SJYID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.857', '2017-12-06 16:49:44.857');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('f8bb010878b4d32109539350279e121f', '7f178bc788e90781b253c53768dc124c', 'D_JARQ', '结案日期', 'date', 'date', NULL, '1', '1', '{"dictField":{"propMap":{"editor":null,"maxPrecision":"6","maxLength":"29","label":"结案日期","required":"false"},"unique":false,"fieldType":"date","tableName":"T_KJFT_AJ_JBXX","defaultValue":"","fieldName":"D_JARQ","dbmsType":"date","pk":false}}', '2017-12-06 16:49:44.667', '2017-12-06 16:49:44.667');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('faa9ab741ff66a83979a47bcd29f0d74', '0e3f58455d4cc329b7d698b8313d4dfc', 'C_CBRID', '承办人ID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"36","label":"承办人id","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_YDXX","defaultValue":"","fieldName":"C_CBRID","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.856', '2017-12-06 16:49:44.856');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('fba5fc0ec35fffe06d1d3eb3137d0eda', 'f0f5305bdfd6cc48be716296b35e16c3', 'C_GUID', 'C_GUID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"50","label":"C_GUID","required":"false"},"unique":false,"fieldType":"text","tableName":"T_ATY_CORP","defaultValue":"","fieldName":"C_GUID","dbmsType":"varchar","pk":false}}', '2017-12-08 09:13:43.407', '2017-12-08 09:13:43.407');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('fd7feb93ebc1aebba3b002419d31e90a', '5ea1d992b21cf9166adbb0cdaaa66424', 'C_ID', '主键', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"32","label":"主键","required":"true"},"unique":true,"fieldType":"text","tableName":"T_KJFT_FYFT","defaultValue":"","fieldName":"C_ID","dbmsType":"varchar","pk":true}}', '2017-12-06 16:49:44.918', '2017-12-06 16:49:44.918');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('fdecf1ec19e6befb760d555657edc122', '2c1df88e17f43298431e53d5b3265717', 'C_XM', '姓名', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"姓名","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_DSR","defaultValue":"","fieldName":"C_XM","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.633', '2017-12-06 16:49:44.633');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('fe7df2e63e0cb64d95e8f0ab5371fe96', 'f141b29dfabca5d00ed6c7f942e61b68', 'C_PID', 'C_PID', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"50","label":"C_PID","required":"true"},"unique":true,"fieldType":"text","tableName":"T_ATY_CODE","defaultValue":"","fieldName":"C_PID","dbmsType":"varchar","pk":true}}', '2017-12-08 09:06:32.025', '2017-12-08 09:06:32.025');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('fecb442c91b0298ddb6aba24ff6993d8', '5ea1d992b21cf9166adbb0cdaaa66424', 'C_MC', '法庭名称', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"法庭名称","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_FYFT","defaultValue":"","fieldName":"C_MC","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.953', '2017-12-06 16:49:44.953');
INSERT INTO "db_gxpt"."t_md_entitymember"  VALUES ('feffb41dd952a0c2741977cdb414a8a8', '86ca4f7cfc44550416887e3eba78e541', 'C_PF', '盘符', 'input', 'text', NULL, '1', '1', '{"dictField":{"propMap":{"editor":"input","maxLength":"300","label":"盘符","required":"false"},"unique":false,"fieldType":"text","tableName":"T_KJFT_AJ_SPL","defaultValue":"","fieldName":"C_PF","dbmsType":"varchar","pk":false}}', '2017-12-06 16:49:44.792', '2017-12-06 16:49:44.792');




INSERT INTO "db_gxpt"."t_md_entitymenu" VALUES ('123D58E2C95354C4178417FC27AB36F2', '110corp信息', null, '2017-12-08 09:13:19.114', null);
INSERT INTO "db_gxpt"."t_md_entitymenu" VALUES ('17EF3D6CDC480A5FC57A9F947F7CF059', '音视频', null, '2017-12-06 16:27:26.445', null);
INSERT INTO "db_gxpt"."t_md_entitymenu" VALUES ('2536F46D10D385C8447A7135C81B2697', 'codetype信息', null, '2017-12-06 18:53:02.653', null);
INSERT INTO "db_gxpt"."t_md_entitymenu" VALUES ('D5728B14D009B1B8105C40DB6D30BA1A', '交换通用', null, '2017-12-05 21:34:04.428785', null);
INSERT INTO "db_gxpt"."t_md_entitymenu" VALUES ('E7CEFAE72C11E6FA6B2845E5A0D58584', 'code信息', null, '2017-12-08 09:06:05.992', null);




INSERT INTO "db_gxpt"."t_md_entityref" VALUES ('2DBA6186C803D9E0F7F8E49CE78739C7', '7f178bc788e90781b253c53768dc124c', '2c1df88e17f43298431e53d5b3265717', '3219a002eca76039c05c00ffc5190043', '323eaf6d3ca162557823bf7340a9be49', '1');
INSERT INTO "db_gxpt"."t_md_entityref" VALUES ('3584CA99205969809CD127D373DFE34B', '7f178bc788e90781b253c53768dc124c', 'b13d0d76bef1136a1e2084a6d58db91b', '3219a002eca76039c05c00ffc5190043', '985e2b583ce4330e6b8ff177d6f4aecd', '1');
INSERT INTO "db_gxpt"."t_md_entityref" VALUES ('47A4AE77847381D5857543ABE57D7B8A', '7f178bc788e90781b253c53768dc124c', '713cc4e5db06b55d7a7e934ab17c1d3d', '3219a002eca76039c05c00ffc5190043', 'd46b69dfa3822362fd50d875026e0f99', '1');
INSERT INTO "db_gxpt"."t_md_entityref" VALUES ('6E6E2984DB246F5BACBD7E5A48C9F09D', 'f52403a73f3828f52daf1e99b2fc640f', '86ca4f7cfc44550416887e3eba78e541', 'c975764ee9b3ca67b01aed56b1ac231b', '994d687f12bdd92a15c6eb589d52abec', '1');
INSERT INTO "db_gxpt"."t_md_entityref" VALUES ('DF2549F7A2FB0B3DFCA264FB0E608C99', '0684ea57f95c1b76d2f96181fef111e8', 'f52403a73f3828f52daf1e99b2fc640f', 'ac293ae5a6aa2d07c9f3735e16475f2b', 'f24674c2642b14b9ff2697309848ac86', '1');
INSERT INTO "db_gxpt"."t_md_entityref" VALUES ('EB8C4BA02E06B681CFC5D24C86205AAD', '713cc4e5db06b55d7a7e934ab17c1d3d', '0684ea57f95c1b76d2f96181fef111e8', '0717f09d3bd2aa8ddbc55c0ef65638d0', '248c42440ec4e3465fd3a4b5c140f3db', '1');



INSERT INTO "db_gxpt"."t_md_membermapping" VALUES ('571CFA371D39AFA31D8416D1F9E7F7A0', '2b96c54b8e8b2674b35295668e7e6c35', null, null, '09f715fdac92112a7ef5402dee6d49c4', '2a118c82783933f341651bcfd5283c68');
INSERT INTO "db_gxpt"."t_md_membermapping" VALUES ('5C1358A482711B95D70CD06CC8BFFA7D', '132099b2a1f56f25ad2209dd158fbe08', null, null, '09f715fdac92112a7ef5402dee6d49c4', 'f34c8ab241105ef474dc4227c6ff48e1');
INSERT INTO "db_gxpt"."t_md_membermapping" VALUES ('79B1AB133FF01FB49D631A1560899FBF', 'b71f9c56d8df8ea9973d671d0c0cc6c0', null, null, '09f715fdac92112a7ef5402dee6d49c4', 'cfebbd7aea2b4112dde79b1a6f5ec4c0');
INSERT INTO "db_gxpt"."t_md_membermapping" VALUES ('99497384CD06B2E553BD655E13E9C27A', '90937af21231ae63515964e0e06e3a04', null, null, '09f715fdac92112a7ef5402dee6d49c4', '97681a83e1e4c70a215551f8a7920b03');
INSERT INTO "db_gxpt"."t_md_membermapping" VALUES ('C2243199055EEF57B4C3892F47CBD695', '0d352503fd597c0e18f8e36876483407', null, null, '09f715fdac92112a7ef5402dee6d49c4', 'f096424d11267a94367bc51af38edbdd');
INSERT INTO "db_gxpt"."t_md_membermapping" VALUES ('ED4802AF5978885F74EBF10DC91521A2', 'd8df835bda30698f0d633f4dfe021f2e', null, null, '09f715fdac92112a7ef5402dee6d49c4', '1705398855282e267167788a89637263');





INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('0092219758F8EEFCF8305DA0ADA2D372', '2c1df88e17f43298431e53d5b3265717', 'sql', null, '2017-12-06 16:29:34.199', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('11F293806292BD55A9FD8236B7048D31', '77db7cdac806de1ebf86a17dd702cd4f', 'sql', null, '2017-12-06 16:29:34.269', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('188B2AADB49A7142CC0385C72202976D', '83d686f5d88d6719a0d04ac69828bc44', 'sql', null, '2017-12-06 16:29:34.234', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('2DEE1340697B977CDBF9A060CD244403', 'd5d01775bbcc1b1bd94afcf1bbff3488', 'sql', null, '2017-12-06 16:29:34.242', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('3B057A32B11B4E5497F6353D01F5542B', '713cc4e5db06b55d7a7e934ab17c1d3d', 'sql', null, '2017-12-06 16:29:34.178', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('3C6206B34F8F654ED0BFD7C4E12D15CE', '7f178bc788e90781b253c53768dc124c', 'sql', null, '2017-12-06 16:29:34.283', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('4001B1D7B1830E36056CCB8C30AC2991', 'f0f5305bdfd6cc48be716296b35e16c3', 'sql', null, '2017-12-08 09:13:43.736', 'dataSourceBean=gxpt110');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('740E267169562DEE7D2FDB166084E2AB', '5ea1d992b21cf9166adbb0cdaaa66424', 'sql', null, '2017-12-06 16:29:34.292', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('9A3325135C0DD06541E4D05C0A163091', '0684ea57f95c1b76d2f96181fef111e8', 'sql', null, '2017-12-06 16:29:34.315', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('B262AE5363604C25C530D50FCA23573A', 'd1b3da89c51692c7576153b1391ecad8', 'sql', null, '2017-12-06 18:53:12.703', 'dataSourceBean=mysqltest');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('B4F7167C3CD8032097EFF9AC2E78BFC4', '3669cb9e4498ff4b9919ace0a8849ebc', 'sql', null, '2017-12-06 16:29:34.304', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('B85AA3839FB0485E161FA7C85BE9E457', 'a57637b3c943adfa0c96c2964e976812', 'sql', null, '2017-12-06 16:29:34.145', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('D632D9A0507ACBD6E410825A52AD901E', 'f52403a73f3828f52daf1e99b2fc640f', 'sql', null, '2017-12-06 16:29:34.212', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('E1F4EE092BE9F5F30EB0968107DDCA1E', '512a2655a3a2ec865cb43285c5d0a5f0', 'sql', null, '2017-12-06 16:29:34.343', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('F2BCF3BC1804FCF4013D1A7B82A4B3A2', '86ca4f7cfc44550416887e3eba78e541', 'sql', null, '2017-12-06 16:29:34.33', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('F3CCA887F9B4EB70CD5AE024B3D7E499', 'f141b29dfabca5d00ed6c7f942e61b68', 'sql', null, '2017-12-08 09:06:32.364', 'dataSourceBean=gxpt177');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('FC5D0948BAD7B899EBFEBF2063F5F523', '0e3f58455d4cc329b7d698b8313d4dfc', 'sql', null, '2017-12-06 16:29:34.154', 'dataSourceBean=dataSource');
INSERT INTO "db_gxpt"."t_cxyq_cxyqpz" VALUES ('FF4D5D9EE45BC131A962EB82BDEDE0B5', 'b13d0d76bef1136a1e2084a6d58db91b', 'sql', null, '2017-12-06 16:29:34.257', 'dataSourceBean=dataSource');


																									
INSERT INTO "db_gxpt"."t_swap_topic" VALUES ('30EE6208A16B3408E06202DA9096BE1E', '音视频-开庭公告', '2', '1', null, 'b6656ad6e26d762f173859f96a479c2b', '3', '2017-12-06 17:52:27.836', null, '1', 'syn');
INSERT INTO "db_gxpt"."t_swap_topic" VALUES ('768444383D74B3A7551176ACAAD26C99', '音视频-预订信息', '2', '1', null, 'b6656ad6e26d762f173859f96a479c2b', '3', '2017-12-06 17:53:38.597', null, '1', 'syn');
INSERT INTO "db_gxpt"."t_swap_topic" VALUES ('7834DE9E2D9D04039DCA5C7F1D9BFF0D', '音视频-庭审案件基本信息', '2', '1', null, 'b6656ad6e26d762f173859f96a479c2b', '3', '2017-12-06 17:52:13.901', null, '1', 'syn');
INSERT INTO "db_gxpt"."t_swap_topic" VALUES ('A04C9645F0ABF9ED18F22718063B157E', '音视频-法院人员', '2', '1', null, 'b6656ad6e26d762f173859f96a479c2b', '3', '2017-12-06 17:52:39.799', null, '1', 'syn');
INSERT INTO "db_gxpt"."t_swap_topic" VALUES ('A3AC5F1B1A5FA63D9596C6462337A5BB', '音视频-法院法庭', '2', '1', null, 'b6656ad6e26d762f173859f96a479c2b', '3', '2017-12-06 17:52:51.779', null, '1', 'syn');
INSERT INTO "db_gxpt"."t_swap_topic" VALUES ('ABF20E67A964173DB7F8142AD8B5A0FF', '音视频-流媒体服务器状态', '2', '1', null, 'b6656ad6e26d762f173859f96a479c2b', '3', '2017-12-06 17:53:15.775', null, '1', 'syn');
INSERT INTO "db_gxpt"."t_swap_topic" VALUES ('B8A876FA568F186E05DB07765DCFDE35', '音视频-法院部门', '2', '1', null, 'b6656ad6e26d762f173859f96a479c2b', '3', '2017-12-06 17:53:01.98', null, '1', 'syn');
INSERT INTO "db_gxpt"."t_swap_topic" VALUES ('C538BC9C9FEFE01938BB255768BDF616', '音视频-存储资源状态', '2', '1', null, 'b6656ad6e26d762f173859f96a479c2b', '3', '2017-12-06 17:50:37.737', null, '1', 'syn');
INSERT INTO "db_gxpt"."t_swap_topic" VALUES ('1EECB572DF03E579F7ADF96FA250E7A4', '音视频-点播案件笔录', '2', '1', null, 'b6656ad6e26d762f173859f96a479c2b', '3', '2017-12-06 17:53:28.601', null, '1', 'syn');
																									
INSERT INTO "db_gxpt"."t_swap_fs_config" VALUES ('929030A622A06328FA1DEA04F3022EC4', '', 'drsp_1bjgjrmfyhlw', '2', null, null, '1', '2018-02-07 18:06:52.3', 'getTrialPublish', '1', '0 0 0 * * ？', '', '255', '', '', '30EE6208A16B3408E06202DA9096BE1E', '2', '', 'gbk', '1', '', '1bjgjrmfyhlw', '', '北京市高级人民法院互联网平台自定义拉取(平台拉取)数据', null, '', '2');
INSERT INTO "db_gxpt"."t_swap_fs_config" VALUES ('D5852F31C3E184CCC76F8A912AE92E43', '', 'drsp_1bjgjrmfyhlw', '2', null, null, '1', '2018-02-07 17:58:48.948', 'getCourtScheduledInfoByHttp', '1', '0 0 0 * * ？', '', '255', '', '', '768444383D74B3A7551176ACAAD26C99', '2', '', 'gbk', '1', '', '1bjgjrmfyhlw', '', '北京市高级人民法院互联网平台自定义拉取(平台拉取)数据', null, '', '2');
INSERT INTO "db_gxpt"."t_swap_fs_config" VALUES ('0A46064F746560363FCA410CA9BD4B99', '', 'drsp_1bjgjrmfyhlw', '2', null, null, '1', '2018-02-07 18:42:04.343', 'getCaseInfo', '1', '0 0 0 * * ？', '', '255', '', '', '7834DE9E2D9D04039DCA5C7F1D9BFF0D', '2', '', 'gbk', '1', '', '1bjgjrmfyhlw', '', '北京市高级人民法院互联网平台自定义拉取(平台拉取)数据', null, '', '2');
INSERT INTO "db_gxpt"."t_swap_fs_config" VALUES ('A9B23D1AB192C77A03BE5CF838325EB1', '', 'drsp_1bjgjrmfyhlw', '2', null, null, '1', '2017-12-06 18:01:59.538', 'getUsers', '1', '0 0 0 * * ?', '', '255', '', '', 'A04C9645F0ABF9ED18F22718063B157E', '2', '', '', null, '', '1bjgjrmfyhlw', '', '北京市高级人民法院互联网平台自定义拉取(平台拉取)数据', null, '', '2');
INSERT INTO "db_gxpt"."t_swap_fs_config" VALUES ('60605D0E64879B11EC0B705C6F78CD7A', '', 'drsp_1bjgjrmfyhlw', '2', null, null, '1', '2017-12-06 18:01:02.569', 'getCourtRoomList', '1', '0 0 0 * * ?', '', '255', '', '', 'A3AC5F1B1A5FA63D9596C6462337A5BB', '2', '', '', null, '', '1bjgjrmfyhlw', '', '北京市高级人民法院互联网平台自定义拉取(平台拉取)数据', null, '', '2');
INSERT INTO "db_gxpt"."t_swap_fs_config" VALUES ('057B0AB2D5ABECE25BE9859CCE921EA4', '', 'drsp_1bjgjrmfyhlw', '2', null, null, '1', '2017-12-06 17:58:24.694', 'getMediaServerState', '1', '0 0 0 * * ？', '', '255', '', '', 'ABF20E67A964173DB7F8142AD8B5A0FF', '2', '', '', null, '', '1bjgjrmfyhlw', '', '北京市高级人民法院互联网平台自定义拉取(平台拉取)数据', null, '', '2');
INSERT INTO "db_gxpt"."t_swap_fs_config" VALUES ('2F58C55C226DFEC018A685073DA9D48C', '', 'drsp_1bjgjrmfyhlw', '2', null, null, '1', '2017-12-07 20:58:18.542', 'getDepts', '1', '0 0 0 * * ?', '', '255', '', '', 'B8A876FA568F186E05DB07765DCFDE35', '2', '', 'gbk', '1', '', '1bjgjrmfyhlw', '', '北京市高级人民法院互联网平台自定义拉取(平台拉取)数据', null, '', '2');
INSERT INTO "db_gxpt"."t_swap_fs_config" VALUES ('6B713ABFB93D182F91A8585E7B11D25E', '', 'drsp_1bjgjrmfyhlw', '2', null, null, '1', '2017-12-06 18:04:54.624', 'getStorageState', '1', '0 0 0 * * ？', '', '255', '', '', 'C538BC9C9FEFE01938BB255768BDF616', '2', '', '', null, '', '1bjgjrmfyhlw', '', '北京市高级人民法院互联网平台自定义拉取(平台拉取)数据', null, '', '2');
INSERT INTO "db_gxpt"."t_swap_fs_config" VALUES ('F7B6A68FDD0CD0D4128BFF22335D59D3', '', 'drsp_1bjgjrmfyhlw', '2', null, null, '1', '2018-02-08 09:52:16.679', 'getRecordContentByHttp', '1', '0 0 0 * * ？', '', '255', '', '', '1EECB572DF03E579F7ADF96FA250E7A4', '2', '', 'gbk', '1', '', '1bjgjrmfyhlw', '', '北京市高级人民法院互联网平台自定义拉取(平台拉取)数据', null, '', '2');

INSERT INTO "db_gxpt"."t_swap_js_config" VALUES ('5CACC33C427B442F858FD8D4546F7813', '', 'drsp_1bjgjrmfyhlw', '1', null, '1', '2017-12-06 18:03:24.322', '', '2', '', '', '', '', '2', '', '4', '', '30EE6208A16B3408E06202DA9096BE1E', 'gbk', '1bjgjrmfyhlw', '北京市高级人民法院互联网北京市高级人民法院互联网平台数据库推送(推送客户端)数据', '3669cb9e4498ff4b9919ace0a8849ebc', null, '1', null, '');
INSERT INTO "db_gxpt"."t_swap_js_config" VALUES ('54B6A3EE52D3F2118BFE32E8FDD7830F', '', 'drsp_1bjgjrmfyhlw', '1', null, '1', '2017-12-06 17:55:08.771', '', '2', '', '3ce32f88f16346389318f0031a938426', '', '', '2', '', '4', '', '768444383D74B3A7551176ACAAD26C99', 'gbk', '1bjgjrmfyhlw', '北京市高级人民法院互联网北京市高级人民法院互联网平台数据库推送(推送客户端)数据', '0e3f58455d4cc329b7d698b8313d4dfc', null, '1', null, '');
INSERT INTO "db_gxpt"."t_swap_js_config" VALUES ('D076BBE17D5908835655670B7041674E', '', 'drsp_1bjgjrmfyhlw', '1', null, '1', '2017-12-06 18:04:27.403', '', '2', '', '', '', '', '2', '', '4', '', '7834DE9E2D9D04039DCA5C7F1D9BFF0D', 'gbk', '1bjgjrmfyhlw', '北京市高级人民法院互联网北京市高级人民法院互联网平台数据库推送(推送客户端)数据', '7f178bc788e90781b253c53768dc124c', null, '1', null, '');
INSERT INTO "db_gxpt"."t_swap_js_config" VALUES ('F8BB003778F1A0126F654F476772E3C9', '', 'drsp_1bjgjrmfyhlw', '1', null, '1', '2017-12-06 18:02:21.469', '', '2', '', '', '', '', '2', '', '4', '', 'A04C9645F0ABF9ED18F22718063B157E', 'gbk', '1bjgjrmfyhlw', '北京市高级人民法院互联网北京市高级人民法院互联网平台数据库推送(推送客户端)数据', '83d686f5d88d6719a0d04ac69828bc44', null, '1', null, '');
INSERT INTO "db_gxpt"."t_swap_js_config" VALUES ('CBB501EB8CC8D54E6D9EB6B1F0DB4B82', '', 'drsp_1bjgjrmfyhlw', '1', null, '1', '2017-12-06 18:01:28.019', '', '2', '', '', '', '', '2', '', '4', '', 'A3AC5F1B1A5FA63D9596C6462337A5BB', 'gbk', '1bjgjrmfyhlw', '北京市高级人民法院互联网北京市高级人民法院互联网平台数据库推送(推送客户端)数据', '5ea1d992b21cf9166adbb0cdaaa66424', null, '1', null, '');
INSERT INTO "db_gxpt"."t_swap_js_config" VALUES ('C29733909A751A9BC82DCF79F1F2D9E6', '', 'drsp_1bjgjrmfyhlw', '1', null, '1', '2017-12-08 19:53:39.478', '', '2', '', '', '', '', '2', '', '4', '', 'ABF20E67A964173DB7F8142AD8B5A0FF', 'gbk', '1bjgjrmfyhlw', '北京市高级人民法院互联网北京市高级人民法院互联网平台数据库推送(推送客户端)数据', '512a2655a3a2ec865cb43285c5d0a5f0', null, '2', null, '');
INSERT INTO "db_gxpt"."t_swap_js_config" VALUES ('F0E7DA125268636E7259FEA474225DFF', '', 'drsp_1bjgjrmfyhlw', '1', null, '1', '2017-12-06 18:00:25.29', '', '2', '', '', '', '', '2', '', '4', '', 'B8A876FA568F186E05DB07765DCFDE35', 'gbk', '1bjgjrmfyhlw', '北京市高级人民法院互联网北京市高级人民法院互联网平台数据库推送(推送客户端)数据', 'd5d01775bbcc1b1bd94afcf1bbff3488', null, '1', null, '');
INSERT INTO "db_gxpt"."t_swap_js_config" VALUES ('8107C8AD0B6BA04EA8D14AD6B173E953', '', 'drsp_1bjgjrmfyhlw', '1', null, '1', '2017-12-08 19:52:24.884', '', '2', '', '', '', '', '2', '', '4', '', 'C538BC9C9FEFE01938BB255768BDF616', 'gbk', '1bjgjrmfyhlw', '北京市高级人民法院互联网北京市高级人民法院互联网平台数据库推送(推送客户端)数据', '77db7cdac806de1ebf86a17dd702cd4f', null, '2', null, '');
INSERT INTO "db_gxpt"."t_swap_js_config" VALUES ('95CA876E32AEDDEB6DB7575EAF4D89E0', '', 'drsp_1bjgjrmfyhlw', '1', null, '1', '2017-12-06 17:57:35.706', '', '2', '', '', '', '', '2', '', '4', '', '1EECB572DF03E579F7ADF96FA250E7A4', 'gbk', '1bjgjrmfyhlw', '北京市高级人民法院互联网北京市高级人民法院互联网平台数据库推送(推送客户端)数据', 'a57637b3c943adfa0c96c2964e976812', null, '1', null, '');

INSERT INTO "db_gxpt"."t_swap_jxb" VALUES ('30EE6208A16B3408E06202DA9096BE1E', '2017-12-01 17:45:42', '2018-02-05 18:32:51.441', '30EE6208A16B3408E06202DA9096BE1E', null);
INSERT INTO "db_gxpt"."t_swap_jxb" VALUES ('768444383D74B3A7551176ACAAD26C99', '2017-12-01 18:40:06', '2018-02-06 13:54:25.221', '768444383D74B3A7551176ACAAD26C99', null);
INSERT INTO "db_gxpt"."t_swap_jxb" VALUES ('7834DE9E2D9D04039DCA5C7F1D9BFF0D', '2017-12-01 18:38:40', '2017-12-01 18:38:44', '7834DE9E2D9D04039DCA5C7F1D9BFF0D', null);
INSERT INTO "db_gxpt"."t_swap_jxb" VALUES ('1EECB572DF03E579F7ADF96FA250E7A4', '2017-12-01 18:41:30', '2017-12-01 18:41:36', '1EECB572DF03E579F7ADF96FA250E7A4', null);
INSERT INTO "db_gxpt"."t_swap_jxb" VALUES ('53E9463B329D1986755590C366E93E68', '2016-01-01 00:00:00', '2018-02-07 18:06:59.035', '929030A622A06328FA1DEA04F3022EC4', null);
INSERT INTO "db_gxpt"."t_swap_jxb" VALUES ('8903125979BF7EBB9FD9C57D575F2329', '2016-01-01 00:00:00', '2016-01-01 00:00:00', 'A9B23D1AB192C77A03BE5CF838325EB1', null);
INSERT INTO "db_gxpt"."t_swap_jxb" VALUES ('9A08FA5EB6CAFF4609722E41EA347B9C', '2016-01-01 00:00:00', '2016-01-01 00:00:00', '057B0AB2D5ABECE25BE9859CCE921EA4', null);
INSERT INTO "db_gxpt"."t_swap_jxb" VALUES ('A1D756AADC7BA1BFAE3DE3204D34AB31', '2016-01-01 00:00:00', '2016-01-01 00:00:00', '60605D0E64879B11EC0B705C6F78CD7A', null);
INSERT INTO "db_gxpt"."t_swap_jxb" VALUES ('B71649BCE9023FB71932C31292919661', '2016-01-01 00:00:00', '2018-02-07 17:59:02.498', 'D5852F31C3E184CCC76F8A912AE92E43', null);
INSERT INTO "db_gxpt"."t_swap_jxb" VALUES ('C9EBB8DCA9A7D39A706E9ACB101A4CAF', '2016-01-01 00:00:00', '2016-01-01 00:00:00', '6B713ABFB93D182F91A8585E7B11D25E', null);
INSERT INTO "db_gxpt"."t_swap_jxb" VALUES ('E7E04F340AC45B2F3358B1E2E2EE61C6', '2016-01-01 00:00:00', '2016-01-01 00:00:00', '2F58C55C226DFEC018A685073DA9D48C', null);
INSERT INTO "db_gxpt"."t_swap_jxb" VALUES ('F3EEB91C9B2B697FAA97954F92BE40AB', '2016-01-01 00:00:00', '2018-01-18 00:00:00', '0A46064F746560363FCA410CA9BD4B99', null);

INSERT INTO "db_gxpt"."t_swap_convert_relation" VALUES ('0BCB115871C7025A49B85A7BD821BA11', '30EE6208A16B3408E06202DA9096BE1E', '929030A622A06328FA1DEA04F3022EC4', '5CACC33C427B442F858FD8D4546F7813', 'M_M', '', '3', '', null, 'xml', '6670A7489212AE3335636008C1125836', '1', '2017-12-06 18:03:36.125', '');
INSERT INTO "db_gxpt"."t_swap_convert_relation" VALUES ('23D74305C6713990596C1287DA3D3B9D', 'B8A876FA568F186E05DB07765DCFDE35', '2F58C55C226DFEC018A685073DA9D48C', 'F0E7DA125268636E7259FEA474225DFF', 'M_M', '', '3', '', null, 'xml', 'ECC129F540CFA47F2F865FD9B8606038', '1', '2017-12-06 18:00:41.374', '');
INSERT INTO "db_gxpt"."t_swap_convert_relation" VALUES ('4E2083A8F526E8EC6E83F5D32933C782', '7834DE9E2D9D04039DCA5C7F1D9BFF0D', '0A46064F746560363FCA410CA9BD4B99', 'D076BBE17D5908835655670B7041674E', 'M_M', '', '3', '', null, 'xml', 'EC11EDC634DDDD6B0007C286D3F4EDF6', '1', '2017-12-06 18:04:37.572', '');
INSERT INTO "db_gxpt"."t_swap_convert_relation" VALUES ('FC98EBF4545E3EA6C0D5AF5CE12633BE', 'C538BC9C9FEFE01938BB255768BDF616', '6B713ABFB93D182F91A8585E7B11D25E', '8107C8AD0B6BA04EA8D14AD6B173E953', 'M_M', '', '3', '', null, 'xml', '2A056EEBF0A5E960363C9F28F07657C6', '1', '2017-12-06 18:05:39.79', '');
INSERT INTO "db_gxpt"."t_swap_convert_relation" VALUES ('CBE0E12BFF9C61ACC66A0131C818950C', 'A3AC5F1B1A5FA63D9596C6462337A5BB', '60605D0E64879B11EC0B705C6F78CD7A', 'CBB501EB8CC8D54E6D9EB6B1F0DB4B82', 'M_M', '', '3', '', null, 'xml', 'F9C3186F13F89C0C51E17D6F936CB3A0', '1', '2017-12-06 18:01:40.753', '');
INSERT INTO "db_gxpt"."t_swap_convert_relation" VALUES ('BC6B9A944B15B12404DC1F06F4FB46F6', 'A04C9645F0ABF9ED18F22718063B157E', 'A9B23D1AB192C77A03BE5CF838325EB1', 'F8BB003778F1A0126F654F476772E3C9', 'M_M', '', '3', '', null, 'xml', '52D504CF7CE4C6A6DDD6B9E08F972C47', '1', '2017-12-06 18:02:32.148', '');
INSERT INTO "db_gxpt"."t_swap_convert_relation" VALUES ('AB57BD7C152FB053E533708E9E51D282', '768444383D74B3A7551176ACAAD26C99', 'D5852F31C3E184CCC76F8A912AE92E43', '54B6A3EE52D3F2118BFE32E8FDD7830F', 'M_M', '', '3', '', null, 'xml', 'BCBE0E4BD1F6341ED30B0D6BA4165515', '1', '2017-12-06 17:55:31.861', '');
INSERT INTO "db_gxpt"."t_swap_convert_relation" VALUES ('A589B331F834AB44A6BAFDD2DE94009E', 'ABF20E67A964173DB7F8142AD8B5A0FF', '057B0AB2D5ABECE25BE9859CCE921EA4', 'C29733909A751A9BC82DCF79F1F2D9E6', 'M_M', '', '3', '', null, 'xml', '530062F5194D414470D7519B4ACC29FC', '1', '2017-12-06 17:59:14.35', '');
INSERT INTO "db_gxpt"."t_swap_convert_relation" VALUES ('94803E133DD0B4623BDDC351EE4CCAB5', '1EECB572DF03E579F7ADF96FA250E7A4', 'F7B6A68FDD0CD0D4128BFF22335D59D3', '95CA876E32AEDDEB6DB7575EAF4D89E0', 'M_M', '', '3', '', null, 'xml', '4E938DED12366C6928BD2FEB6EFAC416', '1', '2017-12-06 17:57:46.625', '');

INSERT INTO "db_gxpt"."t_xt_jdxx" VALUES ('6b13b4a8e74e435eb797c90412e9d4e3', '12bjsdezjrmfybjnw', 'drsp-communication-server', 'drsp-communication-server', '172.16.31.8', '8181', '1', '2017-12-06 10:29:44.7', '2017-12-06 10:29:44.7', '', '', '', '');
INSERT INTO "db_gxpt"."t_xt_jdxx" VALUES ('77ec2bc140e047d5927fd0b0bbac0c37', '12', 'drsp', 'drsp', '172.16.9.111', '8081', '1', '2017-12-06 10:30:38.499', '2017-12-06 10:30:38.499', '', '', '', 'MONITOR');
INSERT INTO "db_gxpt"."t_xt_jdxx" VALUES ('9864662c66964110b5b3ebfdedd09935', '1', 'drsp', 'drsp', '172.16.9.110', '8181', '1', '2017-12-06 10:29:07.508', '2017-12-06 10:29:07.508', '', '', '', 'MONITOR');
INSERT INTO "db_gxpt"."t_xt_jdxx" VALUES ('aae2f0338a7847928df914a8d596a7a6', '12bjsdezjrmfybjnw', 'drsp', 'drsp', '172.16.31.8', '8181', '1', '2017-12-06 10:29:57.173', '2017-12-06 10:29:57.173', '', '', '', 'MONITOR');
INSERT INTO "db_gxpt"."t_xt_jdxx" VALUES ('aee45f1c943f4a2da54a3c8a1bad0bfa', '1', 'drsp-communication-server', 'drsp-communication-server', '172.16.9.110', '8181', '1', '2017-12-06 00:00:00', '2017-12-06 10:28:52.126', '', '', '', '');
INSERT INTO "db_gxpt"."t_xt_jdxx" VALUES ('d3bc91a526684709b0087e49f1504c31', '12', 'drsp-communication-server', 'drsp-communication-server', '172.16.9.111', '8081', '1', '2017-12-06 00:00:00', '2017-12-07 20:47:32.761', '', '', '', '');
