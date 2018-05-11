
package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.Puntuation;

@Component
@Transactional
public class PuntuationToStringConverter implements Converter<Puntuation, String> {

	@Override
	public String convert(final Puntuation Puntuation) {
		String result;

		if (Puntuation == null)
			result = null;
		else
			result = String.valueOf(Puntuation.getId());
		return result;
	}
}
