package sctea



import org.junit.*
import grails.test.mixin.*

@TestFor(RapportController)
@Mock(Rapport)
class RapportControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/rapport/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.rapportInstanceList.size() == 0
        assert model.rapportInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.rapportInstance != null
    }

    void testSave() {
        controller.save()

        assert model.rapportInstance != null
        assert view == '/rapport/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/rapport/show/1'
        assert controller.flash.message != null
        assert Rapport.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/rapport/list'

        populateValidParams(params)
        def rapport = new Rapport(params)

        assert rapport.save() != null

        params.id = rapport.id

        def model = controller.show()

        assert model.rapportInstance == rapport
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/rapport/list'

        populateValidParams(params)
        def rapport = new Rapport(params)

        assert rapport.save() != null

        params.id = rapport.id

        def model = controller.edit()

        assert model.rapportInstance == rapport
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/rapport/list'

        response.reset()

        populateValidParams(params)
        def rapport = new Rapport(params)

        assert rapport.save() != null

        // test invalid parameters in update
        params.id = rapport.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/rapport/edit"
        assert model.rapportInstance != null

        rapport.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/rapport/show/$rapport.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        rapport.clearErrors()

        populateValidParams(params)
        params.id = rapport.id
        params.version = -1
        controller.update()

        assert view == "/rapport/edit"
        assert model.rapportInstance != null
        assert model.rapportInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/rapport/list'

        response.reset()

        populateValidParams(params)
        def rapport = new Rapport(params)

        assert rapport.save() != null
        assert Rapport.count() == 1

        params.id = rapport.id

        controller.delete()

        assert Rapport.count() == 0
        assert Rapport.get(rapport.id) == null
        assert response.redirectedUrl == '/rapport/list'
    }
}
