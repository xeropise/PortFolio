package com.mmm.common.handler;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;

@MappedJdbcTypes(JdbcType.TIME)
public class CustomTimeHandler extends BaseTypeHandler<Time> {

	@Override
	public Time getNullableResult(ResultSet rs, String columnName) throws SQLException {
		Timestamp sqlTimestamp = rs.getTimestamp(columnName);
		if (sqlTimestamp != null) {
			return new Time(sqlTimestamp.getTime());
		}
		return null;
	}

	@Override
	public Time getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		Timestamp sqlTimestamp = rs.getTimestamp(columnIndex);
		if (sqlTimestamp != null) {
			return new Time(sqlTimestamp.getTime());
		}		
		return null;
	}

	@Override
	public Time getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
	
		return cs.getTime(columnIndex);
	}

	@Override
	public void setNonNullParameter(PreparedStatement ps, int columnIndex, Time parameter, JdbcType jdbcType) throws SQLException {
		// TODO Auto-generated method stub
		ps.setTime(columnIndex, parameter);
	}

}
