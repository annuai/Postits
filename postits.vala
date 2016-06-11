using Gtk;
using Gdk;
using GLib;
using Sqlite;

public class PostitsGUI : Gtk.Window {
	  public bool on_delete_event () {
		  Gtk.main_quit();
		  return false;
		  }
		  
		  public PostitsGUI(string bufferTxt=""){
			  
			  this.title = "Window";
			  this.set_default_size(200, 120);
			  this.delete_event.connect(this.on_delete_event);
			  this.set_border_width(0);
			 //Required when always_on_top function activate, not required since GNOME already has it embedded to Window Manager 
			 //this.set_keep_above(true);
			  
			  var vBox = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
			  var hBox = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
			  
			  var headerbar = new Gtk.HeaderBar();
			  headerbar.set_show_close_button(false);
			  this.set_titlebar(headerbar);
			  vBox.pack_start(headerbar, false, false, 0);
			  
			  var addBtn = new Gtk.Button();
			  addBtn.clicked.connect(on_addBtn_clicked);
			  addBtn.set_alignment(0, 10);
			  headerbar.pack_start(addBtn);
			  addBtn.show();
			  
			  // Set Image to addBtn
			  var addBtnImage = new Gtk.Image();
			  addBtnImage.set_from_file("images/add.png");
			  addBtn.add(addBtnImage);
			  addBtnImage.show();
			  
			  var closeBtn = new Gtk.Button();
			  closeBtn.clicked.connect(on_closeBtn_clicked);
			  closeBtn.set_alignment(1, 10);
			  headerbar.pack_end(closeBtn);
			  closeBtn.show();
			  
			  // Set Image to closeBtn
			  var closeBtnImage = new Gtk.Image();
			  closeBtnImage.set_from_file("images/close.png");
			  closeBtn.add(closeBtnImage);
			  closeBtnImage.show();
			  
			  vBox.pack_start(hBox, false, false, 0);
			  
			  //Intended for Horizontal Spacing Requirements
			  var spaceHbox = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
			  
			  var buffer = new Gtk.TextBuffer (null); //stores text to be displayed
			  buffer.set_text(bufferTxt);
			  
			  var textview = new Gtk.TextView.with_buffer (buffer); //displays TextBuffer
			  textview.set_wrap_mode (Gtk.WrapMode.WORD); //sets line wrapping
			  textview.set_size_request (100, 170);
			  spaceHbox.pack_start(textview,false,false,10);
			  vBox.pack_start(spaceHbox,false, false, 5);
			  
			  this.add(vBox);
			  vBox.show();
			  this.show();

		  }
		  
		  private void on_addBtn_clicked(Button button)
		  {
			  var label = button.get_label();
			  stdout.printf("%s was clicked!\n", label);
			  var window = new PostitsGUI("Another Hello");
			  window.show_all();
  
		  }
		  
		  private void on_closeBtn_clicked()
		  {
			  this.hide();
		  }
		  protected void initializeNotes(){
			  sqliteHandler handle=new sqliteHandler();
			  //Needs to implement total number of records in db as for loop max
			  for(i=0;i<4;i++){
				  var window = new PostitsGUI(handle.getNote(i,"note"));				  
			  }
			  
		  }
	  }
	  

		  
		  public static int main (string[] args) {
			  Gtk.init(ref args);
			  
			  sqliteHandler sqlitehandle1=new sqliteHandler();
			  sqlitehandle1.sqlitehandle("SELECT notes FROM ");
			  
			  var css = "postits.css";
			  var provider = new Gtk.CssProvider();
			  provider.load_from_path(css);
			  Gtk.StyleContext.add_provider_for_screen(Gdk.Screen.get_default(),provider,Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
            
			  var window = new PostitsGUI("Hello");
			  window.show_all();
			  
			  /* And of course, our mainloop. */
			  Gtk.main();
			  
			  /* Control returns here when Gtk.main_quit() is called. */
			  return 0;

  }
  //I dont really know how it all came together, glad that all is working!
