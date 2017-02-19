<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.bstek.com/dorado" prefix="d" %>
<html>
<body>
  <d:View config="sample.admin.StartSampleMaintain">
    <d:Layout type="border" width="600"  width="600">
      <d:Pane position="top">
        <d:Layout type="Hflow">
          <d:Pane>
            <d:DataPilot id="datapilotStartSample" />
          </d:Pane>
          <d:Pane>
            <d:Button id="buttonSave" />
          </d:Pane>
        </d:Layout>
      </d:Pane>
      <d:Pane position="center">
        <d:DataTable id="tableStartSample" />
      </d:Pane>
    </d:Layout>
  </d:View>
</body>
</html>
