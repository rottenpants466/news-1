/*
* Copyright (c) 2019 Manexim (https://github.com/manexim)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Marius Meisenzahl <mariusmeisenzahl@gmail.com>
*/

public class Widgets.ArticleCarouselItem : Gtk.FlowBoxChild {
    public Models.Article article { get; construct set; }
    private Widgets.Image icon;
    private Widgets.Image source_icon;
    private Gtk.Label source_label;
    private Gtk.Box source;
    private Gtk.Label title;
    private Gtk.Label age;

    public ArticleCarouselItem (Models.Article article) {
        Object (article: article);
    }

    construct {
        if (article.image != null) {
            icon = new Widgets.Image.from_url (article.image);
            icon.scale (320, 180);

        } else {
            icon = new Widgets.Image ();
        }
        icon.halign = Gtk.Align.CENTER;

        article.favicon = "https://elementary.io/favicon.ico";
        if (article.favicon != null) {
            source_icon = new Widgets.Image.from_url (article.favicon);
            source_icon.scale_height (18);
        } else {
            source_icon = new Widgets.Image ();
        }
        source_icon.halign = Gtk.Align.START;


        source_label = new Gtk.Label ("elementary Blog");
        source_label.halign = Gtk.Align.START;
        source_label.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);

        source = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        source.pack_start (source_icon, false, false, 0);
        source.pack_start (source_label, false, false, 8);

        title = new Gtk.Label (article.title);
        title.halign = Gtk.Align.START;
        title.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);

        age = new Gtk.Label (Granite.DateTime.get_relative_datetime (article.published));
        age.halign = Gtk.Align.START;

        var grid = new Gtk.Grid ();
        grid.column_spacing = 12;
        grid.row_spacing = 3;
        grid.margin = 6;
        grid.attach (icon, 0, 0, 1, 1);
        grid.attach (source, 0, 1, 1, 1);
        grid.attach (title, 0, 2, 1, 1);
        grid.attach (age, 0, 3, 1, 1);

        add (grid);
    }
}
