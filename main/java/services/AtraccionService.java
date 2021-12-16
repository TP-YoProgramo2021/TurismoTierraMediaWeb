package services;

import java.util.List;

import model.Atraccion;
import model.TipoDeAtraccion;
import persistence.dao.AtraccionesDAO;
import persistence.impl.AtraccionDAOImplement;
import persistence.commons.DAOFactory;

public class AtraccionService {

	public List<Atraccion> list() {
		return DAOFactory.getAtraccionDAO().findAll();
	}

	public Atraccion create(String name, Integer cost, Double duration, Integer capacity) {

		Atraccion attraction = new Atraccion(-1, name, cost, duration, capacity);

		if (attraction.isValid()) {
			AtraccionesDAO attractionDAO = DAOFactory.getAtraccionDAO();
			attractionDAO.insert(attraction);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return attraction;
	}

	public Atraccion update(String name, Integer cost, Double duration, Integer capacity,
			TipoDeAtraccion tipo_atraccion) {
		Atraccion atraccion = new Atraccion(name, cost, duration, capacity, tipo_atraccion);
		if (atraccion.isValid()) {
			DAOFactory.getAtraccionDAO().update(atraccion);

		}
		return atraccion;
	}

	public void delete(String nombre) {
		AtraccionDAOImplement atrDAO = (AtraccionDAOImplement) DAOFactory.getAtraccionDAO();
		atrDAO.borradoLogico(nombre);
	}

	public Atraccion find(String nombre) {
		AtraccionesDAO atraccionDAO = DAOFactory.getAtraccionDAO();
		return atraccionDAO.findByAtrName(nombre);
	}

}
