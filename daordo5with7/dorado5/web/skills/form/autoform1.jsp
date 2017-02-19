<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../../sample-center.css"/>
</head>
<body style="overflow: hidden">
  <d:View config="sample.skills.form.AutoForm1">
    <d:TabSet id="tabset1" height="100%">
      <d:Tab name="tab1" label="组合框样式" padding="12">
        <d:AutoForm id="formGroupBox">
          <d:FormElementRenderer group="group1" element="element4">
            <div class="hint">
              <d:Layout type="Hflow">
                <d:Pane style="white-space: nowrap">
                    此处是通过JSP中的FormElementRenderer<br>
                    标签实现的自定义区域
                </d:Pane>
                <d:Pane width="20">                  
                </d:Pane>
                <d:Pane>
                  <d:Button id="button1" />
                </d:Pane>
                <d:Pane>
                  <d:Button id="button2" />
                </d:Pane>
                <d:Pane>
                  <d:Button id="button3" />
                </d:Pane>
              </d:Layout>
            </div>
          </d:FormElementRenderer>
        </d:AutoForm>
      </d:Tab>
      <d:Tab name="tab2" label="子窗体样式" padding="8">
        <d:AutoForm id="formSubWindow" />
      </d:Tab>
    </d:TabSet>
  </d:View>
</body>
</html>
