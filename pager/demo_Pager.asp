<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%Option Explicit%>
<!--#include file="Cls_Pager.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
</head>
<body>
<%
Dim Pager
Set Pager = new Cls_Pager
With Pager
	.PageSize = 9 'ÿҳ��¼��,��ѡ������Ĭ��Ϊ10
	'.PageCount = 50 '��ҳ��,���ѡ����,PageCount��RecordCount����ָ����һ����2�߶�ָ����RecordCount����
	.RecordCount = 100 '�ܼ�¼��,���ѡ����,PageCount��RecordCount����ָ����һ����2�߶�ָ����RecordCount����
	.NumericJump = 3 '��������ҳ��������ѡ������Ĭ��Ϊ3������Ϊ��ת������0Ϊ��ʾ����
	'.PageIndex = Request("P") '��ǰҳ������ѡ���������Ϊ������ҳ����ȡֵ��ʵ����������������ɾ�̬ҳ���
	'.PageUrl = "demo_Pager.asp?P={$PageNum}&a=2" '������ģ�壬��ѡ������ͬ���������ɾ�̬ҳ���
	.PageParm = "pa" 'ҳ��������ѡ������Ĭ��Ϊ'p'�����PageIndex��PageUrlָ������˲���ָ��
	.Template = "<div style='pager'>�ܼ�¼����{$RecordCount} ��ҳ����{$PageCount} ÿҳ��¼����{$PageSize} ��ǰҳ����{$PageIndex} {$FirstPage} {$PreviousPage} {$NumericPage} {$NextPage} {$LastPage} {$InputPage} {$SelectPage}</div>" '����ģ�壬��ѡ��������Ĭ��ֵ
	.FirstPage = "��ҳ" '��ѡ��������Ĭ��ֵ
	.PreviousPage = "��һҳ" '��ѡ��������Ĭ��ֵ
	.NextPage = "��һҳ" '��ѡ��������Ĭ��ֵ
	.LastPage = "βҳ" '��ѡ��������Ĭ��ֵ
	.NumericPage = " {$PageNum} " '���ַ�ҳ����ģ�壬��ѡ��������Ĭ��ֵ
End With

Response.Write Pager.Nav()
%>
</body>
</html>