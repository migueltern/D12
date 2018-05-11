
package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import repositories.PuntuationRepository;
import domain.Puntuation;

@Component
@Transactional
public class StringToPuntuationConverter implements Converter<String, Puntuation> {

	@Autowired
	private PuntuationRepository	puntuationRepository;


	@Override
	public Puntuation convert(final String text) {

		Puntuation result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.puntuationRepository.findOne(id);

			}

		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}

		return result;
	}
}
