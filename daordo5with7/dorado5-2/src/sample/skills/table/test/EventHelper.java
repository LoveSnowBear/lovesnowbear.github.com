package sample.skills.table.test;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import com.bstek.dorado.common.log.Log;
import com.bstek.dorado.utils.xml.XmlBuilder;
import com.bstek.dorado.utils.xml.XmlDocument;
import com.bstek.dorado.utils.xml.XmlFactory;
import com.bstek.dorado.utils.xml.XmlNode;
import com.bstek.dorado.utils.xml.XmlParseException;

public class EventHelper {
	public static final String SYS_EVENTS_KEY = "View.Events";
	private static Map controls = null;

	public static Map getControlEvents(String control) {
		Map controls = getAllControls();
		return (Map) controls.get(control);
	}

	public static Map getAllControls() {
		if (controls != null) {
			return controls;
		} else {
			controls = new HashMap();
			try {
				InputStream in = EventHelper.class
						.getClassLoader()
						.getResourceAsStream("com/bstek/dorado/view/events.xml");
				if (in != null) {
					try {
						XmlBuilder builder = XmlFactory.createXmlBuilder();
						XmlDocument doc = builder.buildDocument(in);
						XmlNode root = doc.getRootNode().getChild("eventSets");
						XmlNode[] controlNodes = root.getChildren();

						for (int i = 0; i < controlNodes.length; i++) {
							XmlNode controlNode = controlNodes[i];
							String controlName = controlNode
									.getAttribute("name");

							Map events = new HashMap();
							XmlNode[] eventNodes = controlNode.getChildren();
							for (int j = 0; j < eventNodes.length; j++) {
								String name = eventNodes[j]
										.getAttribute("name");
								String parameters = eventNodes[j]
										.getAttribute("parameters");
								events.put(name, parameters);
							}
							controls.put(controlName, events);
						}
					} finally {
						in.close();
					}
				}

			} catch (XmlParseException ex) {
				Log.error(ex);
			} catch (IOException ex) {
				Log.error(ex);
			}

			return controls;
		}
	}

}
