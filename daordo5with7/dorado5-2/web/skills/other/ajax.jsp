<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body>
  <d:View config="sample.skills.other.AJAX">
    <p class="hint" style="width: 100%">
      以下的各种AJAX效果均是利用dorado5中的RPCCommand控件实现的。
      利用RPCCommand开发人员可以在Client端以同步或异步的方式直接调用Server端的逻辑代码，
      使页面的逻辑变得更加清晰、操作更加连贯。
    </p>
    <table width="100%">
      <tr style="background-color: #F5F7F9">
        <td>在Server端完成数学运算1:</td>
        <td>
          <d:Layout type="Hflow">
            <d:Pane>
              <d:TextEditor id="editorNum1" />
            </d:Pane>
            <d:Pane align="center" width="16">
              X
            </d:Pane>
            <d:Pane>
              <d:TextEditor id="editorNum2" />
            </d:Pane>
            <d:Pane>
              <d:Button id="buttonMultiply" />
            </d:Pane>
            <d:Pane>
              <d:TextEditor id="editorNum3" />
            </d:Pane>
          </d:Layout>
        </td>
      </tr>
      <tr>
        <td>在Server端完成数学运算2:</td>
        <td>
          <d:Layout type="Hflow">
            <d:Pane>
              <d:TextEditor id="editorNum4" />
            </d:Pane>
            <d:Pane align="center" width="16">
              /
            </d:Pane>
            <d:Pane>
              <d:TextEditor id="editorNum5" />
            </d:Pane>
            <d:Pane>
              <d:Button id="buttonDivide" />
            </d:Pane>
            <d:Pane>
              <d:TextEditor id="editorNum6" />
            </d:Pane>
          </d:Layout>
        </td>
      </tr>
      <tr style="background-color: #F5F7F9">
        <td>比较耗时的Server端的操作:</td>
        <td>
          <d:Button id="buttonHeavyOperation" />
        </td>
      </tr>
      <tr>
        <td>自动获取Server端的信息:</td>
        <td>
          JVM空闲内存:&nbsp;<LABEL id="labelFreeMemory"> === </LABEL>(KB),&nbsp;
          JVM总内存:&nbsp;<LABEL id="labelTotalMemory"> === </LABEL>(KB)
          <d:Layout type="Hflow">
            <d:Pane>
              <d:ProgressBar id="progressbarMemory"/>
            </d:Pane>
            <d:Pane>
              <DIV id="labelGetSystemInfoRetrieving" style="width: 8; height: 8; overflow: hidden; border-width: 1; border-color: Maroon; border-style: solid"></DIV>
            </d:Pane>
            <d:Pane style="font-size: 8pt">
              retrieving
            </d:Pane>
          </d:Layout>
          <d:Layout type="Hflow">
            <d:Pane width="100">
              采样间隔(<LABEL id="labelInterval">2</LABEL>秒):
            </d:Pane>
            <d:Pane>
              <d:ScrollBar id="scrollbarInterval" />
            </d:Pane>
          </d:Layout>
        </td>
      </tr>
      <tr style="background-color: #F5F7F9">
        <td>利用Dataset提取数据:</td>
        <td>
          请输入一个员工的ID: (etc: ANLIN, PANLONG, CHENGYU, ZHENGQI, XULIJUN, NAXIN, JINYI)
          <br>
          <d:TextEditor id="editorEmployeeId" />&nbsp;
          <d:Button id="buttonRetrieveData1" />&nbsp;
          <d:Button id="buttonRetrieveData2" />
        </td>
      </tr>
    </table>
  </d:View>
</body>
</html>
