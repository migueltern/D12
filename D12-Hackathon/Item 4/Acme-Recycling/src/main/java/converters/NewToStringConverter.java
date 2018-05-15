
package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.New;

@Component
@Transactional
public class NewToStringConverter implements Converter<New, String> {

	@Override
	public String convert(final New New) {
		String result;

		if (New == null)
			result = null;
		else
			result = String.valueOf(New.getId());
		return result;
	}
}
