<#include "/macro.include"/>
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.dao.query;

<#include "/java_imports.include">
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * ${comments}
 * @author lixon
 * @version 1.0
 * @since 1.0
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ${className}Query extends BaseQuery implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    
	<@generateFields/>
	<@generateProperties/>


	
}

<#macro generateFields>

	<#list table.columns as column>
	/** ${column.columnAlias} */
	<#if column.isDateTimeColumn && !column.contains("begin,start,end")>
	private ${column.javaType} ${column.columnNameLower}Begin;
	private ${column.javaType} ${column.columnNameLower}End;
	<#else>
	private ${column.javaType} ${column.columnNameLower};
	</#if>
	</#list>

</#macro>

<#macro generateProperties>
	<#list table.columns as column>
	<#if column.isDateTimeColumn && !column.contains("begin,start,end")>
	public ${column.javaType} get${column.columnName}Begin() {
			return this.${column.columnNameLower}Begin;
	}

	public void set${column.columnName}Begin(${column.javaType} value) {
			this.${column.columnNameLower}Begin = value;
	}

	public ${column.javaType} get${column.columnName}End() {
			return this.${column.columnNameLower}End;
	}

	public void set${column.columnName}End(${column.javaType} value) {
			this.${column.columnNameLower}End = value;
	}

	<#else>
	</#if>
	</#list>
</#macro>





