// Base Stm object for namespacing
var Stm = Stm || {};

(function($){
	"use strict";


	/* Multiple items creator */
	Stm.ItemManager = function(base, options) {
		this.base = $(base).get(0);
		if (!this.base) return this;
		this.container = $('.item-manager', this.base).get(0);
		this.tmpl = $('.template', this.base).get(0);
		this.button = $('.add-item', this.base).get(0);
		this.remove_selector = '.remove-item, .close';
		this.tmpl_data = {};
		this.after_add = null;
		$.extend(this, options);

		var self = this;
		$(this.button).click(function(e){
			e.preventDefault();
			self.add(self.tmpl_data);
		});
		this.index = 0;
		this.items = [];
		$(this.container).children().each(function(){
			self.add({}, this);
		});
		this.base.itemManager = this;
		return this;
	};

	Stm.ItemManager.prototype.add = function(data, item) {
		data['index'] = this.index++;
		item = item || $(this.tmpl).tmpl(data).hide().appendTo(this.container).fadeIn();
		item = $(item);

		if ($.type(this.remove_selector) == 'string') {
			item.on('click', this.remove_selector, {item: item.get(0)}, this.remove);
		}

		this.items.push(item.get(0));

		// Call after_add callback
		if ($.type(this.after_add) == 'function') this.after_add.call(this, item.get(0));

		return false;
	};

	Stm.ItemManager.prototype.remove = function(e) {
		e.preventDefault();
		$(e.data.item).fadeOut(function() {
			$(this).remove();
		});
	};


	/**
	 * Image picker helper. Uses Wordpress Media manager
	 * @param container
	 * @param options
	 * @param media
	 * @constructor
	 */
	Stm.ImagePicker = function(container, options, media) {
		this.container = $(container).get(0);
		if (!this.container) return this;
		this.button_selector = '.btn:not(.remove)';
		this.remove_selector = '.btn.remove';
		this.input_selector = 'input';
		this.image_selector = 'img';
		this.media_options = {
			title: "Select an image",
			library: {
				type: 'image'
			},
			button: {
				text: "Select"
			},
			multiple: false
		};

		/**
		 * Which value of selected image to store
		 * @type {string}
		 */
		this.value_key = 'id';

		this.preview = true;

		$.extend(this, options);

		if (typeof media != 'undefined') $.extend(this.media_options, media);

		this.button = $(this.button_selector, this.container).get(0);
		this.remove = $(this.remove_selector, this.container).get(0);
		this.input = $(this.input_selector, this.container).get(0);

		var self = this;

		$(this.remove).on('click', function(event) {
			event.preventDefault();
			$(self.input).val('');
			$(self.image_selector, self.container).remove();
			$(this).hide();
		});
		if (!$(this.input).val()) $(this.remove).hide();

		$(this.button).on('click', function(e) {
			e.preventDefault();
			if (typeof(self.picker) != 'undefined') {
				self.picker.remove();
				self.picker.modal.remove();
				delete(self.picker);
			}
			self.picker = wp.media(self.media_options);
			self.picker.on('select', function() {
				var image = self.picker.state().get('selection').first().toJSON();
				if (self.preview) {
					var $img = $(self.image_selector, self.container);
					if ($img.size() == 0) {
						$img = $('<img />').prependTo(self.container);
					}
					$img.attr('src', image.url);
				}
				$(self.input).val(image[self.value_key]);
				$(self.remove).show();
			});
			self.picker.open();
		});

		this.container.image_picker = this;
		return this;
	};


	/* Disabled, enabled state dependency */
	Stm.StateDependency = function(elem, options) {
		this.elem = $(elem).get(0);
		this.mode = 'enable';
		this.selector = '';
		$.extend(this, options);

		if (!this.elem || !this.selector) return this;
		this.affects = $(this.selector).get();

		$(elem).on('change.stm', $.proxy(this.changed, this)).trigger('change.stm');

		return this;
	};

	Stm.StateDependency.prototype.changed = function(e) {
		var state = $(e.target).prop('checked');
		$(this.affects).prop('disabled', this.mode == 'enable' ? !state : state);
	};


	// Layout selector integrates with WidgetManager
	Stm.LayoutManager = function(switcher, widget_managers) {
		if (!$(switcher).size) return;
		this.base = $(switcher).get(0);
		this.sizes = {};
		this.selected = null;
		this.input = $(':input.value', switcher).get(0);
		this.trigger = $('.trigger', switcher).get(0);
		this.name= $('.name', switcher).get(0);
		this.widget_managers = widget_managers || [];
		var me = this;

		// collect layout max sizes
		$(this.base).find('.layout').each(function() {
			var $this = $(this);
			me.sizes[$this.data('layout')] = $this.data('size');
			if ($this.hasClass('active')) {
				me.selected = this;
				if (typeof $this.data('name') !== 'undefined') $(me.name).text($this.data('name'));
			}
		});

		// assign layout sizes to each widget manager
		$.each(this.widget_managers, function(i, manager) {
			manager.layout_sizes = me.sizes;
		});

		$(this.base).on('click', '.trigger', $.proxy(this.open, this));
		$(this.base).on('click', '.layout', $.proxy(this.layout_change, this));
	};

	Stm.LayoutManager.prototype.open = function(e) {
		$('.layouts', this.base).collapse('toggle');
		return false;
	};

	Stm.LayoutManager.prototype.layout_change = function(e) {
		var $elem = $(e.currentTarget);

		if (!$elem.is(this.selected)) {
			$(this.base).find('.active').removeClass('active');
			$elem.addClass('active');
			this.selected = $elem.get(0);
			var layout = $elem.data('layout');
			var layout_value = $elem.data('value');
			var name = $elem.data('name');
			if (typeof layout_value == 'undefined') layout_value = layout;

			// set input value
			$(this.input).val(layout_value);
			// set layout name
			if (typeof name != 'undefined') $(this.name).html(name);

			// trigger WidgetManagers
			$.each(this.widget_managers, $.proxy(function(i, wm) {
				if(layout == wm.layout) { //same layout
					return false;
				}
				wm.change_layout(layout);
			}, this));
		}

		// close selector
		$('.layouts', this.base).collapse('hide');
		return false;
	};


	/** Radio tabs **/

	Stm.RadioTabs = function(tabs) {
		this.tabs = $(tabs).get(0);
		if (!this.tabs) return this;
		this.radios = $(':radio', this.tabs).get();
		this.buttons = [];
		this.targets = [];
		var that = this;
		$(this.radios)
			.each(function(){
				var selector = $(this).data('target');
				var target = $(selector).get(0);
				if (target) {
					that.targets.push(target);
					$(target).hide();
				}
				var button = $(this).closest('.btn').get(0);
				if (button) that.buttons.push(button);
			})
			.on('click.radiotab', function(){
				$(that.buttons).removeClass('active');
				$(that.targets).hide();
				$(this).closest('.btn').addClass('active');
				var selector = $(this).data('target');
				$(selector).show();
			})
			.filter(':checked').trigger('click.radiotab')
		;
		//$(this.buttons).button();
		return this;
	};


})(jQuery);

