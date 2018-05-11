
package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.PickUp;

@Component
@Transactional
public class PickUpToStringConverter implements Converter<PickUp, String> {

	@Override
	public String convert(final PickUp PickUp) {
		String result;

		if (PickUp == null)
			result = null;
		else
			result = String.valueOf(PickUp.getId());
		return result;
	}
}
