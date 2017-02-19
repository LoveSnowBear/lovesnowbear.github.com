package sample.skills.table.test;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bstek.dorado.utils.StringHelper;
import com.bstek.dorado.utils.xml.XmlBuilder;
import com.bstek.dorado.utils.xml.XmlDocument;
import com.bstek.dorado.utils.xml.XmlFactory;
import com.bstek.dorado.utils.xml.XmlNode;
import com.bstek.dorado.utils.xml.XmlParseException;

public class ColumnHelper {

	public static Map getColumnInfos() throws XmlParseException, IOException {
		Map map = new HashMap();
		String resource = "TableEvents.view.xml";
		String controlId = "tableEmployee";
		try {
			InputStream in = ColumnHelper.class.getResourceAsStream(resource);
			if (in != null) {
				try {
					XmlBuilder builder = XmlFactory.createXmlBuilder();
					XmlDocument doc = builder.buildDocument(in);
					XmlNode tableNode = doc.getNodeById(controlId);

					XmlNode[] columnNodes = tableNode.getNodesByXPath("Column");
					for (int i = 0; i < columnNodes.length; i++) {
						String columnName = columnNodes[i].getAttribute("name");
						String label = getLabel(doc, columnNodes[i]);
						Map scripts = getScripts(columnNodes[i]);

						List list = new ArrayList();
						list.add(columnName);
						list.add(label);
						list.add(scripts);

						map.put(columnName, list);
					}
				} finally {
					in.close();
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return map;
	}

	private static String getLabel(XmlDocument doc, XmlNode columnNode) {
		String datasetId = columnNode.getParent().getAttribute("dataset");
		XmlNode datasetNode = doc.getNodeById(datasetId);

		String label = columnNode.getAttribute("label");
		if (StringHelper.isEmpty(label)) {
			String fieldName = columnNode.getAttribute("field");
			XmlNode fieldNode = getFieldNode(datasetNode, fieldName);
			if (fieldNode != null) {
				label = fieldNode.getAttribute("label");
			}
		}
		return label;
	}

	private static Map getScripts(XmlNode columnNode) {
		Map map = new HashMap();
		XmlNode eventsNode = columnNode.getChild("Events");
		if (eventsNode != null) {
			XmlNode[] eventNodes = eventsNode.getChildren();
			for (int i = 0; i < eventNodes.length; i++) {
				XmlNode eventNode = eventNodes[i];
				String eventName = eventNode.getAttribute("name");
				String script = eventNode.getContent();
				if (StringHelper.isNotEmpty(script)) {
					map.put(eventName, script);
				}
			}
		}
		return map;
	}

	private static XmlNode getFieldNode(XmlNode datasetNode, String fieldName) {
		XmlNode node = null;
		XmlNode fieldsNode = datasetNode.getChild("Fields");
		if (fieldsNode != null) {
			XmlNode[] fields = fieldsNode.getChildren();
			for (int i = 0; i < fields.length; i++) {
				XmlNode field = fields[i];
				if (field.getAttribute("name").equals(fieldName)) {
					node = field;
					break;
				}
			}
		}
		return node;
	}
}
