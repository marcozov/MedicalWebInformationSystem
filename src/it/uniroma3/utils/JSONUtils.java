package it.uniroma3.utils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map.Entry;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonObject;

import it.uniroma3.model.IndicatoreRisultato;
import it.uniroma3.model.Prerequisito;

public class JSONUtils {
	
	private static List<String> getList(String jsonArray) {
		List<String> list = new ArrayList<>();
		String[] elements = new Gson().fromJson(jsonArray, String[].class);
		if (elements == null)
			return Collections.emptyList();
		Collections.addAll(list, elements);
		return list;
	}
	
	private static List<List<String>> getName2ValueList(String jsonArray) {
		List<List<String>> name2valueList = new ArrayList<>();
		String[][] name2valueArray = new Gson().fromJson(jsonArray, String[][].class);
		if (name2valueArray == null) 
			return Collections.emptyList();
		for (String s[] : name2valueArray)  {
			List<String> list = new ArrayList<>();
			Collections.addAll(list, s);
			name2valueList.add(list);
		}
		return name2valueList;
	}
	
	public static List<Prerequisito> getPrerequisiti(String jsonArray) {
		List<Prerequisito> pre = new ArrayList<>();
		for (List<String> name2value : getName2ValueList(jsonArray))
			pre.add(new Prerequisito(name2value.get(0), name2value.get(1)));
		return pre;
	}
	
	public static List<IndicatoreRisultato> getIndicatoriRisultato(String jsonArray) {
		List<IndicatoreRisultato> indicatori = new ArrayList<>();
		for (String nome : getList(jsonArray))
			indicatori.add(new IndicatoreRisultato(nome));
		
		return indicatori;
	}
	
	
}
