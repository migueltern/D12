
package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import repositories.CategoryMaterialRepository;
import domain.CategoryMaterial;

@Component
@Transactional
public class StringToCategoryMaterialConverter implements Converter<String, CategoryMaterial> {

	@Autowired
	private CategoryMaterialRepository	CategoryMaterialRepository;


	@Override
	public CategoryMaterial convert(final String text) {

		CategoryMaterial result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.CategoryMaterialRepository.findOne(id);

			}

		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}

		return result;
	}
}
