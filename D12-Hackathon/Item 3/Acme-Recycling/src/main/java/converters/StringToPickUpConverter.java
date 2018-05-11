
package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import repositories.PickUpRepository;
import domain.PickUp;

@Component
@Transactional
public class StringToPickUpConverter implements Converter<String, PickUp> {

	@Autowired
	private PickUpRepository	PickUpRepository;


	@Override
	public PickUp convert(final String text) {

		PickUp result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.PickUpRepository.findOne(id);

			}

		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}

		return result;
	}
}
