﻿/*======================================================================*//**
 * 
 * Progression
 * 
 * @author Copyright (c) 2007-2008 taka:nium
 * @version 3.0.8
 * @see http://progression.jp/
 * 
 * Developed by taka:nium
 * @see http://nium.jp/
 * 
 * Progression is (c) 2007-2008 taka:nium and is released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 * 
 */
package jp.progression.scenes {
	import jp.progression.core.collections.SceneCollection;
	import jp.progression.core.namespaces.progression_internal;
	
	use namespace progression_internal;
	
	/*======================================================================*//**
	 * <p>指定された group と同じ値を持つ SceneObject インスタンスを含む配列を返します。</p>
	 * <p></p>
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9.0.45.0
	 * 
	 * @param group
	 * 	<p>条件となるストリングです。</p>
	 * 	<p></p>
	 * @param sort
	 * 	<p>配列をソートするかどうかを指定します。</p>
	 * 	<p></p>
	 * @return
	 * 	<p>条件と一致するインスタンスです。</p>
	 * 	<p></p>
	 * 
	 * @example <listing version="3.0" >
	 * </listing>
	 */
	public function getScenesByGroup( group:String, sort:Boolean = false ):Array {
		return SceneCollection.progression_internal::__getInstancesByGroup( group, sort );
	}
}









