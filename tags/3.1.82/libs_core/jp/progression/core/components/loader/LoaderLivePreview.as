﻿/**
 * Progression 3
 * 
 * @author Copyright (C) 2007-2010 taka:nium.jp, All Rights Reserved.
 * @version 3.1.82
 * @see http://progression.jp/
 * 
 * Progression IDE is released under the Progression License:
 * http://progression.jp/en/overview/license
 * 
 * Progression Libraries is released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */
package jp.progression.core.components.loader {
	import flash.text.TextField;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	import jp.nium.core.errors.ErrorMessageConstants;
	import jp.progression.core.components.CoreLivePreview;
	import jp.progression.Progression;
	
	/**
	 * @private
	 */
	public class LoaderLivePreview extends CoreLivePreview {
		
		/**
		 */
		private var _param:TextField;
		
		
		
		
		
		/**
		 * @private
		 */
		public function LoaderLivePreview() {
			// 継承せずにオブジェクト化されたらエラーを送出する
			if ( getQualifiedSuperclassName( this ) == getQualifiedClassName( CoreLivePreview ) ) { throw new ArgumentError( ErrorMessageConstants.getMessage( "ERROR_2012", "LoaderLivePreview" ) ); }
			
			// 参照を取得する
			_param = TextField( getChildByName( "param" ) );
			_param.text = "ver " + Progression.VERSION.toString().split( " - " )[0];
		}
	}
}
