(function($){
	"use strict";

	var AudioPlayer = function (element) {
		if (element.nodeName == 'A') {
			$(element).hide();
			this.widget = $('#audio-player-template').tmpl().insertAfter(element).get(0);
			this.url = $(element).attr('href');
		} else {
			this.widget = $(element).get(0);
			this.url = $(this.widget).data('src');
		}

		if (!this.widget) return this;

		this.widget.audioplayer = this;

		var player, that = this;

		this.getUrl = function () {
			return that.url;
		};

		this.isPlaying = function() {
			return player.isPlaying();
		};

		this.play = function() {
			// Pause all playing players before starting this one
			$('.audio-player-playing').each(function(i,v){
				v.audioplayer.pause();
			});
			player.play();
			return this;
		};

		this.pause = function() {
			player.pause();
			return this;
		};

		this.stop = function() {
			player.stop();
			//this.updateDisplay();
			$('.audio-play-bar', this.widget).css({
				width: 0
			});
			$('.fa-play', this.widget).show();
			$('.fa-pause', this.widget).hide();
			return this;
		};

		this.seek = function(percent) {
			if (!that.isPlaying()) {
				that.play();
			}
			player.seek(percent);
			return this;
		};

		this.volume = function(fraction) {
			fraction = fraction > 1 ? 1 : fraction;
			player.volume(fraction);
			return this;
		};

		this.toggleMute = function(mute) {
			player.toggleMute(mute);
			return this;
		};

		// Update button image, progress bars, time
		this.updateDisplay = function () {
			// Get info from player
			var info = player.getInfo();
			// Set button image based on play/pause (check current and change if necessary)
			if  (info.is_playing) {
				$('.fa-play', this.widget).hide();
				$('.fa-pause', this.widget).show();
				$(this.widget).addClass('audio-player-playing');
			}
			else {
				$('.fa-play', this.widget).show();
				$('.fa-pause', this.widget).hide();
				$(this.widget).removeClass('audio-player-playing');
			}
			// Set bar positions
			$('.audio-play-bar', this.widget).css({
				left: String((info.playable_start/info.duration) * 100 || 0) + '%',
				width: String((info.position - info.playable_start) / info.duration * 100 || 0) + '%'
			});
			$('.audio-seek-bar', this.widget).css({
				left: String((info.playable_start/info.duration) * 100 || 0) + '%',
				width: String((info.playable_end - info.playable_start) / info.duration * 100 || 0) + '%'
			});

			if (info.playable_end == info.duration) {
				$('.audio-seek-bar', this.widget).closest('.progress').removeClass('active');
			}

			// Set time
			var min = Math.floor(info.position / 60);
			var sec = Math.floor(info.position % 60);
			var time_string = min + ':';
			if ( sec < 10 ) {
				time_string += '0'; // Add leading 0 to seconds if necessary
			}
			time_string += sec;
			$('.audio-current-time', this.widget).text(time_string);
			$('.audio-volume-bar', this.widget).css({
				width: String(info.volume * 100 || 0) + '%'
			});
			if (info.muted) {
				$('.fa-volume-off', this.widget).hide();
				$('.fa-volume-up', this.widget).show();
			}
			else {
				$('.fa-volume-off', this.widget).show();
				$('.fa-volume-up', this.widget).hide();
			}
			return this;
		};

		// Initialize the player
		player = new this.Model(this);
		//this.player = player;

		// Toggle play/pause on click and style the player
		$('.fa-play', this.widget).click(function(){
			if ( ! that.isPlaying() ) {
				that.play();
			}
			return false;
		});
		$('.fa-pause', this.widget).click(function(){
			if ( that.isPlaying() ) {
				that.pause();
			}
			return false;
		});
		$('.fa-stop', this.widget).click(function(){
			that.stop();
			return false;
		});

		// Click bar to seek
		$('.audio-bar', this.widget).mouseup(function (e) {
			if ( e.pageX ) {
				var percent = ( e.pageX - $(this).offset().left ) / $(this).width();
				that.seek(percent);
			}
			return false;
		});

		// Click volume
		$('.audio-volume', this.widget).mouseup(function (e) {
			if ( e.pageX ) {
				var fraction = ( e.pageX - $(this).offset().left ) / $(this).width();
				that.volume(fraction).updateDisplay();
			}
			return false;
		});
		$('.fa-volume-up', this.widget).click(function(){
			that.toggleMute(false).updateDisplay();
			return false;
		});
		$('.fa-volume-off', this.widget).click(function(){
			that.toggleMute(true).updateDisplay();
			return false;
		});

		this.updateDisplay();

		return this;
	}

	/*
	 * HTML5 player
	 *
	 * This contains controls and event handling for the native player
	 */
	function AudioPlayerHTML5 (parent) {
		var player = document.createElement('audio');
		var that = this;
		this.player = player;

		this.parent = parent;
		player.src = parent.getUrl();
		player.volume = 1;
		$(player).bind('play pause stop ended timeupdate progress canplaythrough', parent.updateDisplay);

		this.isPlaying = function () {
			return !player.paused;
		};

		this.getInfo = function () {
			var start, end;
			try {
				start = player.seekable.start(0);
				end = player.seekable.end(0);
			}
			catch (e) {
				start = 0;
				end = 0;
			}
			return {
				is_playing: that.isPlaying(),
				position: player.currentTime,
				duration: player.duration,
				playable_start: start,
				playable_end: end,
				volume: player.volume,
				muted: player.muted
			};
		};

		this.play = function () {
			player.play();
		};

		this.pause = function () {
			player.pause();
		};

		this.stop = function () {
			player.pause();
			player.currentTime = 0;
		};

		this.seek = function ( fraction ) {
			player.currentTime = player.duration * fraction;
		};

		this.volume = function ( level ) {
			player.volume = level;
		};

		this.toggleMute = function ( mute ) {
			player.muted = mute;
		};

		return this;
	}


	/*
	 * SoundManager2 player
	 *
	 * This contains controls and event handling for the Flash player
	 */
	function AudioPlayerSM2 (parent) {
		var that = this;
		this.parent = parent;
		var player = soundManager.createSound({
			id: (parent.widget.id && $('#' + parent.widget.id).length === 1) ? parent.widget.id : 'audio-player-' + String(Math.random()).split('.')[1] + String((new Date()).getTime()),
			url: parent.getUrl(),
			onplay: parent.updateDisplay,
			onresume: parent.updateDisplay,
			onpause: parent.updateDisplay,
			onstop: parent.updateDisplay,
			onfinish: parent.updateDisplay,
			whileplaying: parent.updateDisplay,
			whileloading: parent.updateDisplay,
			volume: 100
		});
		this.player = player;

		this.isPlaying = function () {
			return !(player.paused || player.playState === 0);
		};

		this.getInfo = function () {
			return {
				is_playing: that.isPlaying(),
				position: player.position / 1000 || 0,
				duration: (((player.bytesLoaded == player.bytesTotal) ? player.duration : player.durationEstimate) / 1000) || 0,
				playable_start: 0,
				playable_end: ((player.bytesLoaded / player.bytesTotal) * player.duration) / 1000 || 0,
				volume: player.volume / 100,
				muted: player.muted
			};
		};

		this.play = function () {
			player.togglePause();
		};

		this.pause = function () {
			player.togglePause();
		};

		this.stop = function () {
			player.stop();
		};

		this.seek = function ( fraction ) {
			/*if ( !that.isPlaying() ) {
				that.play();
			}*/
			player.setPosition(((player.bytesLoaded == player.bytesTotal) ? player.duration : player.durationEstimate) * fraction);
		};

		this.volume = function ( level ) {
			player.setVolume(level * 100);
		};

		this.toggleMute = function (mute) {
			if (mute)
				player.mute();
			else
				player.unmute();
		};

		return this;
	}


	/*
	 * ready
	 *
	 * When is loaded, style and autoplay. Consider moving autoplay to the AudioPlayer object (play if autoplay and no .audio-player-playing).
	 */
	function audioplayerReady () {
		// Autoplay
		if ( $('.audio-player-autoplay:first').length ) {
			$('.audio-player-autoplay:first')[0].audioplayer.play();
		}
	}


	/*
	 * Initialize players
	 *
	 * Detect HTML5 support, set player to either HTML5 or SM2, and initialize players
	 */
	$(document).ready(function($){
		var audioplayer_selector = '.audio-player, .audio-player-autoplay';

		// Handle all mp3 links if selected
		//$('a[href$='+'mp3]').addClass('audio-player');
		// Detect HTML5
		var _audioplayer_html5 = document.createElement('audio');
		if (!!(_audioplayer_html5.canPlayType && _audioplayer_html5.canPlayType('audio/mpeg;').replace(/no/, ''))) {
			AudioPlayer.prototype.Model = AudioPlayerHTML5;
			$(audioplayer_selector).each(function(i,v){
				v.audioplayer = new AudioPlayer(v);
			});
			audioplayerReady();
		}
		// SoundManager2 fallback
		else {
			if ( typeof soundManager !== 'object' ) {
				$.getScript( Theme.template_directory_uri + '/js/sm2/soundmanager2-nodebug-jsmin.js', function () {
					if ( typeof soundManager === 'object' ) {
						soundManager.debugMode = false;
						soundManager.url =  Theme.template_directory_uri + '/js/sm2/';
						soundManager.nullURL = 'about:blank'; //_audioplayer.url + '/sm2/null.mp3';
						soundManager.useHighPerformance = true;
						soundManager.useFastPolling = false;
						soundManager.waitForWindowLoad = false;
						soundManager.onready(function(){
							$(audioplayer_selector).each(function(i,v){
								v.audioplayer = new AudioPlayer(v);
							});
							audioplayerReady();
						});
					}
				});
			}
			AudioPlayer.prototype.Model = AudioPlayerSM2;
		}
	});
	
})(jQuery);
