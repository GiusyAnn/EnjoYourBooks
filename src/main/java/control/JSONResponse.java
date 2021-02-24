package control;

public class JSONResponse {
		public JSONResponse (boolean ok) {
			this.ok = ok;
			this.message= new String ();
			this.content = null;
		}
		
		public JSONResponse (boolean ok, String message) {
			this.ok = ok;
			this.message = message;
			this.content = null;
		}
		
		public JSONResponse (boolean ok, String message, Object content) {
			this.ok = ok;
			this.message = message;
			this.content = content;
		}
		
		private boolean ok;
		private String message;
		private Object content;

}
