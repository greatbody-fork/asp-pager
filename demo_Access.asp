<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%Option Explicit%>
<!--#include file="Cls_Page.asp"-->
<%
Dim startime,endtime
startime=timer()

Dim Db,Conn,rs,nav,rc,Page,i
Db = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("db/IP.mdb")
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.open Db
%>
<html>
<head>
<title>Ҷ��ASP��ҳ��-access����ʾ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
div {float:left;width:25%;}
</style>
</head>
<body>
<div>ID</div><div>����</div><div>����</div><div>ʱ��</div>
<%
Set Page = new Cls_Page				'��������
Set Page.Conn = conn				'�õ����ݿ����Ӷ���
With Page
	.PageSize = 10					'ÿҳ��¼����
	.PageParm = "p"					'ҳ����
	'.PageIndex = 10				'��ǰҳ����ѡ������һ�������ɾ�̬ʱ��Ҫ
	.Database = "ac"				'���ݿ�����,ACΪaccess,MSSQLΪsqlserver2000�洢���̰�,MYSQLΪmysql,PGSQLΪPostGreSql
	.Pkey="MID"						'����
	.Field="MID,ip2,country,city"	'�ֶ�
	.Table="dv_address"				'����
	.Condition=""					'����,����Ҫwhere
	.OrderBy=""						'����,����Ҫorder by,��Ҫasc����desc
	.RecordCount = -1				'�ܼ�¼���������ⲿ��ֵ��0�����棨�ʺ���������-1��Ϊsession��-2��Ϊcookies��-3��Ϊapplacation

	.NumericJump = 5 '��������ҳ��������ѡ������Ĭ��Ϊ3������Ϊ��ת������0Ϊ��ʾ����
	.Template = "�ܼ�¼����{$RecordCount} ��ҳ����{$PageCount} ÿҳ��¼����{$PageSize} ��ǰҳ����{$PageIndex} {$FirstPage} {$PreviousPage} {$NumericPage} {$NextPage} {$LastPage} {$InputPage} {$SelectPage}" '����ģ�壬��ѡ��������Ĭ��ֵ
	.FirstPage = "��ҳ" '��ѡ��������Ĭ��ֵ
	.PreviousPage = "��һҳ" '��ѡ��������Ĭ��ֵ
	.NextPage = "��һҳ" '��ѡ��������Ĭ��ֵ
	.LastPage = "βҳ" '��ѡ��������Ĭ��ֵ
	.NumericPage = " {$PageNum} " '���ַ�ҳ����ģ�壬��ѡ��������Ĭ��ֵ
End With

rs = Page.ResultSet() '��¼��
'rc = Page.RowCount() '��ѡ������ܼ�¼��
nav = Page.Nav() '��ҳ��ʽ

If IsNull(rs) Then
	Response.Write "<div >���޼�¼</div>"
Else
	For i=0 To Ubound(rs,2)
		Response.Write "<div>"&rs(0,i)&"</div><div>"&rs(1,i)&"</div><div>"&rs(2,i)&"</div><div>"&rs(3,i)&"</div>"
	Next
End If
%>
<br><%Response.Write nav%>
<br><%endtime=timer()%>��ҳ��ִ��ʱ�䣺<%=FormatNumber((endtime-startime)*1000,3)%>����
</body>
</html>
<%
Page = Null
Set Page = Nothing
%>