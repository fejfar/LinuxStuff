public class FormatNames91823742112347912874928 {
	public static void main(String args[]) {
		String str = "";

			for (int i = 0; i < args.length; i++) {
			
				args[i] = args[i].substring(0, 1).toUpperCase()
						+ args[i].substring(1);

			str = str + args[i];
		}

		str = "\"" + str + "\"";

		String formatada = formater(str);

		System.out.println(formatada);

	}

	static String formater(String str) {
		String formatada = str.replaceAll("[()]", "-").replace("'", "")
				.replace(" ", "").replace("ã", "a").replace("ç", "c").replace("í","i").replace("â", "a")
				.replace("á", "a").replace("ó", "o").replace("ô","o").replace("õ", "o").replace("_", "")
				.replace("é", "e").replace(",", "").replace("\"", "");
		return formatada;
	}
}
